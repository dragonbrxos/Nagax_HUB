-- NAGAX HUB | UI LIBRARY (MODERN & CLEAN)
local Library = {}
function Library:CreateWindow(Title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NagaxHub"
    ScreenGui.Parent = game:GetService("CoreGui")
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.Parent = ScreenGui
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TopBar.Parent = MainFrame
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -10, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.Text = Title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Parent = TopBar
    local TabContainer = Instance.new("Frame")
    TabContainer.Size = UDim2.new(0, 120, 1, -30)
    TabContainer.Position = UDim2.new(0, 0, 0, 30)
    TabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabContainer.Parent = MainFrame
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Size = UDim2.new(1, -120, 1, -30)
    ContentContainer.Position = UDim2.new(0, 120, 0, 30)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Parent = MainFrame
    local Window = {}
    function Window:CreateTab(Name)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.Text = Name
        TabButton.Parent = TabContainer
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.Visible = false
        TabContent.Parent = ContentContainer
        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(ContentContainer:GetChildren()) do v.Visible = false end
            TabContent.Visible = true
        end)
        local Tab = {}
        function Tab:CreateToggle(Name, Default, Callback)
            local ToggleBtn = Instance.new("TextButton")
            ToggleBtn.Size = UDim2.new(1, 0, 0, 30)
            ToggleBtn.Text = Name .. ": " .. tostring(Default)
            ToggleBtn.Parent = TabContent
            local Enabled = Default
            ToggleBtn.MouseButton1Click:Connect(function()
                Enabled = not Enabled
                ToggleBtn.Text = Name .. ": " .. tostring(Enabled)
                Callback(Enabled)
            end)
        end
        return Tab
    end
    return Window
end
return Library
