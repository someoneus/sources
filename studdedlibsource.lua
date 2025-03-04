local Library = {}  -- Main table that holds all UI functions

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui  -- In exploit environment, UI is parented to CoreGui
ScreenGui.Name = "InfiniteLib"

Library.Theme = {
    Background = Color3.fromRGB(30, 30, 30),
    Header = Color3.fromRGB(50, 50, 50),
    TextColor = Color3.fromRGB(255, 255, 255),
    ButtonColor = Color3.fromRGB(40, 40, 40),
}

function Library:CreateWindow(Title)
    local Window = {}

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 500, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
    MainFrame.BackgroundColor3 = Library.Theme.Background
    MainFrame.Parent = ScreenGui

    local TitleBar = Instance.new("TextLabel")
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.Text = Title or "My UI Library"
    TitleBar.Font = Enum.Font.Nunito
    TitleBar.TextSize = 18
    TitleBar.BackgroundColor3 = Library.Theme.Header
    TitleBar.TextColor3 = Library.Theme.TextColor
    TitleBar.Parent = MainFrame

    -- Container for buttons (for auto-alignment)
    local ButtonContainer = Instance.new("Frame")
    ButtonContainer.Size = UDim2.new(1, 0, 1, -40)  -- Takes all space below the title
    ButtonContainer.Position = UDim2.new(0, 0, 0, 40)
    ButtonContainer.BackgroundTransparency = 1
    ButtonContainer.Parent = MainFrame

    -- Stores button count for automatic alignment
    Window.ButtonContainer = ButtonContainer
    Window.ButtonCount = 0  -- Tracks how many buttons exist

    return Window
end


function Library:SetTheme(NewTheme)
    for Key, Value in pairs(NewTheme) do
        if Library.Theme[Key] then
            Library.Theme[Key] = Value
        end
    end
end

Library.Tabs = {}  -- Stores all created tabs
Library.Elements = {}  -- Stores all UI components

function Library:GetElements()
    return Library.Elements  -- Returns all UI components
end

function Library:CreateButton(Window, ButtonText, Callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 30)  -- Full width, with margin
    Button.Position = UDim2.new(0, 5, 0, Window.ButtonCount * 35)  -- Auto-align
    Button.Text = ButtonText
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 16
    Button.BackgroundColor3 = Library.Theme.ButtonColor
    Button.TextColor3 = Library.Theme.ButtonTextColor
    Button.Parent = Window.ButtonContainer

    -- Increase button count so the next button aligns correctly
    Window.ButtonCount = Window.ButtonCount + 1

    -- Execute callback when clicked
    Button.MouseButton1Click:Connect(function()
        Callback()
    end)
end
