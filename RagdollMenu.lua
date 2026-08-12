local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- =========================================================
-- ลบ UI เก่า
-- =========================================================

for _, v in ipairs(PlayerGui:GetChildren()) do
    if v.Name == "RagdollMenu" then
        v:Destroy()
    end
end

-- =========================================================
-- SETTINGS
-- =========================================================

local WIDTH = 270
local OPEN_HEIGHT = 315
local MINI_HEIGHT = 62

local BG = Color3.fromRGB(12, 13, 18)
local HEADER = Color3.fromRGB(20, 22, 29)
local CARD = Color3.fromRGB(27, 29, 37)
local CARD_HOVER = Color3.fromRGB(37, 40, 50)

local WHITE = Color3.fromRGB(245, 245, 250)
local GRAY = Color3.fromRGB(145, 148, 158)

local RED = Color3.fromRGB(235, 70, 82)
local ORANGE = Color3.fromRGB(240, 135, 45)
local GREEN = Color3.fromRGB(55, 205, 105)
local PURPLE = Color3.fromRGB(145, 85, 240)

-- =========================================================
-- SCREEN GUI
-- =========================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RagdollMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = PlayerGui

-- =========================================================
-- MAIN
-- =========================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(WIDTH, OPEN_HEIGHT)
Main.Position = UDim2.new(
    0.5,
    -WIDTH / 2,
    0.5,
    -OPEN_HEIGHT / 2
)

Main.BackgroundColor3 = BG
Main.BackgroundTransparency = 0
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Active = true
Main.ZIndex = 10
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = Main

-- เส้นขอบบาง ๆ สีเข้ม
local Border = Instance.new("UIStroke")
Border.Color = Color3.fromRGB(45, 47, 58)
Border.Thickness = 1
Border.Transparency = 0.35
Border.Parent = Main

-- =========================================================
-- HEADER
-- =========================================================

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 62)
Header.Position = UDim2.fromOffset(0, 0)
Header.BackgroundColor3 = HEADER
Header.BackgroundTransparency = 0
Header.BorderSizePixel = 0
Header.ZIndex = 20
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 16)
HeaderCorner.Parent = Header

-- ปิดมุมล่างของ Header
local HeaderBottom = Instance.new("Frame")
HeaderBottom.Size = UDim2.new(1, 0, 0, 18)
HeaderBottom.Position = UDim2.new(0, 0, 1, -18)
HeaderBottom.BackgroundColor3 = HEADER
HeaderBottom.BorderSizePixel = 0
HeaderBottom.ZIndex = 20
HeaderBottom.Parent = Header

-- =========================================================
-- LOGO
-- =========================================================

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.fromOffset(42, 42)
Logo.Position = UDim2.fromOffset(10, 10)
Logo.BackgroundColor3 = PURPLE
Logo.BorderSizePixel = 0
Logo.Text = "R"
Logo.TextColor3 = WHITE
Logo.TextSize = 21
Logo.Font = Enum.Font.GothamBold
Logo.ZIndex = 25
Logo.Parent = Header

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 11)
LogoCorner.Parent = Logo

-- =========================================================
-- TITLE
-- =========================================================

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -145, 0, 23)
Title.Position = UDim2.fromOffset(62, 8)
Title.BackgroundTransparency = 1
Title.Text = "Ragdoll Menu"
Title.TextColor3 = WHITE
Title.TextSize = 17
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 25
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -145, 0, 18)
Subtitle.Position = UDim2.fromOffset(62, 32)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Control Panel"
Subtitle.TextColor3 = GRAY
Subtitle.TextSize = 9
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.ZIndex = 25
Subtitle.Parent = Header

-- =========================================================
-- MINIMIZE
-- =========================================================

local MinButton = Instance.new("TextButton")
MinButton.Size = UDim2.fromOffset(30, 30)
MinButton.Position = UDim2.new(1, -72, 0, 16)
MinButton.BackgroundColor3 = Color3.fromRGB(40, 42, 52)
MinButton.BorderSizePixel = 0
MinButton.Text = "−"
MinButton.TextColor3 = WHITE
MinButton.TextSize = 18
MinButton.Font = Enum.Font.GothamBold
MinButton.AutoButtonColor = false
MinButton.ZIndex = 30
MinButton.Parent = Header

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 9)
MinCorner.Parent = MinButton

-- =========================================================
-- CLOSE
-- =========================================================

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.fromOffset(30, 30)
CloseButton.Position = UDim2.new(1, -37, 0, 16)
CloseButton.BackgroundColor3 = Color3.fromRGB(55, 30, 36)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "×"
CloseButton.TextColor3 = RED
CloseButton.TextSize = 20
CloseButton.Font = Enum.Font.GothamBold
CloseButton.AutoButtonColor = false
CloseButton.ZIndex = 30
CloseButton.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 9)
CloseCorner.Parent = CloseButton

-- =========================================================
-- CONTENT
-- =========================================================

local Content = Instance.new("Frame")
Content.Name = "Content"

Content.Size = UDim2.new(1, -20, 1, -72)
Content.Position = UDim2.fromOffset(10, 72)

-- สำคัญ: กำหนดสีเอง ไม่ปล่อยให้เป็นสีขาว
Content.BackgroundColor3 = BG
Content.BackgroundTransparency = 0

Content.BorderSizePixel = 0
Content.ZIndex = 15
Content.Parent = Main

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 10)
ContentCorner.Parent = Content

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 8)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.VerticalAlignment = Enum.VerticalAlignment.Top
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Content

-- =========================================================
-- SECTION
-- =========================================================

local Section = Instance.new("TextLabel")
Section.Name = "Section"
Section.Size = UDim2.new(1, -8, 0, 22)
Section.BackgroundTransparency = 1
Section.Text = "RAGDOLL CONTROL"
Section.TextColor3 = GRAY
Section.TextSize = 9
Section.Font = Enum.Font.GothamBold
Section.TextXAlignment = Enum.TextXAlignment.Left
Section.ZIndex = 20
Section.LayoutOrder = 1
Section.Parent = Content

-- =========================================================
-- RAGDOLL EVENT
-- =========================================================

local RagdollEvent =
    ReplicatedStorage.Library.Modules.Ragdoll.Ragdoll

-- =========================================================
-- BUTTON
-- =========================================================

local function CreateButton(
    title,
    description,
    icon,
    color,
    order,
    callback
)

    local Button = Instance.new("TextButton")

    Button.Name = title
    Button.Size = UDim2.new(1, -4, 0, 68)

    Button.BackgroundColor3 = CARD
    Button.BackgroundTransparency = 0

    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false

    Button.ZIndex = 20
    Button.LayoutOrder = order
    Button.Parent = Content

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Button

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(55, 58, 70)
    Stroke.Thickness = 1
    Stroke.Transparency = 0.45
    Stroke.Parent = Button

    -- =====================================================
    -- ICON
    -- =====================================================

    local Icon = Instance.new("TextLabel")
    Icon.Size = UDim2.fromOffset(44, 44)
    Icon.Position = UDim2.fromOffset(10, 12)

    Icon.BackgroundColor3 = color
    Icon.BackgroundTransparency = 0

    Icon.BorderSizePixel = 0
    Icon.Text = icon
    Icon.TextColor3 = WHITE
    Icon.TextSize = 19
    Icon.Font = Enum.Font.GothamBold

    Icon.ZIndex = 25
    Icon.Parent = Button

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 11)
    IconCorner.Parent = Icon

    -- =====================================================
    -- TITLE
    -- =====================================================

    local ButtonTitle = Instance.new("TextLabel")
    ButtonTitle.Size = UDim2.new(1, -105, 0, 22)
    ButtonTitle.Position = UDim2.fromOffset(63, 9)

    ButtonTitle.BackgroundTransparency = 1
    ButtonTitle.Text = title
    ButtonTitle.TextColor3 = WHITE
    ButtonTitle.TextSize = 14
    ButtonTitle.Font = Enum.Font.GothamBold
    ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left

    ButtonTitle.ZIndex = 25
    ButtonTitle.Parent = Button

    -- =====================================================
    -- DESCRIPTION
    -- =====================================================

    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -105, 0, 18)
    Desc.Position = UDim2.fromOffset(63, 33)

    Desc.BackgroundTransparency = 1
    Desc.Text = description
    Desc.TextColor3 = GRAY
    Desc.TextSize = 9
    Desc.Font = Enum.Font.Gotham
    Desc.TextXAlignment = Enum.TextXAlignment.Left

    Desc.ZIndex = 25
    Desc.Parent = Button

    -- =====================================================
    -- ARROW
    -- =====================================================

    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.fromOffset(25, 25)
    Arrow.Position = UDim2.new(1, -35, 0.5, -12)

    Arrow.BackgroundTransparency = 1
    Arrow.Text = "›"
    Arrow.TextColor3 = color
    Arrow.TextSize = 25
    Arrow.Font = Enum.Font.GothamBold

    Arrow.ZIndex = 25
    Arrow.Parent = Button

    -- =====================================================
    -- HOVER
    -- =====================================================

    Button.MouseEnter:Connect(function()

        TweenService:Create(
            Button,
            TweenInfo.new(0.12),
            {
                BackgroundColor3 = CARD_HOVER
            }
        ):Play()

        TweenService:Create(
            Arrow,
            TweenInfo.new(0.12),
            {
                Position = UDim2.new(1, -30, 0.5, -12)
            }
        ):Play()

    end)

    Button.MouseLeave:Connect(function()

        TweenService:Create(
            Button,
            TweenInfo.new(0.12),
            {
                BackgroundColor3 = CARD
            }
        ):Play()

        TweenService:Create(
            Arrow,
            TweenInfo.new(0.12),
            {
                Position = UDim2.new(1, -35, 0.5, -12)
            }
        ):Play()

    end)

    -- =====================================================
    -- CLICK
    -- =====================================================

    Button.MouseButton1Click:Connect(function()

        pcall(function()
            callback()
        end)

    end)

end

-- =========================================================
-- BACK
-- =========================================================

CreateButton(
    "BACK",
    "Activate ragdoll backward",
    "←",
    RED,
    2,

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

CreateButton(
    "FRONT",
    "Activate ragdoll forward",
    "→",
    ORANGE,
    3,

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

CreateButton(
    "UP",
    "Remove ragdoll effect",
    "↑",
    GREEN,
    4,

    function()

        firesignal(
            RagdollEvent.OnClientEvent,
            "Destroy",
            2.5
        )

    end
)

-- =========================================================
-- MINIMIZE
-- =========================================================

local Minimized = false

MinButton.MouseButton1Click:Connect(function()

    Minimized = not Minimized

    if Minimized then

        Content.Visible = false
        MinButton.Text = "+"

        TweenService:Create(
            Main,
            TweenInfo.new(
                0.22,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.fromOffset(
                    WIDTH,
                    MINI_HEIGHT
                )
            }
        ):Play()

    else

        MinButton.Text = "−"

        TweenService:Create(
            Main,
            TweenInfo.new(
                0.22,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.fromOffset(
                    WIDTH,
                    OPEN_HEIGHT
                )
            }
        ):Play()

        task.delay(0.12, function()

            if not Minimized then
                Content.Visible = true
            end

        end)

    end

end)

-- =========================================================
-- CLOSE
-- =========================================================

CloseButton.MouseButton1Click:Connect(function()

    local Tween = TweenService:Create(
        Main,
        TweenInfo.new(
            0.18,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.fromOffset(0, 0)
        }
    )

    Tween:Play()
    Tween.Completed:Wait()

    ScreenGui:Destroy()

end)

-- =========================================================
-- DRAG
-- PC + MOBILE
-- =========================================================

local Dragging = false
local DragStart
local StartPosition

Header.InputBegan:Connect(function(Input)

    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = Input.Position
        StartPosition = Main.Position

    end

end)

Header.InputEnded:Connect(function(Input)

    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        Dragging = false

    end

end)

UserInputService.InputChanged:Connect(function(Input)

    if not Dragging then
        return
    end

    if Input.UserInputType == Enum.UserInputType.MouseMovement
        or Input.UserInputType == Enum.UserInputType.Touch then

        local Delta = Input.Position - DragStart

        Main.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )

    end

end)
