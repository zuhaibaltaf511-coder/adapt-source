-- Practice-only aim trainer for Roblox Studio.
-- Place this LocalScript in StarterPlayer > StarterPlayerScripts.
-- Tag practice dummy Models with the CollectionService tag "PracticeTarget".
-- This script never moves the camera and ignores player characters.

local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local TARGET_TAG = "PracticeTarget"
local MAX_DISTANCE = 300
local FOV_RADIUS = 180
local TOGGLE_KEY = Enum.KeyCode.Q

local enabled = false
local hits = 0
local misses = 0
local currentTarget = nil

-- Remove leftovers if this LocalScript is restarted in Studio.
local oldGui = playerGui:FindFirstChild("PracticeAimTrainer")
if oldGui then
	oldGui:Destroy()
end

local oldHighlight = workspace:FindFirstChild("PracticeAimTrainerHighlight")
if oldHighlight and oldHighlight:IsA("Highlight") then
	oldHighlight:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PracticeAimTrainer"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.Size = UDim2.fromOffset(285, 92)
panel.Position = UDim2.fromOffset(16, 16)
panel.BackgroundColor3 = Color3.fromRGB(18, 25, 36)
panel.BackgroundTransparency = 0.12
panel.BorderSizePixel = 0
panel.Parent = screenGui

local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 10)
panelCorner.Parent = panel

local panelStroke = Instance.new("UIStroke")
panelStroke.Color = Color3.fromRGB(75, 190, 255)
panelStroke.Transparency = 0.25
panelStroke.Parent = panel

local function makeLabel(name, y, height, textSize)
	local label = Instance.new("TextLabel")
	label.Name = name
	label.Position = UDim2.fromOffset(12, y)
	label.Size = UDim2.new(1, -24, 0, height)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamMedium
	label.TextSize = textSize
	label.TextColor3 = Color3.fromRGB(235, 244, 255)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.TextTruncate = Enum.TextTruncate.AtEnd
	label.Parent = panel
	return label
end

local statusLabel = makeLabel("Status", 8, 24, 16)
local statsLabel = makeLabel("Stats", 34, 22, 14)
local targetLabel = makeLabel("Target", 60, 22, 13)

local highlight = Instance.new("Highlight")
highlight.Name = "PracticeAimTrainerHighlight"
highlight.FillColor = Color3.fromRGB(50, 210, 255)
highlight.FillTransparency = 0.82
highlight.OutlineColor = Color3.fromRGB(125, 235, 255)
highlight.OutlineTransparency = 0.05
highlight.DepthMode = Enum.HighlightDepthMode.Occluded
highlight.Enabled = false
highlight.Parent = workspace

local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true

local function updateRaycastFilter()
	raycastParams.FilterDescendantsInstances = { player.Character }
end

updateRaycastFilter()
local characterAddedConnection = player.CharacterAdded:Connect(updateRaycastFilter)

local function isValidPracticeModel(model)
	if not model:IsA("Model") or not model:IsDescendantOf(workspace) then
		return false
	end

	-- Never include any player's character, even if someone tags it by mistake.
	if Players:GetPlayerFromCharacter(model) then
		return false
	end

	local humanoid = model:FindFirstChildOfClass("Humanoid")
	return not humanoid or humanoid.Health > 0
end

local function getAimPart(model)
	local head = model:FindFirstChild("Head", true)
	if head and head:IsA("BasePart") then
		return head
	end

	if model.PrimaryPart then
		return model.PrimaryPart
	end

	local root = model:FindFirstChild("HumanoidRootPart", true)
	if root and root:IsA("BasePart") then
		return root
	end

	return model:FindFirstChildWhichIsA("BasePart", true)
end

local function hasLineOfSight(camera, model, part)
	local direction = part.Position - camera.CFrame.Position
	local result = workspace:Raycast(camera.CFrame.Position, direction, raycastParams)
	return result ~= nil and result.Instance:IsDescendantOf(model)
end

local function findClosestPracticeTarget()
	local camera = workspace.CurrentCamera
	if not camera then
		return nil
	end

	local mousePosition = UserInputService:GetMouseLocation()
	local closestModel = nil
	local closestScreenDistance = FOV_RADIUS

	for _, instance in ipairs(CollectionService:GetTagged(TARGET_TAG)) do
		if instance:IsA("Model") and isValidPracticeModel(instance) then
			local part = getAimPart(instance)
			if part then
				local worldDistance = (part.Position - camera.CFrame.Position).Magnitude
				if worldDistance <= MAX_DISTANCE then
					local screenPosition, onScreen = camera:WorldToScreenPoint(part.Position)
					if onScreen then
						local screenDistance = (
							Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition
						).Magnitude

						if screenDistance < closestScreenDistance
							and hasLineOfSight(camera, instance, part)
						then
							closestModel = instance
							closestScreenDistance = screenDistance
						end
					end
				end
			end
		end
	end

	return closestModel
end

local function accuracyPercent()
	local shots = hits + misses
	if shots == 0 then
		return 0
	end
	return math.floor((hits / shots) * 100 + 0.5)
end

local function updateHud()
	statusLabel.Text = enabled and "AIM TRAINER: ON  [Q]" or "AIM TRAINER: OFF  [Q]"
	statsLabel.Text = string.format(
		"Hits: %d   Misses: %d   Accuracy: %d%%",
		hits,
		misses,
		accuracyPercent()
	)

	if enabled and currentTarget then
		targetLabel.Text = "Target: " .. currentTarget.Name
	elseif enabled then
		targetLabel.Text = "Target: none in range"
	else
		targetLabel.Text = 'Tag practice dummies "' .. TARGET_TAG .. '"'
	end
end

local function getPracticeTargetFromHit(instance)
	while instance and instance ~= workspace do
		if instance:IsA("Model")
			and CollectionService:HasTag(instance, TARGET_TAG)
			and isValidPracticeModel(instance)
		then
			return instance
		end
		instance = instance.Parent
	end
	return nil
end

local function getInputScreenPosition(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		return UserInputService:GetMouseLocation()
	elseif input.UserInputType == Enum.UserInputType.Touch then
		return Vector2.new(input.Position.X, input.Position.Y)
	end
	return nil
end

local inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end

	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == TOGGLE_KEY then
		enabled = not enabled
		if not enabled then
			currentTarget = nil
			highlight.Adornee = nil
			highlight.Enabled = false
		end
		updateHud()
		return
	end

	if not enabled then
		return
	end

	local screenPosition = getInputScreenPosition(input)
	local camera = workspace.CurrentCamera
	if not screenPosition or not camera then
		return
	end

	local ray = camera:ScreenPointToRay(screenPosition.X, screenPosition.Y)
	local result = workspace:Raycast(
		ray.Origin,
		ray.Direction * MAX_DISTANCE,
		raycastParams
	)
	local hitTarget = result and getPracticeTargetFromHit(result.Instance)

	if hitTarget then
		hits += 1
	else
		misses += 1
	end
	updateHud()
end)

local renderConnection = RunService.RenderStepped:Connect(function()
	if not enabled then
		return
	end

	currentTarget = findClosestPracticeTarget()
	highlight.Adornee = currentTarget
	highlight.Enabled = currentTarget ~= nil
	updateHud()
end)

updateHud()

local function cleanup()
	inputConnection:Disconnect()
	renderConnection:Disconnect()
	characterAddedConnection:Disconnect()
	highlight:Destroy()
	screenGui:Destroy()
end

-- Executors may not provide a script Instance.
if script then
	script.Destroying:Connect(cleanup)
end