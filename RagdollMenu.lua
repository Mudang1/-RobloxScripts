local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ลบ UI เก่า
local OldGui = PlayerGui:FindFirstChild("RagdollMenu")
if OldGui then
    OldGui:Destroy()
end

-- =========================================================
-- CONFIG
-- =========================================================

local UI_WIDTH = 250
local OPEN_HEIGHT = 300
local CLOSED_HEIGHT = 68

local BG = Color3.fromRGB(13, 14, 18)
local PANEL = Color3.fromRGB(20, 21, 27)
local BUTTON = Color3.fromRGB(27, 29, 36)
local BUTTON_HOVER = Color3.fromRGB(35, 37, 46)
local TEXT = Color3.fromRGB(245, 245, 250)
local SUBTEXT = Color3.fromRGB(135, 138, 150)

-- =========================================================
-- SCREEN GUI
-- =========================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RagdollMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- =========================================================
-- MAIN FRAME
-- =========================================================

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.fromOffset(UI_WIDTH, OPEN_HEIGHT)
MainFrame.Position = UDim2.new(0.06, 0, 0.18, 0)
MainFrame.BackgroundColor3 = BG
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- =========================================================
-- SHADOW
-- =========================================================

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 7)
Shadow.Size = UDim2.new(1, 35, 1, 35)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageTransparency = 0.45
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.ZIndex = 0
Shadow.Parent = MainFrame

-- =========================================================
-- BORDER
-- =========================================================

local Border = Instance.new("UIStroke")
Border.Color = Color3.fromRGB(48, 50, 62)
Border.Thickness = 1
Border.Transparency = 0.25
Border.Parent = MainFrame

-- =========================================================
-- HEADER
-- =========================================================

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 68)
Header.BackgroundColor3 = PANEL
Header.BorderSizePixel = 0
Header.ZIndex = 2
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 16)
HeaderCorner.Parent = Header

-- ปิดส่วนโค้งด้านล่าง
local HeaderBottom = Instance.new("Frame")
HeaderBottom.Size = UDim2.new(1, 0, 0, 18)
HeaderBottom.Position = UDim2.new(0, 0, 1, -18)
HeaderBottom.BackgroundColor3 = PANEL
HeaderBottom.BorderSizePixel = 0
HeaderBottom.ZIndex = 2
HeaderBottom.Parent = Header

-- =========================================================
-- ICON
-- =========================================================

local Icon = Instance.new("Frame")
Icon.Size = UDim2.fromOffset(44, 44)
Icon.Position = UDim2.fromOffset(12, 12)
Icon.BackgroundColor3 = Color3.fromRGB(35, 37, 47)
Icon.BorderSizePixel = 0
Icon.ZIndex = 3
Icon.Parent = Header

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 12)
IconCorner.Parent = Icon

local IconStroke = Instance.new("UIStroke")
IconStroke.Color = Color3.fromRGB(75, 78, 95)
IconStroke.Transparency = 0.25
IconStroke.Parent = Icon

local IconText = Instance.new("TextLabel")
IconText.Size = UDim2.fromScale(1, 1)
IconText.BackgroundTransparency = 1
IconText.Text = "R"
IconText.TextColor3 = Color3.fromRGB(255, 255, 255)
IconText.TextSize = 22
IconText.Font = Enum.Font.GothamBold
IconText.ZIndex = 4
IconText.Parent = Icon

-- =========================================================
-- TITLE
-- =========================================================

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -115, 0, 24)
Title.Position = UDim2.fromOffset(66, 11)
Title.BackgroundTransparency = 1
Title.Text = "Ragdoll Menu"
Title.TextColor3 = TEXT
Title.TextSize = 17
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 3
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -115, 0, 18)
Subtitle.Position = UDim2.fromOffset(66, 34)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Control Panel"
Subtitle.TextColor3 = SUBTEXT
Subtitle.TextSize = 10
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.ZIndex = 3
Subtitle.Parent = Header

-- =========================================================
-- STATUS
-- =========================================================

local Status = Instance.new("Frame")
Status.Size = UDim2.fromOffset(52, 22)
Status.Position = UDim2.new(1, -95, 0, 8)
Status.BackgroundColor3 = Color3.fromRGB(25, 55, 38)
Status.BorderSizePixel = 0
Status.ZIndex = 4
Status.Parent = Header

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(1, 0)
StatusCorner.Parent = Status

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.fromOffset(6, 6)
StatusDot.Position = UDim2.new(0, 8, 0.5, -3)
StatusDot.BackgroundColor3 = Color3.fromRGB(70, 220, 120)
StatusDot.BorderSizePixel = 0
Status.ZIndex = 5
Status.Parent = Status

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = StatusDot

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -18, 1, 0)
StatusText.Position = UDim2.fromOffset(18, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "READY"
StatusText.TextColor3 = Color3.fromRGB(100, 230, 145)
StatusText.TextSize = 8
StatusText.Font = Enum.Font.GothamBold
StatusText.ZIndex = 5
StatusText.Parent = Status

-- =========================================================
-- COLLAPSE BUTTON
-- =========================================================

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.fromOffset(30, 30)
ToggleButton.Position = UDim2.new(1, -40, 0, 30)
ToggleButton.BackgroundColor3 = Color3.fromRGB(35, 37, 47)
ToggleButton.Text = "⌃"
ToggleButton.TextColor3 = TEXT
ToggleButton.TextSize = 17
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.AutoButtonColor = false
ToggleButton.ZIndex = 5
ToggleButton.Parent = Header

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 9)
ToggleCorner.Parent = ToggleButton

-- =========================================================
-- HEADER LINE
-- =========================================================

local HeaderLine = Instance.new("Frame")
HeaderLine.Size = UDim2.new(1, -24, 0, 1)
HeaderLine.Position = UDim2.new(0, 12, 1, 0)
HeaderLine.BackgroundColor3 = Color3.fromRGB(48, 50, 62)
HeaderLine.BorderSizePixel = 0
HeaderLine.ZIndex = 5
HeaderLine.Parent = Header

-- =========================================================
-- CONTAINER
-- =========================================================

local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -24, 1, -82)
Container.Position = UDim2.fromOffset(12, 78)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 9)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Container

-- =========================================================
-- RAGDOLL EVENT
-- =========================================================

local RagdollEvent =
    ReplicatedStorage.Library.Modules.Ragdoll.Ragdoll

-- =========================================================
-- BUTTON FUNCTION
-- =========================================================

local function createButton(text, description, color, callback)

    local Button = Instance.new("TextButton")
    Button.Name = text
    Button.Size = UDim2.new(1, 0, 0, 58)
    Button.BackgroundColor3 = BUTTON
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.ZIndex = 2
    Button.Parent = Container

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Button

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(48, 50, 62)
    Stroke.Transparency = 0.35
    Stroke.Thickness = 1
    Stroke.Parent = Button

    -- Accent
    local Accent = Instance.new("Frame")
    Accent.Size = UDim2.fromOffset(4, 34)
    Accent.Position = UDim2.fromOffset(8, 12)
    Accent.BackgroundColor3 = color
    Accent.BorderSizePixel = 0
    Accent.ZIndex = 3
    Accent.Parent = Button

    local AccentCorner = Instance.new("UICorner")
    AccentCorner.CornerRadius = UDim.new(1, 0)
    AccentCorner.Parent = Accent

    -- Title
    local ButtonTitle = Instance.new("TextLabel")
    ButtonTitle.Size = UDim2.new(1, -65, 0, 22)
    ButtonTitle.Position = UDim2.fromOffset(22, 7)
    ButtonTitle.BackgroundTransparency = 1
    ButtonTitle.Text = text
    ButtonTitle.TextColor3 = TEXT
    ButtonTitle.TextSize = 14
    ButtonTitle.Font = Enum.Font.GothamBold
    ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
    ButtonTitle.ZIndex = 4
    ButtonTitle.Parent = Button

    -- Description
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -65, 0, 16)
    Desc.Position = UDim2.fromOffset(22, 30)
    Desc.BackgroundTransparency = 1
    Desc.Text = description
    Desc.TextColor3 = SUBTEXT
    Desc.TextSize = 9
    Desc.Font = Enum.Font.Gotham
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.ZIndex = 4
    Desc.Parent = Button

    -- Arrow
    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.fromOffset(28, 28)
    Arrow.Position = UDim2.new(1, -38, 0.5, -14)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "›"
    Arrow.TextColor3 = color
    Arrow.TextSize = 24
    Arrow.Font = Enum.Font.GothamBold
    Arrow.ZIndex = 4
    Arrow.Parent = Button

    -- Hover animation
    Button.MouseEnter:Connect(function()

        TweenService:Create(
            Button,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad),
            {
                BackgroundColor3 = BUTTON_HOVER
            }
        ):Play()

        TweenService:Create(
            Arrow,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad),
            {
                Position = UDim2.new(1, -34, 0.5, -14)
            }
        ):Play()

    end)

    Button.MouseLeave:Connect(function()

        TweenService:Create(
            Button,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad),
            {
                BackgroundColor3 = BUTTON
            }
        ):Play()

        TweenService:Create(
            Arrow,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad),
            {
                Position = UDim2.new(1, -38, 0.5, -14)
            }
        ):Play()

    end)

    -- Click animation
    Button.MouseButton1Down:Connect(function()

        TweenService:Create(
            Button,
            TweenInfo.new(0.08),
            {
                Size = UDim2.new(1, -4, 0, 56)
            }
        ):Play()

    end)

    Button.MouseButton1Up:Connect(function()

        TweenService:Create(
            Button,
            TweenInfo.new(0.08),
            {
                Size = UDim2.new(1, 0, 0, 58)
            }
        ):Play()

    end)

    Button.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

    return Button
end

-- =========================================================
-- BACK
-- =========================================================

createButton(
    "Back",
    "Activate ragdoll backward",
    Color3.fromRGB(240, 75, 85),

    function()

        firesignal(
            RagdollEvent.OnClientEvent,
            "Make",
            2.5,
            Vector3.new(
                -7073.3930664062,
                854.7236328125,
                836.61865234375
            )
        )

    end
)

-- =========================================================
-- FRONT
-- =========================================================

createButton(
    "Front",
    "Activate ragdoll forward",
    Color3.fromRGB(245, 145, 55),

    function()

        firesignal(
            RagdollEvent.OnClientEvent,
            "Make",
            2.5,
            Vector3.new(
                6803.53125,
                854.7236328125,
                -2108.2624511719
            )
        )

    end
)

-- =========================================================
-- UP
-- =========================================================

createButton(
    "Up",
    "Remove ragdoll effect",
    Color3.fromRGB(70, 215, 120),

    function()

        firesignal(
            RagdollEvent.OnClientEvent,
            "Destroy",
            2.5
        )

    end
)

-- =========================================================
-- COLLAPSE
-- =========================================================

local collapsed = false

ToggleButton.MouseEnter:Connect(function()

    TweenService:Create(
        ToggleButton,
        TweenInfo.new(0.15),
        {
            BackgroundColor3 = Color3.fromRGB(50, 52, 64)
        }
    ):Play()

end)

ToggleButton.MouseLeave:Connect(function()

    TweenService:Create(
        ToggleButton,
        TweenInfo.new(0.15),
        {
            BackgroundColor3 = Color3.fromRGB(35, 37, 47)
        }
    ):Play()

end)

ToggleButton.MouseButton1Click:Connect(function()

    collapsed = not collapsed

    if collapsed then

        Container.Visible = false
        ToggleButton.Text = "⌄"

        TweenService:Create(
            MainFrame,
            TweenInfo.new(
                0.28,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.fromOffset(UI_WIDTH, CLOSED_HEIGHT)
            }
        ):Play()

    else

        Container.Visible = true
        ToggleButton.Text = "⌃"

        TweenService:Create(
            MainFrame,
            TweenInfo.new(
                0.28,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.fromOffset(UI_WIDTH, OPEN_HEIGHT)
            }
        ):Play()

    end

end)
