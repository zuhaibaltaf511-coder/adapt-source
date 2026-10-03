-- Made by Exe Hub owner @exe_on.top | https://discord.gg/ZvERp8sHq |

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local localPlayer = Players.LocalPlayer

-- Color palette (black / white / gray)
local COLORS = {
Black = Color3.fromRGB(13, 13, 13),
DarkGray = Color3.fromRGB(24, 24, 24),
Gray = Color3.fromRGB(40, 40, 40),
MidGray = Color3.fromRGB(70, 70, 70),
LightGray = Color3.fromRGB(140, 140, 140),
SoftGray = Color3.fromRGB(190, 190, 190),
White = Color3.fromRGB(255, 255, 255),
}

local DISCORD_LINK = "https://discord.gg/dGHUDbBnP"

local function getGuiParent()
if localPlayer:FindFirstChild("PlayerGui") then
return localPlayer.PlayerGui
end
return CoreGui
end

local guiParent = getGuiParent()

local versionConfigs = {
V1 = {
range = 250,
tpOffset = Vector3.new(0, 0, 0),
loopDelay = 0.08,
smartRotation = true,
resetVelocity = true,
predictMovement = true,
predictionFactor = 0.15,
healthCheck = true,
teamCheck = false,
behindTarget = false,
behindDistance = 4,
antiFling = true,
sideOffset = 2.5,
},
V2 = {
range = 250,
tpOffset = Vector3.new(0, 3, 0),
loopDelay = 0.08,
smartRotation = false,
resetVelocity = true,
predictMovement = false,
predictionFactor = 0,
healthCheck = true,
teamCheck = false,
behindTarget = false,
behindDistance = 0,
antiFling = false,
sideOffset = 0,
},
}

local settings = {
toggleKey = Enum.KeyCode.Y,
autoBatEnabled = true,
autoBatDelay = 0.08,
currentVersion = "V1",
}

local programState = {
isTpBatActive = false,
isAntiDieActive = true,
isRunning = false,
tpLoopThread = nil,
isWaitingForKey = false,
hittingCooldown = false,
uiReferences = {},
}

local function getActiveConfig()
return versionConfigs[settings.currentVersion]
end

local function getMyRootPart()
local character = localPlayer.Character
if not character then return nil end
return character:FindFirstChild("HumanoidRootPart")
end

local function getMyHumanoid()
local character = localPlayer.Character
if not character then return nil end
return character:FindFirstChildOfClass("Humanoid")
end

local function getBat()
local character = localPlayer.Character
if not character then return nil end

local tool = character:FindFirstChild("Bat")
if tool then return tool end

local backpack = localPlayer:FindFirstChild("Backpack")
if backpack then
tool = backpack:FindFirstChild("Bat")
if tool then
tool.Parent = character
return tool
end
end
return nil
end

local function tryHitBat()
if programState.hittingCooldown then return end
programState.hittingCooldown = true

pcall(function()
local bat = getBat()
if bat then
bat:Activate()
local remoteEvent = bat:FindFirstChildWhichIsA("RemoteEvent")
if remoteEvent then
remoteEvent:FireServer()
end
end
end)

task.delay(settings.autoBatDelay, function()
programState.hittingCooldown = false
end)
end

local function isValidEnemy(player)
local config = getActiveConfig()
if player == localPlayer then return false end
if not player.Character then return false end

local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
if not humanoid then return false end
if config.healthCheck and humanoid.Health <= 0 then return false end

if config.teamCheck then
if player.Team == localPlayer.Team and player.Team ~= nil then
return false
end
end

local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
if not rootPart then return false end

return true, rootPart, humanoid
end

local function predictPosition(rootPart)
local config = getActiveConfig()
if not config.predictMovement then return rootPart.Position end
return rootPart.Position + (rootPart.AssemblyLinearVelocity * config.predictionFactor)
end

local function findNearestEnemy()
local config = getActiveConfig()
local myRootPart = getMyRootPart()
if not myRootPart then return nil end

local nearestRootPart = nil
local shortestDist = config.range

for _, player in ipairs(Players:GetPlayers()) do
local valid, rootPart = isValidEnemy(player)
if valid then
local dist = (rootPart.Position - myRootPart.Position).Magnitude
if dist < shortestDist then
shortestDist = dist
nearestRootPart = rootPart
end
end
end

return nearestRootPart
end

local function teleportTo(targetRootPart)
local config = getActiveConfig()
local myRootPart = getMyRootPart()
local myHumanoid = getMyHumanoid()
if not myRootPart then return end

local targetPos = predictPosition(targetRootPart)
local finalPos

if config.behindTarget then
local direction = (targetPos - myRootPart.Position).Unit
finalPos = targetPos + (direction * -config.behindDistance)
finalPos = finalPos + Vector3.new(0, 2, 0)
else
if config.sideOffset and config.sideOffset > 0 then
local dir = (myRootPart.Position - targetPos)
dir = Vector3.new(dir.X, 0, dir.Z)

if dir.Magnitude < 0.1 then
dir = Vector3.new(1, 0, 0)
else
dir = dir.Unit
end

finalPos = targetPos + (dir * config.sideOffset)
else
finalPos = targetPos + config.tpOffset
end
end

local newCFrame
if config.smartRotation then
newCFrame = CFrame.new(finalPos, targetPos)
else
newCFrame = CFrame.new(finalPos)
end

myRootPart.CFrame = newCFrame

if config.resetVelocity then
myRootPart.Velocity = Vector3.new(0, 0, 0)
myRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
myRootPart.RotVelocity = Vector3.new(0, 0, 0)
myRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
end

if config.antiFling and myHumanoid then
myHumanoid.PlatformStand = false
myHumanoid.Sit = false
end
end

local function updateStatusUI(isActive)
if programState.uiReferences.StatusLabel then
if isActive then
programState.uiReferences.StatusLabel.Text = 'ACTIVE'
programState.uiReferences.StatusLabel.TextColor3 = COLORS.White
if programState.uiReferences.StatusDot then
programState.uiReferences.StatusDot.BackgroundColor3 = COLORS.White
end
else
programState.uiReferences.StatusLabel.Text = 'INACTIVE'
programState.uiReferences.StatusLabel.TextColor3 = COLORS.LightGray
if programState.uiReferences.StatusDot then
programState.uiReferences.StatusDot.BackgroundColor3 = COLORS.LightGray
end
end
end
end

local function startTpBat()
if programState.isRunning then return end

programState.isRunning = true
programState.isTpBatActive = true

programState.tpLoopThread = task.spawn(function()
while programState.isTpBatActive do
local target = findNearestEnemy()

if target then
teleportTo(target)
if settings.autoBatEnabled then
tryHitBat()
end
end

task.wait(getActiveConfig().loopDelay)
end
end)

updateStatusUI(true)
end

local function stopTpBat()
if not programState.isRunning then return end

programState.isRunning = false
programState.isTpBatActive = false

if programState.tpLoopThread then
pcall(function()
task.cancel(programState.tpLoopThread)
end)
programState.tpLoopThread = nil
end

updateStatusUI(false)
end

local function toggleTpBat()
if programState.isTpBatActive then
stopTpBat()
else
startTpBat()
end
end

local antiDieEnabled = true

local heartBeatConnection = nil
local deathConnections = {}
local characterAddedConnection = nil

local function protectCharacter(character)
if not character then return end

local humanoid = character:WaitForChild("Humanoid", 5)
if not humanoid then return end

humanoid.MaxHealth = math.huge
humanoid.Health = math.huge
humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)

local stateChanged = humanoid.StateChanged:Connect(function(_, newState)
if not antiDieEnabled then return end
if newState == Enum.HumanoidStateType.Dead then
humanoid.Health = math.huge
humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
end
end)
table.insert(deathConnections, stateChanged)

local healthChanged = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
if not antiDieEnabled then return end
if humanoid.Health < humanoid.MaxHealth then
humanoid.Health = math.huge
end
end)
table.insert(deathConnections, healthChanged)

if heartBeatConnection then
heartBeatConnection:Disconnect()
end

heartBeatConnection = RunService.Heartbeat:Connect(function()
if not antiDieEnabled then return end
if humanoid and humanoid.Parent and humanoid.Health < humanoid.MaxHealth then
humanoid.Health = math.huge
end
end)
end

local function startAntiDie()
antiDieEnabled = true
programState.isAntiDieActive = true

for _, conn in ipairs(deathConnections) do
pcall(function()
conn:Disconnect()
end)
end
deathConnections = {}

if heartBeatConnection then
heartBeatConnection:Disconnect()
heartBeatConnection = nil
end

if characterAddedConnection then
characterAddedConnection:Disconnect()
characterAddedConnection = nil
end

local character = localPlayer.Character
if character then
protectCharacter(character)
end

characterAddedConnection = localPlayer.CharacterAdded:Connect(function(newChar)
if not antiDieEnabled then return end
task.wait(0.2)

for _, conn in ipairs(deathConnections) do
pcall(function()
conn:Disconnect()
end)
end
deathConnections = {}

protectCharacter(newChar)
end)
end

local function stopAntiDie()
antiDieEnabled = false
programState.isAntiDieActive = false

for _, conn in ipairs(deathConnections) do
pcall(function()
conn:Disconnect()
end)
end
deathConnections = {}

if heartBeatConnection then
heartBeatConnection:Disconnect()
heartBeatConnection = nil
end

if characterAddedConnection then
characterAddedConnection:Disconnect()
characterAddedConnection = nil
end

local character = localPlayer.Character
if character then
local humanoid = character:FindFirstChildOfClass("Humanoid")
if humanoid then
humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
humanoid.MaxHealth = 100
humanoid.Health = 100
end
end
end

local function startKeybindListener()
if programState.isWaitingForKey then return end
programState.isWaitingForKey = true

if programState.uiReferences.KeyLabel then
programState.uiReferences.KeyLabel.Text = '...'
programState.uiReferences.KeyLabel.TextColor3 = COLORS.White
end

local connection
connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if input.UserInputType ~= Enum.UserInputType.Keyboard then return end

if input.KeyCode == Enum.KeyCode.Escape then
programState.isWaitingForKey = false

if programState.uiReferences.KeyLabel then
programState.uiReferences.KeyLabel.Text = settings.toggleKey.Name
programState.uiReferences.KeyLabel.TextColor3 = COLORS.SoftGray
end

connection:Disconnect()
return
end

settings.toggleKey = input.KeyCode
programState.isWaitingForKey = false

if programState.uiReferences.KeyLabel then
programState.uiReferences.KeyLabel.Text = input.KeyCode.Name
programState.uiReferences.KeyLabel.TextColor3 = COLORS.White

task.wait(0.3)
programState.uiReferences.KeyLabel.TextColor3 = COLORS.SoftGray
end

connection:Disconnect()
end)
end

local function buildUI()
local oldUI = guiParent:FindFirstChild("ExeHubUI")
if oldUI then oldUI:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = 'ExeHubUI'
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 10
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = guiParent

local mainFrame = Instance.new("Frame")
mainFrame.Name = 'Main'
mainFrame.Size = UDim2.new(0, 250, 0, 300)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -150)
mainFrame.BackgroundColor3 = COLORS.Black
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.ClipsDescendants = true
mainFrame.ZIndex = 1
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = COLORS.Gray
mainStroke.Thickness = 1
mainStroke.Transparency = 0.3
mainStroke.Parent = mainFrame

-- BACKGROUND IMAGE LABEL
local bgImage = Instance.new("ImageLabel")
bgImage.Name = "BackgroundImage"
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.Position = UDim2.new(0, 0, 0, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://99717245408814"
bgImage.ScaleType = Enum.ScaleType.Crop
bgImage.ZIndex = 0
bgImage.Parent = mainFrame

local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0, 16)
bgCorner.Parent = bgImage

local dot = Instance.new("Frame")
dot.Size = UDim2.new(0, 10, 0, 10)
dot.Position = UDim2.new(0, 16, 0, 26)
dot.BackgroundColor3 = COLORS.White
dot.BorderSizePixel = 0
dot.ZIndex = 5
dot.Parent = mainFrame

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = dot

-- Bigger, brighter title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 180, 0, 22)
title.Position = UDim2.new(0, 36, 0, 18)
title.BackgroundTransparency = 1
title.Text = 'Exe Hub'
title.TextColor3 = COLORS.White
title.Font = Enum.Font.GothamBlack
title.TextSize = 19
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 5
title.Parent = mainFrame

-- Brighter white-to-gray gradient
local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
ColorSequenceKeypoint.new(0.5, Color3.fromRGB(230, 230, 230)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 150, 150))
})
titleGradient.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0, 0),
NumberSequenceKeypoint.new(1, 0.35)
})
titleGradient.Parent = title

-- Outline for extra pop
local titleStroke = Instance.new("UIStroke")
titleStroke.Color = Color3.fromRGB(0, 0, 0)
titleStroke.Thickness = 1.5
titleStroke.Transparency = 0.35
titleStroke.Parent = title

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -32, 0, 24)
closeBtn.BackgroundColor3 = COLORS.DarkGray
closeBtn.BackgroundTransparency = 0.3
closeBtn.Text = '-'
closeBtn.TextColor3 = COLORS.White
closeBtn.Font = Enum.Font.GothamBlack
closeBtn.TextSize = 16
closeBtn.BorderSizePixel = 0
closeBtn.ZIndex = 5
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

local statusBox = Instance.new("Frame")
statusBox.Size = UDim2.new(1, -24, 0, 32)
statusBox.Position = UDim2.new(0, 12, 0, 76)
statusBox.BackgroundColor3 = COLORS.DarkGray
statusBox.BackgroundTransparency = 0.3
statusBox.BorderSizePixel = 0
statusBox.ZIndex = 4
statusBox.Parent = mainFrame

local statusBoxCorner = Instance.new("UICorner")
statusBoxCorner.CornerRadius = UDim.new(0, 12)
statusBoxCorner.Parent = statusBox

local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.new(0, 8, 0, 8)
statusDot.Position = UDim2.new(0, 14, 0.5, -4)
statusDot.BackgroundColor3 = COLORS.LightGray
statusDot.BorderSizePixel = 0
statusDot.ZIndex = 6
statusDot.Parent = statusBox

local statusDotCorner = Instance.new("UICorner")
statusDotCorner.CornerRadius = UDim.new(1, 0)
statusDotCorner.Parent = statusDot

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 120, 1, 0)
statusLabel.Position = UDim2.new(1, -124, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = 'INACTIVE'
statusLabel.TextColor3 = COLORS.LightGray
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 14
statusLabel.TextXAlignment = Enum.TextXAlignment.Right
statusLabel.ZIndex = 6
statusLabel.Parent = statusBox

local tpBox = Instance.new("Frame")
tpBox.Size = UDim2.new(1, -24, 0, 50)
tpBox.Position = UDim2.new(0, 12, 0, 116)
tpBox.BackgroundColor3 = COLORS.DarkGray
tpBox.BackgroundTransparency = 0.3
tpBox.BorderSizePixel = 0
tpBox.ZIndex = 4
tpBox.Parent = mainFrame

local tpBoxCorner = Instance.new("UICorner")
tpBoxCorner.CornerRadius = UDim.new(0, 12)
tpBoxCorner.Parent = tpBox

local tpText = Instance.new("TextLabel")
tpText.Size = UDim2.new(0, 90, 0, 18)
tpText.Position = UDim2.new(0, 14, 0, 16)
tpText.BackgroundTransparency = 1
tpText.Text = 'TP Bat'
tpText.TextColor3 = COLORS.White
tpText.Font = Enum.Font.GothamBold
tpText.TextSize = 14
tpText.TextXAlignment = Enum.TextXAlignment.Left
tpText.ZIndex = 6
tpText.Parent = tpBox

local keyLabel = Instance.new("TextButton")
keyLabel.Size = UDim2.new(0, 34, 0, 20)
keyLabel.Position = UDim2.new(1, -100, 0.5, -10)
keyLabel.BackgroundColor3 = COLORS.Gray
keyLabel.BackgroundTransparency = 0.2
keyLabel.Text = settings.toggleKey.Name
keyLabel.TextColor3 = COLORS.SoftGray
keyLabel.Font = Enum.Font.GothamBold
keyLabel.TextSize = 12
keyLabel.AutoButtonColor = false
keyLabel.BorderSizePixel = 0
keyLabel.ZIndex = 6
keyLabel.Parent = tpBox

local keyLabelCorner = Instance.new("UICorner")
keyLabelCorner.CornerRadius = UDim.new(0, 6)
keyLabelCorner.Parent = keyLabel

local tpSwitch = Instance.new("TextButton")
tpSwitch.Size = UDim2.new(0, 44, 0, 22)
tpSwitch.Position = UDim2.new(1, -58, 0.5, -11)
tpSwitch.BackgroundColor3 = COLORS.Gray
tpSwitch.Text = ''
tpSwitch.BorderSizePixel = 0
tpSwitch.ZIndex = 6
tpSwitch.Parent = tpBox

local tpSwitchCorner = Instance.new("UICorner")
tpSwitchCorner.CornerRadius = UDim.new(0, 11)
tpSwitchCorner.Parent = tpSwitch

local tpKnob = Instance.new("Frame")
tpKnob.Size = UDim2.new(0, 16, 0, 16)
tpKnob.Position = UDim2.new(0, 3, 0.5, -8)
tpKnob.BackgroundColor3 = COLORS.SoftGray
tpKnob.BorderSizePixel = 0
tpKnob.ZIndex = 7
tpKnob.Parent = tpSwitch

local tpKnobCorner = Instance.new("UICorner")
tpKnobCorner.CornerRadius = UDim.new(1, 0)
tpKnobCorner.Parent = tpKnob

local versionBox = Instance.new("Frame")
versionBox.Size = UDim2.new(1, -24, 0, 50)
versionBox.Position = UDim2.new(0, 12, 0, 174)
versionBox.BackgroundColor3 = COLORS.DarkGray
versionBox.BackgroundTransparency = 0.3
versionBox.BorderSizePixel = 0
versionBox.ZIndex = 4
versionBox.Parent = mainFrame

local versionBoxCorner = Instance.new("UICorner")
versionBoxCorner.CornerRadius = UDim.new(0, 12)
versionBoxCorner.Parent = versionBox

local versionText = Instance.new("TextLabel")
versionText.Size = UDim2.new(0, 150, 0, 18)
versionText.Position = UDim2.new(0, 14, 0, 16)
versionText.BackgroundTransparency = 1
versionText.Text = 'Version'
versionText.TextColor3 = COLORS.White
versionText.Font = Enum.Font.GothamBold
versionText.TextSize = 14
versionText.TextXAlignment = Enum.TextXAlignment.Left
versionText.ZIndex = 6
versionText.Parent = versionBox

local v1Btn = Instance.new("TextButton")
v1Btn.Size = UDim2.new(0, 44, 0, 22)
v1Btn.Position = UDim2.new(1, -104, 0.5, -11)
v1Btn.BackgroundColor3 = COLORS.MidGray
v1Btn.Text = 'V1'
v1Btn.TextColor3 = COLORS.White
v1Btn.TextSize = 11
v1Btn.Font = Enum.Font.GothamBold
v1Btn.AutoButtonColor = false
v1Btn.BorderSizePixel = 0
v1Btn.ZIndex = 6
v1Btn.Parent = versionBox

local v1Corner = Instance.new("UICorner")
v1Corner.CornerRadius = UDim.new(0, 6)
v1Corner.Parent = v1Btn

local v2Btn = Instance.new("TextButton")
v2Btn.Size = UDim2.new(0, 44, 0, 22)
v2Btn.Position = UDim2.new(1, -56, 0.5, -11)
v2Btn.BackgroundColor3 = COLORS.Gray
v2Btn.Text = 'V2'
v2Btn.TextColor3 = COLORS.White
v2Btn.TextSize = 11
v2Btn.Font = Enum.Font.GothamBold
v2Btn.AutoButtonColor = false
v2Btn.BorderSizePixel = 0
v2Btn.ZIndex = 6
v2Btn.Parent = versionBox

local v2Corner = Instance.new("UICorner")
v2Corner.CornerRadius = UDim.new(0, 6)
v2Corner.Parent = v2Btn

-- Discord box
local discordBox = Instance.new("Frame")
discordBox.Size = UDim2.new(1, -24, 0, 36)
discordBox.Position = UDim2.new(0, 12, 0, 234)
discordBox.BackgroundColor3 = COLORS.DarkGray
discordBox.BackgroundTransparency = 0.3
discordBox.BorderSizePixel = 0
discordBox.ZIndex = 4
discordBox.Parent = mainFrame

local discordBoxCorner = Instance.new("UICorner")
discordBoxCorner.CornerRadius = UDim.new(0, 12)
discordBoxCorner.Parent = discordBox

local discordBtn = Instance.new("TextButton")
discordBtn.Size = UDim2.new(1, 0, 1, 0)
discordBtn.BackgroundTransparency = 1
discordBtn.Text = 'discord.gg/dGHUDbBnP'
discordBtn.TextColor3 = COLORS.SoftGray
discordBtn.Font = Enum.Font.GothamBold
discordBtn.TextSize = 13
discordBtn.AutoButtonColor = false
discordBtn.BorderSizePixel = 0
discordBtn.ZIndex = 6
discordBtn.Parent = discordBox

discordBtn.MouseEnter:Connect(function()
discordBtn.TextColor3 = COLORS.White
end)

discordBtn.MouseLeave:Connect(function()
discordBtn.TextColor3 = COLORS.SoftGray
end)

discordBtn.MouseButton1Click:Connect(function()
pcall(function()
if setclipboard then
setclipboard(DISCORD_LINK)
end
end)

discordBtn.Text = 'Copied!'
discordBtn.TextColor3 = COLORS.White

task.delay(1.2, function()
discordBtn.Text = 'discord.gg/dGHUDbBnP'
discordBtn.TextColor3 = COLORS.SoftGray
end)
end)

programState.uiReferences.Main = mainFrame
programState.uiReferences.StatusLabel = statusLabel
programState.uiReferences.StatusDot = statusDot
programState.uiReferences.TpSwitch = tpSwitch
programState.uiReferences.TpKnob = tpKnob
programState.uiReferences.KeyLabel = keyLabel

local isMinimized = false
local originalSize = UDim2.new(0, 250, 0, 300)
local miniSize = UDim2.new(0, 250, 0, 60)

closeBtn.MouseButton1Click:Connect(function()
isMinimized = not isMinimized

if isMinimized then
TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = miniSize }):Play()
closeBtn.Text = '+'
statusBox.Visible = false
tpBox.Visible = false
versionBox.Visible = false
discordBox.Visible = false
else
TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = originalSize }):Play()
closeBtn.Text = '-'
statusBox.Visible = true
tpBox.Visible = true
versionBox.Visible = true
discordBox.Visible = true
end
end)

keyLabel.MouseButton1Click:Connect(startKeybindListener)

tpSwitch.MouseButton1Click:Connect(function()
toggleTpBat()

if programState.isTpBatActive then
TweenService:Create(tpKnob, TweenInfo.new(0.2), {
Position = UDim2.new(1, -19, 0.5, -8),
BackgroundColor3 = COLORS.White
}):Play()
TweenService:Create(tpSwitch, TweenInfo.new(0.2), {
BackgroundColor3 = COLORS.MidGray
}):Play()
else
TweenService:Create(tpKnob, TweenInfo.new(0.2), {
Position = UDim2.new(0, 3, 0.5, -8),
BackgroundColor3 = COLORS.SoftGray
}):Play()
TweenService:Create(tpSwitch, TweenInfo.new(0.2), {
BackgroundColor3 = COLORS.Gray
}):Play()
end
end)

v1Btn.MouseButton1Click:Connect(function()
v1Btn.BackgroundColor3 = COLORS.MidGray
v2Btn.BackgroundColor3 = COLORS.Gray
settings.currentVersion = "V1"
end)

v2Btn.MouseButton1Click:Connect(function()
v2Btn.BackgroundColor3 = COLORS.MidGray
v1Btn.BackgroundColor3 = COLORS.Gray
settings.currentVersion = "V2"
end)

local dragging = false
local dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = mainFrame.Position
end
end)

mainFrame.InputChanged:Connect(function(input)
if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
local delta = input.Position - dragStart
mainFrame.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)
end
end)

UserInputService.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = false
end
end)

return screenGui
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if programState.isWaitingForKey then return end

if input.KeyCode == settings.toggleKey then
toggleTpBat()

if programState.uiReferences.TpSwitch and programState.uiReferences.TpKnob then
if programState.isTpBatActive then
TweenService:Create(programState.uiReferences.TpKnob, TweenInfo.new(0.2), {
Position = UDim2.new(1, -19, 0.5, -8),
BackgroundColor3 = COLORS.White
}):Play()
TweenService:Create(programState.uiReferences.TpSwitch, TweenInfo.new(0.2), {
BackgroundColor3 = COLORS.MidGray
}):Play()
else
TweenService:Create(programState.uiReferences.TpKnob, TweenInfo.new(0.2), {
Position = UDim2.new(0, 3, 0.5, -8),
BackgroundColor3 = COLORS.SoftGray
}):Play()
TweenService:Create(programState.uiReferences.TpSwitch, TweenInfo.new(0.2), {
BackgroundColor3 = COLORS.Gray
}):Play()
end
end
end
end)

localPlayer.CharacterAdded:Connect(function()
if programState.isTpBatActive then
stopTpBat()
task.wait(0.5)

if programState.isAntiDieActive then
startAntiDie()
end

startTpBat()
end
end)

localPlayer.CharacterRemoving:Connect(function()
stopTpBat()
stopAntiDie()
end)

pcall(buildUI)
startAntiDie()