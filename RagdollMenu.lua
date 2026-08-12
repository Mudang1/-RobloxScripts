local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- =========================================================
-- ลบ UI เก่า
-- =========================================================

local OldGui = PlayerGui:FindFirstChild("RagdollMenu")
if OldGui then
    OldGui:Destroy()
end

-- =========================================================
-- SETTINGS
-- =========================================================

local WIDTH = 270
local OPEN_HEIGHT = 310
local MINI_HEIGHT = 64

local C = {
    BG = Color3.fromRGB(11, 12, 17),
    HEADER = Color3.fromRGB(21, 23, 31),
    CARD = Color3.fromRGB(27, 29, 38),
    HOVER = Color3.fromRGB(39, 42, 53),

    WHITE = Color3.fromRGB(245, 246, 250),
    GRAY = Color3.fromRGB(145, 148, 160),

    RED = Color3.fromRGB(238, 75, 88),
    ORANGE = Color3.fromRGB(245, 145, 55),
    GREEN = Color3.fromRGB(65, 215, 120),
    PURPLE = Color3.fromRGB(155, 95, 255)
}

-- =========================================================
-- SCREEN GUI
-- =========================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RagdollMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- =========================================================
-- MAIN WINDOW
-- =========================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(WIDTH, OPEN_HEIGHT)
Main.Position = UDim2.new(0.5, -WIDTH / 2, 0.5, -OPEN_HEIGHT / 2)
Main.BackgroundColor3 = C.BG
Main.BorderSizePixel = 0
Main.Active = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 18)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(55, 58, 72)
MainStroke.Thickness = 1
MainStroke.Transparency = 0.15
MainStroke.Parent = Main

-- =========================================================
-- HEADER
-- =========================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 64)
Header.BackgroundColor3 = C.HEADER
Header.BorderSizePixel = 0
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 18)
HeaderCorner.Parent = Header

local HeaderBottom = Instance.new("Frame")
HeaderBottom.Size = UDim2.new(1, 0, 0, 18)
HeaderBottom.Position = UDim2.new(0, 0, 1, -18)
HeaderBottom.BackgroundColor3 = C.HEADER
HeaderBottom.BorderSizePixel = 0
HeaderBottom.Parent = Header

-- =========================================================
-- LOGO
-- =========================================================

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.fromOffset(42, 42)
Logo.Position = UDim2.fromOffset(11, 11)
Logo.BackgroundColor3 = C.PURPLE
Logo.Text = "R"
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.TextSize = 21
Logo.Font = Enum.Font.GothamBold
Logo.Parent = Header

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 12)
LogoCorner.Parent = Logo

-- =========================================================
-- TITLE
-- =========================================================

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -145, 0, 23)
Title.Position = UDim2.fromOffset(63, 8)
Title.BackgroundTransparency = 1
Title.Text = "RAGDOLL"
Title.TextColor3 = C.WHITE
Title.TextSize = 17
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -145, 0, 18)
Subtitle.Position = UDim2.fromOffset(63, 32)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "CONTROL PANEL"
Subtitle.TextColor3 = C.GRAY
Subtitle.TextSize = 9
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

-- =========================================================
-- MINIMIZE
-- =========================================================

local MinButton = Instance.new("TextButton")
MinButton.Size = UDim2.fromOffset(30, 30)
MinButton.Position = UDim2.new(1, -72, 0, 17)
MinButton.BackgroundColor3 = Color3.fromRGB(42, 44, 55)
MinButton.Text = "—"
MinButton.TextColor3 = C.WHITE
MinButton.TextSize = 17
MinButton.Font = Enum.Font.GothamBold
MinButton.AutoButtonColor = false
MinButton.Parent = Header

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 9)
MinCorner.Parent = MinButton

-- =========================================================
-- CLOSE
-- =========================================================

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.fromOffset(30, 30)
CloseButton.Position = UDim2.new(1, -37, 0, 17)
CloseButton.BackgroundColor3 = Color3.fromRGB(55, 32, 38)
CloseButton.Text = "×"
CloseButton.TextColor3 = C.RED
CloseButton.TextSize = 20
CloseButton.Font = Enum.Font.GothamBold
CloseButton.AutoButtonColor = false
CloseButton.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 9)
CloseCorner.Parent = CloseButton

-- =========================================================
-- CONTENT
-- =========================================================

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -20, 1, -76)
Content.Position = UDim2.fromOffset(10, 72)
Content.BackgroundTransparency = 1
Content.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 9)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Content

-- =========================================================
-- SECTION TITLE
-- =========================================================

local Section = Instance.new("TextLabel")
Section.Size = UDim2.new(1, -8, 0, 20)
Section.BackgroundTransparency = 1
Section.Text = "RAGDOLL CONTROL"
Section.TextColor3 = C.GRAY
Section.TextSize = 9
Section.Font = Enum.Font.GothamBold
Section.TextXAlignment = Enum.TextXAlignment.Left
Section.Parent = Content

-- =========================================================
-- RAGDOLL EVENT
-- =========================================================

local RagdollEvent =
    ReplicatedStorage.Library.Modules.Ragdoll.Ragdoll

-- =========================================================
-- CREATE BUTTON
-- =========================================================

local function CreateButton(title, description, icon, color, callback)

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -4, 0, 66)
    Button.BackgroundColor3 = C.CARD
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = Content

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 13)
    Corner.Parent = Button

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(55, 58, 70)
    Stroke.Transparency = 0.3
    Stroke.Thickness = 1
    Stroke.Parent = Button

    -- Icon
    local Icon = Instance.new("TextLabel")
    Icon.Size = UDim2.fromOffset(42, 42)
    Icon.Position = UDim2.fromOffset(11, 12)
    Icon.BackgroundColor3 = color
    Icon.Text = icon
    Icon.TextColor3 = Color3.new(1, 1, 1)
    Icon.TextSize = 19
    Icon.Font = Enum.Font.GothamBold
    Icon.Parent = Button

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 12)
    IconCorner.Parent = Icon

    -- Title
    local ButtonTitle = Instance.new("TextLabel")
    ButtonTitle.Size = UDim2.new(1, -105, 0, 22)
    ButtonTitle.Position = UDim2.fromOffset(63, 10)
    ButtonTitle.BackgroundTransparency = 1
    ButtonTitle.Text = title
    ButtonTitle.TextColor3 = C.WHITE
    ButtonTitle.TextSize = 14
    ButtonTitle.Font = Enum.Font.GothamBold
    ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
    ButtonTitle.Parent = Button

    -- Description
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -105, 0, 18)
    Desc.Position = UDim2.fromOffset(63, 33)
    Desc.BackgroundTransparency = 1
    Desc.Text = description
    Desc.TextColor3 = C.GRAY
    Desc.TextSize = 9
    Desc.Font = Enum.Font.Gotham
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.Parent = Button

    -- Arrow
    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.fromOffset(25, 25)
    Arrow.Position = UDim2.new(1, -36, 0.5, -12)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "›"
    Arrow.TextColor3 = color
    Arrow.TextSize = 25
    Arrow.Font = Enum.Font.GothamBold
    Arrow.Parent = Button

    -- Hover
    Button.MouseEnter:Connect(function()

        TweenService:Create(
            Button,
            TweenInfo.new(0.15),
            {
                BackgroundColor3 = C.HOVER
            }
        ):Play()

        TweenService:Create(
            Arrow,
            TweenInfo.new(0.15),
            {
                Position = UDim2.new(1, -31, 0.5, -12)
            }
        ):Play()

    end)

    Button.MouseLeave:Connect(function()

        TweenService:Create(
            Button,
            TweenInfo.new(0.15),
            {
                BackgroundColor3 = C.CARD
            }
        ):Play()

        TweenService:Create(
            Arrow,
            TweenInfo.new(0.15),
            {
                Position = UDim2.new(1, -36, 0.5, -12)
            }
        ):Play()

    end)

    -- Click
    Button.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

    return Button
end

-- =========================================================
-- BACK
-- =========================================================

CreateButton(
    "BACK",
    "Activate ragdoll backward",
    "←",
    C.RED,
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
    C.ORANGE,
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
    C.GREEN,
    function()

        firesignal(
            RagdollEvent.OnClientEvent,
            "Destroy",
            2.5
        )

    end
)

-- =========================================================
-- MINIMIZE / RESTORE
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
                0.25,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.fromOffset(WIDTH, MINI_HEIGHT)
            }
        ):Play()

    else

        MinButton.Text = "—"

        TweenService:Create(
            Main,
            TweenInfo.new(
                0.25,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.fromOffset(WIDTH, OPEN_HEIGHT)
            }
        ):Play()

        task.delay(0.12, function()
            Content.Visible = true
        end)

    end

end)

-- =========================================================
-- CLOSE
-- =========================================================

CloseButton.MouseButton1Click:Connect(function()

    local Animation = TweenService:Create(
        Main,
        TweenInfo.new(
            0.2,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.fromOffset(0, 0)
        }
    )

    Animation:Play()
    Animation.Completed:Wait()

    ScreenGui:Destroy()

end)

-- =========================================================
-- DRAG SYSTEM
-- รองรับ PC + มือถือ
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

        Input.Changed:Connect(function()

            if Input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end

        end)

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
