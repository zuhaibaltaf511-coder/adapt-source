--[[==========================================================================
	KAWATAN HUB  |  ANTI BAT EDITION   v3.0
	--------------------------------------------------------------------------
	Light-blue theme over a custom background image. Compact "Envy" layout:

	  Anti Bat      — keybind O   (velocity countermeasure, one-frame 1000 XZ)
	  Inf Jump      — keybind I   (tap + hold jump)
	  Anti Ragdoll  — keybind R   (auto-stand, re-enables motors)
	  GUI Toggle    — keybind LCTRL (minimize / expand hub)
	  Save Config   — persists keybinds + toggles to a file

	USAGE
	  1. Paste into a supported executor.
	  2. Drag the hub from its header. Click a KEY chip to rebind it
	     (press any key). Click a card or its switch to toggle. LCTRL to
	     minimize.

	BACKGROUND IMAGE
	  The window uses BG_IMAGE_URL below as its background. If your
	  executor's client blocks http images (shows a blank/placeholder),
	  replace the URL with an asset id:  "rbxassetid://1234567890"

	NOTE: Use responsibly — anti-bat scripts can violate game rules and
	risk your account. Built for private / learning use only.
============================================================================]]

-- ============================ SERVICES =====================================
local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService     = game:GetService("TweenService")

local player = Players.LocalPlayer

local container = (function()
	local ok, gethui = pcall(function() return gethui() end)
	if ok and type(gethui) == "function" then
		local ok2, hui = pcall(gethui)
		if ok2 and hui then return hui end
	end
	return game:GetService("CoreGui")
end)()

-- background image (swap for rbxassetid://... if http is blocked)
local BG_IMAGE_URL = "https://kastor-box.lovable.app/api/public/f/69qi3lg1.png"

-- ============================ THEME ========================================
local theme = {
	primary      = Color3.fromRGB(24, 146, 232),   -- main light blue
	primaryLight = Color3.fromRGB(124, 205, 250),
	primaryDark  = Color3.fromRGB(13, 104, 190),
	accent       = Color3.fromRGB(41, 199, 255),

	card         = Color3.fromRGB(226, 242, 255),  -- frosted light blue card
	cardHover    = Color3.fromRGB(238, 248, 255),
	strip        = Color3.fromRGB(210, 232, 250),
	chip         = Color3.fromRGB(255, 255, 255),
	border       = Color3.fromRGB(120, 190, 240),
	borderSoft   = Color3.fromRGB(160, 210, 245),

	text         = Color3.fromRGB(10, 42, 70),     -- deep navy-blue
	textSub      = Color3.fromRGB(60, 110, 150),
	onColor      = Color3.fromRGB(24, 146, 232),
	offTrack     = Color3.fromRGB(165, 205, 235),
	shadow       = Color3.fromRGB(5, 40, 90),
	overlayHi    = Color3.fromRGB(208, 234, 255),  -- light-blue overlay (top)
	overlayLo    = Color3.fromRGB(120, 190, 248),  -- light-blue overlay (bottom)
}

local F = {
	B  = Enum.Font.GothamBold,
	SB = Enum.Font.GothamSemibold,
	M  = Enum.Font.GothamMedium,
}

-- ============================ STATE ========================================
local AntiBatEnabled          = false
local InfiniteJumpEnabled     = false
local InfiniteJumpHoldEnabled = false
local AntiRagdollEnabled      = true
local IsJumpingHold           = false

local AntiBatConn     = nil
local AntiRagdollConn = nil
local JumpHoldConn    = nil

local antiBatKey = Enum.KeyCode.O
local infJumpKey = Enum.KeyCode.I
local antiRagKey = Enum.KeyCode.R
local guiKey     = Enum.KeyCode.LeftControl
local waitingFor = nil           -- "antibat" | "infjump" | "antirag" | "gui"

local configFile = "KawatanHub_Config.txt"
local WIN_W, WIN_H = 252, 356
local minimized = false

-- ============================ HELPERS ======================================
local function tween(obj, props, time, style, dir)
	style = style or Enum.EasingStyle.Quad
	dir   = dir or Enum.EasingDirection.Out
	local tw = TweenService:Create(obj, TweenInfo.new(time or 0.2, style, dir), props)
	tw:Play()
	return tw
end

local function corner(f, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius)
	c.Parent = f
	return c
end

local function stroke(f, color, thickness)
	local s = Instance.new("UIStroke")
	s.Color = color or theme.border
	s.Thickness = thickness or 1
	s.Parent = f
	return s
end

local function text(parent, size, pos, str, color, font, textSize, xAlign)
	local l = Instance.new("TextLabel")
	l.Size = size
	l.Position = pos
	l.BackgroundTransparency = 1
	l.BorderSizePixel = 0
	l.Text = str
	l.TextColor3 = color or theme.text
	l.Font = font or F.SB
	l.TextSize = textSize or 12
	l.TextXAlignment = xAlign or Enum.TextXAlignment.Left
	l.TextYAlignment = Enum.TextYAlignment.Center
	l.Parent = parent
	return l
end

local function pointInFrame(f, p)
	local ap, as = f.AbsolutePosition, f.AbsoluteSize
	return p.X >= ap.X and p.X <= ap.X + as.X and p.Y >= ap.Y and p.Y <= ap.Y + as.Y
end

local function keyName(k)
	local n = k.Name:upper()
	n = n:gsub("CONTROL", "CTRL"):gsub("LEFT", "L"):gsub("RIGHT", "R")
	return n
end

-- ============================ NOTIFY =======================================
local notifFolder = Instance.new("Frame")
notifFolder.Size = UDim2.fromOffset(300, 0)
notifFolder.Position = UDim2.new(1, -14, 0, 14)
notifFolder.AnchorPoint = Vector2.new(1, 0)
notifFolder.BackgroundTransparency = 1
notifFolder.ZIndex = 60

local function notify(title, desc, glyph)
	local card = Instance.new("Frame")
	card.Size = UDim2.fromOffset(288, 52)
	card.Position = UDim2.new(1, 320, 0, 0)
	card.AnchorPoint = Vector2.new(1, 0)
	card.BackgroundColor3 = theme.card
	card.BackgroundTransparency = 0.15
	card.ZIndex = 60
	corner(card, 12)
	stroke(card, theme.border, 1)
	card.Parent = notifFolder

	local chip = Instance.new("Frame")
	chip.Size = UDim2.fromOffset(34, 34)
	chip.Position = UDim2.new(0, 9, 0.5, -17)
	chip.BackgroundColor3 = theme.primary
	corner(chip, 9)
	chip.Parent = card
	text(chip, UDim2.fromScale(1, 1), UDim2.fromScale(0, 0), glyph or "◈", Color3.fromRGB(255, 255, 255), F.SB, 16, Enum.TextXAlignment.Center)

	text(card, UDim2.fromOffset(200, 16), UDim2.new(0, 52, 0, 7), title, theme.text, F.B, 13)
	text(card, UDim2.fromOffset(220, 14), UDim2.new(0, 52, 0, 26), desc, theme.textSub, F.M, 11)

	tween(card, { Position = UDim2.new(1, -306, 0, 0) }, 0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	task.delay(2.6, function()
		tween(card, { Position = UDim2.new(1, 320, 0, 0), BackgroundTransparency = 1 }, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		task.delay(0.3, function() card:Destroy() end)
	end)
end

-- ==================== ANTI BAT CORE (your logic) ===========================
local function startAntiBat()
	local char = player.Character
	if not char then return end
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return end
	if AntiBatConn then AntiBatConn:Disconnect() end
	AntiBatConn = RunService.Heartbeat:Connect(function()
		if not root or not root.Parent then return end
		local origXZ = Vector3.new(root.Velocity.X, 0, root.Velocity.Z)
		root.Velocity = Vector3.new(1000, root.Velocity.Y, 1000)
		RunService.RenderStepped:Wait()
		root.Velocity = Vector3.new(origXZ.X, root.Velocity.Y, origXZ.Z)
	end)
end

local function stopAntiBat()
	if AntiBatConn then
		AntiBatConn:Disconnect()
		AntiBatConn = nil
	end
end

-- ==================== ANTI RAGDOLL (your logic) ============================
local function startAntiRagdoll()
	if AntiRagdollConn then return end
	AntiRagdollConn = RunService.Heartbeat:Connect(function()
		local char = player.Character
		if not char then return end
		local hum2 = char:FindFirstChildOfClass("Humanoid")
		local root = char:FindFirstChild("HumanoidRootPart")
		if hum2 then
			local st = hum2:GetState()
			if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown then
				hum2:ChangeState(Enum.HumanoidStateType.Running)
				workspace.CurrentCamera.CameraSubject = hum2
				pcall(function()
					local pm = player.PlayerScripts:FindFirstChild("PlayerModule")
					if pm then require(pm:FindFirstChild("ControlModule")):Enable() end
				end)
				if root then
					root.Velocity = Vector3.new(0, 0, 0)
					root.RotVelocity = Vector3.new(0, 0, 0)
				end
			end
		end
		for _, obj in ipairs(char:GetDescendants()) do
			if obj:IsA("Motor6D") and not obj.Enabled then
				obj.Enabled = true
			end
		end
	end)
end

local function stopAntiRagdoll()
	if AntiRagdollConn then
		AntiRagdollConn:Disconnect()
		AntiRagdollConn = nil
	end
end

-- ==================== INFINITE JUMP (your logic) ===========================
local function startJumpHoldLoop()
	if JumpHoldConn then JumpHoldConn:Disconnect() end
	JumpHoldConn = RunService.Heartbeat:Connect(function()
		if not InfiniteJumpHoldEnabled or not IsJumpingHold then return end
		local char = player.Character
		if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		if root then
			root.Velocity = Vector3.new(root.Velocity.X, 55, root.Velocity.Z)
		end
	end)
end

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.Space or input.UserInputType == Enum.UserInputType.Touch then
		IsJumpingHold = true
	end
end)

UserInputService.InputEnded:Connect(function(input, gp)
	if input.KeyCode == Enum.KeyCode.Space or input.UserInputType == Enum.UserInputType.Touch then
		IsJumpingHold = false
	end
end)

UserInputService.JumpRequest:Connect(function()
	if not InfiniteJumpEnabled then return end
	local char = player.Character
	if not char then return end
	local root = char:FindFirstChild("HumanoidRootPart")
	if root then
		root.Velocity = Vector3.new(root.Velocity.X, 55, root.Velocity.Z)
	end
end)

-- ============================ WINDOW =======================================
local gui = Instance.new("ScreenGui")
gui.Name = "KawatanHub"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = container

notifFolder.Parent = gui

-- drop shadow (behind the window)
local shadow = Instance.new("Frame")
shadow.Size = UDim2.fromOffset(WIN_W + 8, WIN_H + 8)
shadow.Position = UDim2.fromOffset(40 - 4, 92 + 4)
shadow.BackgroundColor3 = theme.shadow
shadow.BackgroundTransparency = 0.35
shadow.ZIndex = 0
corner(shadow, 22)
shadow.Parent = gui

local win -- forward-declared (used by updateShadow)

local function updateShadow()
	local w, h = win.AbsoluteSize.X, win.AbsoluteSize.Y
	if w <= 0 or h <= 0 then w, h = WIN_W, WIN_H end -- pre-layout fallback
	tween(shadow, { Size = UDim2.fromOffset(w + 8, h + 8) }, 0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
end

-- window surface
win = Instance.new("Frame")
win.Name = "Window"
win.Size = UDim2.fromOffset(WIN_W, WIN_H)
win.Position = UDim2.fromOffset(40, 92)
win.BackgroundTransparency = 1
win.ClipsDescendants = true
corner(win, 18)
win.Parent = gui

local winCorner = win:FindFirstChildOfClass("UICorner")

-- ============================ BACKGROUND IMAGE =============================
local bg = Instance.new("ImageLabel")
bg.Size = UDim2.fromScale(1, 1)
bg.Position = UDim2.fromScale(0, 0)
bg.BackgroundTransparency = 1
bg.Image = BG_IMAGE_URL
bg.ScaleType = Enum.ScaleType.Crop
bg.ZIndex = 0
corner(bg, 18)
bg.Parent = win

-- light-blue wash so the window stays readable and on-theme
local wash = Instance.new("Frame")
wash.Size = UDim2.fromScale(1, 1)
wash.BackgroundColor3 = Color3.fromRGB(150, 205, 255)
wash.BackgroundTransparency = 0.62
wash.ZIndex = 1
corner(wash, 18)
wash.Parent = win

local washGrad = Instance.new("UIGradient")
washGrad.Color = ColorSequence.new(theme.overlayHi, theme.overlayLo)
washGrad.Transparency = NumberSequence.new(0.35, 0.55)
washGrad.Rotation = 90
washGrad.Parent = wash

-- ============================ HEADER =======================================
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.fromOffset(WIN_W, 44)
header.Position = UDim2.fromOffset(0, 0)
header.BackgroundColor3 = theme.primary
header.BackgroundTransparency = 0.10
header.ZIndex = 5
corner(header, 18)
stroke(header, Color3.fromRGB(96, 178, 240), 1)
header.Parent = win

local headerGrad = Instance.new("UIGradient")
headerGrad.Color = ColorSequence.new(
	Color3.fromRGB(94, 190, 248),
	Color3.fromRGB(17, 120, 200)
)
headerGrad.Rotation = 90
headerGrad.Parent = header

-- decorative soft circles
for _, cfg in ipairs({ { -18, -28, 88 }, { 186, -46, 118 } }) do
	local deco = Instance.new("Frame")
	deco.Size = UDim2.fromOffset(cfg[3], cfg[3])
	deco.Position = UDim2.fromOffset(cfg[1], cfg[2])
	deco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	deco.BackgroundTransparency = 0.12
	deco.BorderSizePixel = 0
	corner(deco, cfg[3] / 2)
	deco.Parent = header
end

local logo = Instance.new("Frame")
logo.Size = UDim2.fromOffset(28, 28)
logo.Position = UDim2.new(0, 9, 0.5, -14)
logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logo.BackgroundTransparency = 0.16
corner(logo, 9)
logo.Parent = header
text(logo, UDim2.fromScale(1, 1), UDim2.fromScale(0, 0), "K", Color3.fromRGB(255, 255, 255), F.B, 16, Enum.TextXAlignment.Center)

text(header, UDim2.fromOffset(110, 18), UDim2.new(0, 44, 0, 5), "Kawatan Hub", Color3.fromRGB(255, 255, 255), F.B, 14)
text(header, UDim2.fromOffset(120, 12), UDim2.new(0, 44, 0, 25), "anti-bat system", Color3.fromRGB(226, 244, 255), F.M, 9)

local verChip = Instance.new("Frame")
verChip.Size = UDim2.fromOffset(34, 14)
verChip.Position = UDim2.new(1, -66, 0.5, -7)
verChip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
verChip.BackgroundTransparency = 0.22
corner(verChip, 7)
verChip.Parent = header
text(verChip, UDim2.fromScale(1, 1), UDim2.fromScale(0, 0), "v3.0", Color3.fromRGB(255, 255, 255), F.B, 7.5, Enum.TextXAlignment.Center)

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.fromOffset(24, 24)
minBtn.Position = UDim2.new(1, -27, 0.5, -12)
minBtn.BackgroundTransparency = 1
minBtn.BorderSizePixel = 0
minBtn.Text = "–"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.Font = F.SB
minBtn.TextSize = 16
minBtn.ZIndex = 8
minBtn.Parent = header
corner(minBtn, 8)

-- ============================ MINIMIZE =====================================
local function setMinimized(v)
	minimized = v
	minBtn.Text = v and "+" or "–"
	if v then
		tween(win, { Size = UDim2.fromOffset(WIN_W, 44) }, 0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		tween(winCorner, { CornerRadius = UDim.new(0, 12) }, 0.28)
		task.delay(0.2, function()
			for _, c in ipairs(win:GetChildren()) do
				if c:IsA("Frame") and c ~= header then c.Visible = false end
			end
			updateShadow()
		end)
	else
		for _, c in ipairs(win:GetChildren()) do
			if c:IsA("Frame") and c ~= header then c.Visible = true end
		end
		tween(win, { Size = UDim2.fromOffset(WIN_W, WIN_H) }, 0.32, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		tween(winCorner, { CornerRadius = UDim.new(0, 18) }, 0.32)
		task.delay(0.3, updateShadow)
	end
end

minBtn.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		setMinimized(not minimized)
	end
end)

-- ============================ DRAG (screen-space, jitter-free) ==============
local dragging = false
local dragStart = Vector2.zero
local winStart = UDim2.new(0, 0, 0, 0)

header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		local mpos = UserInputService:GetMouseLocation()
		if pointInFrame(minBtn, mpos) then return end
		if minimized then setMinimized(false) return end
		dragging = true
		dragStart = mpos
		winStart = win.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not dragging then return end
	if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end

	local mpos = UserInputService:GetMouseLocation()
	local delta = mpos - dragStart
	local vp = workspace.CurrentCamera and workspace.CurrentCamera:GetViewportSize() or Vector2.new(1920, 1080)
	local w, h = win.AbsoluteSize.X, win.AbsoluteSize.Y
	if w <= 0 or h <= 0 then w, h = WIN_W, WIN_H end

	local nx = math.clamp(winStart.X.Offset + delta.X, -w + 40, vp.X - 40)
	local ny = math.clamp(winStart.Y.Offset + delta.Y, 2, vp.Y - 30)

	win.Position = UDim2.fromOffset(nx, ny)
	shadow.Position = UDim2.fromOffset(nx - 4, ny + 4)
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

-- ============================ CARD BUILDER =================================
local function makeCard(y, icon, title, keyChipLabel)
	local card = Instance.new("Frame")
	card.Size = UDim2.new(1, -16, 0, 66)
	card.Position = UDim2.fromOffset(8, y)
	card.BackgroundColor3 = theme.card
	card.BackgroundTransparency = 0.12
	card.ZIndex = 3
	corner(card, 12)
	stroke(card, theme.borderSoft, 1)
	card.Parent = win
	card:SetAttribute("State", false)

	-- icon chip
	local iconChip = Instance.new("Frame")
	iconChip.Size = UDim2.fromOffset(28, 28)
	iconChip.Position = UDim2.new(0, 10, 0, 9)
	iconChip.BackgroundColor3 = theme.primary
	iconChip.BackgroundTransparency = 0.86
	corner(iconChip, 9)
	iconChip.Parent = card
	text(iconChip, UDim2.fromScale(1, 1), UDim2.fromScale(0, 0), icon, theme.primaryDark, F.B, 13, Enum.TextXAlignment.Center)

	-- title + status pill
	local titleLabel = text(card, UDim2.fromOffset(120, 14), UDim2.new(0, 46, 0, 7), title, theme.text, F.B, 12)

	local statusPill = Instance.new("Frame")
	statusPill.Size = UDim2.fromOffset(84, 14)
	statusPill.Position = UDim2.new(0, 46, 0, 24)
	statusPill.BackgroundColor3 = theme.strip
	statusPill.BackgroundTransparency = 0.4
	statusPill.ZIndex = 4
	corner(statusPill, 7)
	statusPill.Parent = card
	local statusLabel = text(statusPill, UDim2.fromScale(1, 1), UDim2.fromScale(0, 0), "○ INACTIVE", theme.textSub, F.B, 7.5, Enum.TextXAlignment.Center)

	-- switch
	local sw = Instance.new("Frame")
	sw.Size = UDim2.fromOffset(38, 21)
	sw.Position = UDim2.new(1, -12, 0, 9)
	sw.AnchorPoint = Vector2.new(1, 0)
	sw.BackgroundColor3 = theme.offTrack
	sw.ZIndex = 4
	corner(sw, 11)
	sw.Parent = card
	local knob = Instance.new("Frame")
	knob.Size = UDim2.fromOffset(17, 17)
	knob.Position = UDim2.fromOffset(2, 2)
	knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	corner(knob, 9)
	stroke(knob, theme.borderSoft, 1)
	knob.Parent = sw

	-- keybind strip
	local strip = Instance.new("Frame")
	strip.Size = UDim2.new(1, -20, 0, 18)
	strip.Position = UDim2.new(0, 10, 0, 46)
	strip.BackgroundColor3 = theme.strip
	strip.BackgroundTransparency = 0.35
	strip.ZIndex = 4
	corner(strip, 5)
	strip.Parent = card

	text(strip, UDim2.fromOffset(34, 18), UDim2.new(0, 8, 0, 0), "KEY", theme.textSub, F.B, 8)

	local keyChip = Instance.new("TextButton")
	keyChip.Name = "KeyChip"
	keyChip.Text = keyChipLabel or "—"
	keyChip.Font = F.B
	keyChip.TextSize = 8
	keyChip.TextColor3 = theme.primaryDark
	keyChip.BackgroundColor3 = theme.chip
	keyChip.BackgroundTransparency = 0.18
	keyChip.BorderSizePixel = 0
	keyChip.ZIndex = 5
	keyChip.Size = UDim2.fromOffset(math.max(36, #keyChip.Text * 6 + 12), 13)
	keyChip.Position = UDim2.new(0, 42, 0.5, -6)
	keyChip.Parent = strip
	stroke(keyChip, theme.borderSoft, 1)
	corner(keyChip, 4)

	text(strip, UDim2.fromOffset(80, 18), UDim2.new(1, -84, 0, 0), "click to rebind", theme.textSub, F.M, 7, Enum.TextXAlignment.Right)

	local function setSwitch(on, animate)
		if animate then
			tween(sw, { BackgroundColor3 = on and theme.onColor or theme.offTrack }, 0.2)
			tween(knob, { Position = on and UDim2.fromOffset(19, 2) or UDim2.fromOffset(2, 2) }, 0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		else
			sw.BackgroundColor3 = on and theme.onColor or theme.offTrack
			knob.Position = on and UDim2.fromOffset(19, 2) or UDim2.fromOffset(2, 2)
		end
	end

	local function setStatus(on)
		statusLabel.Text = on and "● ACTIVE" or "○ INACTIVE"
		statusLabel.TextColor3 = on and theme.primaryDark or theme.textSub
	end

	local function toggleCard()
		card.OnToggle(not card:GetAttribute("State"))
		tween(card, { BackgroundColor3 = theme.cardHover }, 0.12)
		task.delay(0.14, function() tween(card, { BackgroundColor3 = theme.card }, 0.2) end)
	end

	-- hover lift
	card.MouseEnter:Connect(function()
		if not minimized then
			tween(card, { BackgroundColor3 = theme.cardHover, BackgroundTransparency = 0.06 }, 0.15)
		end
	end)
	card.MouseLeave:Connect(function()
		tween(card, { BackgroundColor3 = theme.card, BackgroundTransparency = 0.12 }, 0.2)
	end)

	card.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			if pointInFrame(keyChip, UserInputService:GetMouseLocation()) then return end
			toggleCard()
		end
	end)

	-- the switch itself is clickable (input events do not bubble)
	sw.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			toggleCard()
		end
	end)

	return {
		card = card, sw = sw, knob = knob, status = statusLabel,
		keyChip = keyChip, title = titleLabel,
		setSwitch = setSwitch, setStatus = setStatus, setState = function(on)
			card:SetAttribute("State", on)
			setSwitch(on, true)
			setStatus(on)
		end,
		OnToggle = function() end, OnKeybind = function() end,
	}
end

-- ============================ FEATURE CARDS ================================
local antiBatCard = makeCard(52,  "◈", "Anti Bat",     keyName(antiBatKey))
local infJumpCard = makeCard(126, "⇧", "Inf Jump",     keyName(infJumpKey))
local antiRagCard = makeCard(200, "◉", "Anti Ragdoll", keyName(antiRagKey))

antiBatCard.OnToggle = function(on)
	AntiBatEnabled = on
	antiBatCard.setState(on)
	if on then startAntiBat() else stopAntiBat() end
	notify("Anti Bat", on and "Engaged. Bats: 0 detected." or "Disengaged.", "◈")
end

infJumpCard.OnToggle = function(on)
	InfiniteJumpEnabled = on
	InfiniteJumpHoldEnabled = on
	infJumpCard.setState(on)
	notify("Inf Jump", on and "Tap & hold jumping enabled." or "Disabled.", "⇧")
end

antiRagCard.OnToggle = function(on)
	AntiRagdollEnabled = on
	antiRagCard.setState(on)
	if on then startAntiRagdoll() else stopAntiRagdoll() end
	notify("Anti Ragdoll", on and "Auto-stand enabled." or "Disabled.", "◉")
end

-- ============================ KEYBIND SYSTEM ===============================
local guiKeyChip -- forward-declared (created in the GUI toggle card)

local function updateChips()
	antiBatCard.keyChip.Text = keyName(antiBatKey)
	antiBatCard.keyChip.Size = UDim2.fromOffset(math.max(36, #keyName(antiBatKey) * 6 + 12), 13)
	infJumpCard.keyChip.Text = keyName(infJumpKey)
	infJumpCard.keyChip.Size = UDim2.fromOffset(math.max(36, #keyName(infJumpKey) * 6 + 12), 13)
	antiRagCard.keyChip.Text = keyName(antiRagKey)
	antiRagCard.keyChip.Size = UDim2.fromOffset(math.max(36, #keyName(antiRagKey) * 6 + 12), 13)
	guiKeyChip.Text = keyName(guiKey)
	guiKeyChip.Size = UDim2.fromOffset(math.max(36, #keyName(guiKey) * 6 + 12), 15)
end

local function beginRebind(slot, card)
	if waitingFor then return end
	waitingFor = slot
	notify("Keybind", "Press any key to set", "◈")
	if card then
		card.keyChip.Text = "..."
		card.keyChip.Size = UDim2.fromOffset(36, 13)
	end
	if slot == "gui" then
		guiKeyChip.Text = "..."
		guiKeyChip.Size = UDim2.fromOffset(36, 15)
	end
	task.delay(5, function()
		if waitingFor == slot then
			waitingFor = nil
			updateChips()
		end
	end)
end

antiBatCard.OnKeybind = function() beginRebind("antibat", antiBatCard) end
infJumpCard.OnKeybind = function() beginRebind("infjump", infJumpCard) end
antiRagCard.OnKeybind = function() beginRebind("antirag", antiRagCard) end

-- ============================ GUI TOGGLE CARD ==============================
local guiCard = Instance.new("Frame")
guiCard.Size = UDim2.new(1, -16, 0, 38)
guiCard.Position = UDim2.fromOffset(8, 274)
guiCard.BackgroundColor3 = theme.card
guiCard.BackgroundTransparency = 0.12
guiCard.ZIndex = 3
corner(guiCard, 12)
stroke(guiCard, theme.borderSoft, 1)
guiCard.Parent = win

text(guiCard, UDim2.fromOffset(120, 14), UDim2.new(0, 12, 0, 4), "GUI Toggle", theme.text, F.B, 12)
text(guiCard, UDim2.fromOffset(120, 10), UDim2.new(0, 12, 0, 20), "minimize / expand", theme.textSub, F.M, 8)

guiKeyChip = Instance.new("TextButton")
guiKeyChip.Text = keyName(guiKey)
guiKeyChip.Font = F.B
guiKeyChip.TextSize = 8
guiKeyChip.TextColor3 = theme.primaryDark
guiKeyChip.BackgroundColor3 = theme.chip
guiKeyChip.BackgroundTransparency = 0.18
guiKeyChip.BorderSizePixel = 0
guiKeyChip.Size = UDim2.fromOffset(math.max(36, #keyName(guiKey) * 6 + 12), 15)
guiKeyChip.Position = UDim2.new(1, -10, 0.5, -8)
guiKeyChip.AnchorPoint = Vector2.new(1, 0)
guiKeyChip.ZIndex = 5
guiKeyChip.Parent = guiCard
stroke(guiKeyChip, theme.borderSoft, 1)
corner(guiKeyChip, 5)

guiKeyChip.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		beginRebind("gui", nil)
		return true
	end
end)

-- ============================ SAVE CONFIG ==================================
local serializeConfig = function()
	return table.concat({
		antiBatKey.Name, infJumpKey.Name, antiRagKey.Name, guiKey.Name,
		tostring(AntiBatEnabled), tostring(InfiniteJumpEnabled), tostring(AntiRagdollEnabled),
	}, "|")
end

local saveCard = Instance.new("Frame")
saveCard.Size = UDim2.new(1, -16, 0, 34)
saveCard.Position = UDim2.fromOffset(8, 320)
saveCard.BackgroundColor3 = theme.card
saveCard.BackgroundTransparency = 0.12
saveCard.ZIndex = 3
corner(saveCard, 12)
stroke(saveCard, theme.borderSoft, 1)
saveCard.Parent = win

local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(1, -12, 1, -6)
saveBtn.Position = UDim2.new(0, 6, 0, 3)
saveBtn.BackgroundColor3 = theme.primary
saveBtn.BorderSizePixel = 0
saveBtn.Text = "Save Config"
saveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
saveBtn.Font = F.B
saveBtn.TextSize = 9.5
saveBtn.ZIndex = 4
saveBtn.Parent = saveCard
corner(saveBtn, 8)

local saveGrad = Instance.new("UIGradient")
saveGrad.Color = ColorSequence.new(theme.primaryLight, theme.primaryDark)
saveGrad.Rotation = 90
saveGrad.Parent = saveBtn

local saveSheen = Instance.new("Frame")
saveSheen.Size = UDim2.fromScale(1, 1)
saveSheen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
saveSheen.BackgroundTransparency = 0.65
saveSheen.ZIndex = 5
corner(saveSheen, 8)
saveSheen.Parent = saveBtn

local function saveConfig()
	if writefile then
		pcall(function() writefile(configFile, serializeConfig()) end)
		saveBtn.Text = "Saved ✓"
		notify("Config", "Keybinds & toggles saved.", "✓")
		task.delay(0.7, function() saveBtn.Text = "Save Config" end)
	end
end

saveBtn.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		saveConfig()
	end
end)
saveBtn.MouseEnter:Connect(function() tween(saveSheen, { BackgroundTransparency = 0.45 }, 0.15) end)
saveBtn.MouseLeave:Connect(function() tween(saveSheen, { BackgroundTransparency = 0.65 }, 0.2) end)

local function loadConfig()
	if isfile and isfile(configFile) then
		local ok, data = pcall(function() return readfile(configFile) end)
		if ok and data then
			local parts = {}
			for part in (data .. "|"):gmatch("(.-)|") do table.insert(parts, part) end
			local function findKey(name)
				for _, k in ipairs(Enum.KeyCode:GetEnumItems()) do
					if k.Name == name then return k end
				end
				return nil
			end
			antiBatKey = findKey(parts[1]) or antiBatKey
			infJumpKey = findKey(parts[2]) or infJumpKey
			antiRagKey = findKey(parts[3]) or antiRagKey
			guiKey     = findKey(parts[4]) or guiKey
			AntiBatEnabled          = parts[5] == "true"
			InfiniteJumpEnabled     = parts[6] == "true"
			InfiniteJumpHoldEnabled = parts[6] == "true"
			AntiRagdollEnabled      = parts[7] ~= "false"
		end
	end
end

-- ============================ GLOBAL INPUT =================================
UserInputService.InputBegan:Connect(function(inp, gp)
	if gp then return end

	-- keybind capture
	if waitingFor and inp.UserInputType == Enum.UserInputType.Keyboard then
		if waitingFor == "antibat" then antiBatKey = inp.KeyCode end
		if waitingFor == "infjump" then infJumpKey = inp.KeyCode end
		if waitingFor == "antirag" then antiRagKey = inp.KeyCode end
		if waitingFor == "gui"     then guiKey     = inp.KeyCode end
		waitingFor = nil
		updateChips()
		notify("Keybind", "Set to " .. keyName(inp.KeyCode), "◈")
		saveConfig()
		return
	end

	if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end

	if inp.KeyCode == guiKey then
		setMinimized(not minimized)
	elseif inp.KeyCode == antiBatKey then
		antiBatCard.OnToggle(not AntiBatEnabled)
	elseif inp.KeyCode == infJumpKey then
		infJumpCard.OnToggle(not InfiniteJumpEnabled)
	elseif inp.KeyCode == antiRagKey then
		antiRagCard.OnToggle(not AntiRagdollEnabled)
	end
end)

-- ============================ RESPAWN ======================================
player.CharacterAdded:Connect(function()
	task.delay(0.3, function()
		if AntiBatEnabled then startAntiBat() end
	end)
	task.delay(0.5, function()
		if AntiRagdollEnabled then startAntiRagdoll() end
	end)
end)

-- ============================ INIT =========================================
loadConfig()           -- restore saved keybinds + toggle states first

startJumpHoldLoop()
if AntiBatEnabled     then startAntiBat()     end
if AntiRagdollEnabled then startAntiRagdoll() end

antiBatCard.setState(AntiBatEnabled)
infJumpCard.setState(InfiniteJumpEnabled)
antiRagCard.setState(AntiRagdollEnabled)
updateChips()
updateShadow()

-- subtle intro
tween(win, { Size = UDim2.fromOffset(WIN_W * 0.94, WIN_H * 0.94) }, 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
task.delay(0.06, function()
	tween(win, { Size = UDim2.fromOffset(WIN_W, WIN_H) }, 0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	updateShadow()
end)
task.delay(0.8, function()
	notify("Kawatan Hub", "Anti Bat system online", "◈")
end)

print("Kawatan Hub | Anti Bat v3.0 loaded - LCTRL to minimize, click KEY chips to rebind.")
