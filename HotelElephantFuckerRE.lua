local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "HEFRE"

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 500) -- Adjusted UI size
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarLabel = Instance.new("TextLabel")
TopBarLabel.Size = UDim2.new(1, 0, 1, 0)
TopBarLabel.BackgroundTransparency = 1
TopBarLabel.Text = "Hotel Elephant Fucker RE"
TopBarLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TopBarLabel.Font = Enum.Font.SourceSansBold
TopBarLabel.TextSize = 24
TopBarLabel.TextStrokeTransparency = 0.5
TopBarLabel.Parent = TopBar

local TopBarUICorner = Instance.new("UICorner")
TopBarUICorner.CornerRadius = UDim.new(0, 12)
TopBarUICorner.Parent = TopBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 18
CloseButton.BorderSizePixel = 0
CloseButton.Parent = TopBar

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local isDragging = false
local dragStart
local startPos

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and isDragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

TopBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 120, 1, -50)
TabContainer.Position = UDim2.new(0, 0, 0, 50)
TabContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.FillDirection = Enum.FillDirection.Vertical
TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
TabListLayout.Padding = UDim.new(0, 5)
TabListLayout.Parent = TabContainer

local function createTabButton(text, callback)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, -10, 0, 30)
    TabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    TabButton.Text = text
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Font = Enum.Font.SourceSans
    TabButton.TextSize = 14
    TabButton.BorderSizePixel = 0
    TabButton.Parent = TabContainer

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 4)
    ButtonCorner.Parent = TabButton

    TabButton.MouseButton1Click:Connect(callback)
end

local ContentFrameContainer = Instance.new("Frame")
ContentFrameContainer.Size = UDim2.new(1, -130, 1, -60)
ContentFrameContainer.Position = UDim2.new(0, 130, 0, 50)
ContentFrameContainer.BackgroundTransparency = 1
ContentFrameContainer.Parent = MainFrame

local ContentListLayout = Instance.new("UIListLayout")
ContentListLayout.FillDirection = Enum.FillDirection.Vertical
ContentListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentListLayout.Padding = UDim.new(0, 10)
ContentListLayout.Parent = ContentFrameContainer

local function createContentFrame()
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, 0, 1, 0)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Visible = false
    ContentFrame.Parent = ContentFrameContainer
    return ContentFrame
end

local GameBreakingTab = createContentFrame()
local TeamChangeTab = createContentFrame()
local LocalPlayerTab = createContentFrame()
local EffectsTab = createContentFrame()
local CreditsTab = createContentFrame()

local function switchTab(tab)
    GameBreakingTab.Visible = false
    TeamChangeTab.Visible = false
    LocalPlayerTab.Visible = false
    EffectsTab.Visible = false
    CreditsTab.Visible = false
    tab.Visible = true
end

createTabButton("Game", function() switchTab(GameBreakingTab) end)
createTabButton("Team", function() switchTab(TeamChangeTab) end)
createTabButton("Player", function() switchTab(LocalPlayerTab) end)
createTabButton("Effects", function() switchTab(EffectsTab) end)
createTabButton("Credits", function() switchTab(CreditsTab) end)

switchTab(GameBreakingTab)

local function createButton(parent, text, position, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -20, 0, 40) -- Adjusted size
    Button.Position = position
    Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 14
    Button.BorderSizePixel = 0
    Button.Parent = parent

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button

    Button.MouseButton1Click:Connect(callback)
end

local function createTextBox(parent, placeholderText, position)
    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(1, -20, 0, 40) -- Adjusted size
    TextBox.Position = position
    TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TextBox.Text = ""
    TextBox.PlaceholderText = placeholderText
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Font = Enum.Font.SourceSans
    TextBox.TextSize = 14
    TextBox.BorderSizePixel = 0
    TextBox.Parent = parent

    local TextBoxCorner = Instance.new("UICorner")
    TextBoxCorner.CornerRadius = UDim.new(0, 6)
    TextBoxCorner.Parent = TextBox

    return TextBox
end

local CashTextBox = createTextBox(GameBreakingTab, "Enter cash amount", UDim2.new(0, 0, 0, 40))
local PlayerNameTextBox = createTextBox(GameBreakingTab, "Enter player name", UDim2.new(0, 0, 0, 90))

createButton(GameBreakingTab, "Teleport to Player", UDim2.new(0, 0, 0, 140), function()
    local playerName = PlayerNameTextBox.Text:lower()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr.Name:lower() == playerName:lower() then
            LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
            break
        end
    end
end)

createButton(GameBreakingTab, "Give All Cash", UDim2.new(0, 0, 0, 190), function()
    local cashAmount = tonumber(CashTextBox.Text) or 0
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local args = {
                [1] = false,
                [2] = cashAmount,
                [3] = "Cash",
                [4] = plr
            }
            ReplicatedStorage.MoneyRequest:FireServer(unpack(args))
        end
    end
end)

createButton(GameBreakingTab, "Remove All Cash", UDim2.new(0, 0, 0, 240), function()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local args = {
                [1] = false,
                [2] = 0,
                [3] = "Cash",
                [4] = plr
            }
            ReplicatedStorage.MoneyRequest:FireServer(unpack(args))
        end
    end
end)

local SelfCashTextBox = createTextBox(LocalPlayerTab, "Enter cash amount", UDim2.new(0, 0, 0, 40))

createButton(LocalPlayerTab, "Give Yourself Cash", UDim2.new(0, 0, 0, 90), function()
    local cashAmount = tonumber(SelfCashTextBox.Text) or 0
    local args = {
        [1] = false,
        [2] = cashAmount,
        [3] = "Cash",
        [4] = LocalPlayer
    }
    ReplicatedStorage.MoneyRequest:FireServer(unpack(args))
end)

createButton(LocalPlayerTab, "Reset Character", UDim2.new(0, 0, 0, 140), function()
    LocalPlayer.Character:BreakJoints() -- Destroys character, causes respawn
end)

local teamButtons = {
    {text = "Manager", position = UDim2.new(0, 0, 0, 0), color = "Bright green"},
    {text = "Shop Assistant", position = UDim2.new(0, 0, 0, 50), color = "Bright blue"},
    {text = "Concierge", position = UDim2.new(0, 0, 0, 100), color = "Burgundy"},
    {text = "Waiter/Waitress", position = UDim2.new(0, 0, 0, 150), color = "Bright red"},
    {text = "Hotel Guest", position = UDim2.new(0, 0, 0, 200), color = "Bright yellow"},
    {text = "Neutral", position = UDim2.new(0, 0, 0, 250), color = "Really black"}
}

for _, button in ipairs(teamButtons) do
    createButton(TeamChangeTab, "Change team to " .. button.text, button.position, function()
        local args = { button.color }
        ReplicatedStorage.ChangeTeam:InvokeServer(unpack(args))
    end)
end

local SpeedTextBox = createTextBox(EffectsTab, "Enter speed multiplier", UDim2.new(0, 0, 0, 40))
local JumpTextBox = createTextBox(EffectsTab, "Enter jump power", UDim2.new(0, 0, 0, 90))

createButton(EffectsTab, "Apply Effects", UDim2.new(0, 0, 0, 140), function()
    local speedMultiplier = tonumber(SpeedTextBox.Text) or 1
    local jumpPower = tonumber(JumpTextBox.Text) or 50

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = speedMultiplier * 16
        LocalPlayer.Character.Humanoid.JumpPower = jumpPower
    end
end)

createButton(EffectsTab, "Reset Effects", UDim2.new(0, 0, 0, 190), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
        LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

local CreditsLabel = Instance.new("TextLabel")
CreditsLabel.Size = UDim2.new(1, -20, 1, -20)
CreditsLabel.Position = UDim2.new(0, 10, 0, 10)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Text = "Credits\n\nDeveloper: Teemsploit\nTesting: Catgirl"
CreditsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsLabel.Font = Enum.Font.SourceSans
CreditsLabel.TextSize = 18
CreditsLabel.TextStrokeTransparency = 0.5
CreditsLabel.TextWrapped = true
CreditsLabel.Parent = CreditsTab
