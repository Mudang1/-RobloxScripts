local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ลบ UI เก่าถ้ามี
local OldGui = PlayerGui:FindFirstChild("RagdollMenu")
if OldGui then
    OldGui:Destroy()
end

-- =========================
-- ScreenGui
-- =========================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RagdollMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- =========================
-- Main Window
-- =========================

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 220, 0, 235)
MainFrame.Position = UDim2.new(0.08, 0, 0.15, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

-- เงา
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 5)
Shadow.Size = UDim2.new(1, 25, 1, 25)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageTransparency = 0.55
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.ZIndex = 0
Shadow.Parent = MainFrame

-- =========================
-- Header
-- =========================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 55)
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 31)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 14)
HeaderCorner.Parent = Header

-- ทำส่วนล่างของ Header ให้ไม่โค้ง
local HeaderBottom = Instance.new("Frame")
HeaderBottom.Size = UDim2.new(1, 0, 0, 15)
HeaderBottom.Position = UDim2.new(0, 0, 1, -15)
HeaderBottom.BackgroundColor3 = Color3.fromRGB(25, 25, 31)
HeaderBottom.BorderSizePixel = 0
HeaderBottom.Parent = Header

-- Icon
local Icon = Instance.new("TextLabel")
Icon.Size = UDim2.new(0, 40, 0, 40)
Icon.Position = UDim2.new(0, 10, 0, 7)
Icon.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
Icon.Text = "R"
Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
Icon.TextSize = 22
Icon.Font = Enum.Font.GothamBold
Icon.Parent = Header

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 10)
IconCorner.Parent = Icon

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 120, 0, 25)
Title.Position = UDim2.new(0, 58, 0, 8)
Title.BackgroundTransparency = 1
Title.Text = "Ragdoll Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 17
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0, 120, 0, 18)
Subtitle.Position = UDim2.new(0, 58, 0, 30)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Control Panel"
Subtitle.TextColor3 = Color3.fromRGB(140, 140, 150)
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

-- =========================
-- ปุ่มพับ
-- =========================

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 32, 0, 32)
ToggleButton.Position = UDim2.new(1, -42, 0, 11)
ToggleButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
ToggleButton.Text = "−"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 20
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Parent = Header

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 9)
ToggleCorner.Parent = ToggleButton

-- =========================
-- Container
-- =========================

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -20, 1, -70)
Container.Position = UDim2.new(0, 10, 0, 62)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 8)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Container

-- =========================
-- Ragdoll Event
-- =========================

local RagdollEvent =
    ReplicatedStorage.Library.Modules.Ragdoll.Ragdoll

-- =========================
-- สร้างปุ่ม
-- =========================

local function createButton(text, description, color, callback)

    local Button = Instance.new("TextButton")

    Button.Size = UDim2.new(1, 0, 0, 48)
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 37)
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.LayoutOrder = 1
    Button.Parent = Container

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = Button

    -- แถบสีด้านซ้าย
    local Accent = Instance.new("Frame")
    Accent.Size = UDim2.new(0, 4, 1, -14)
    Accent.Position = UDim2.new(0, 7, 0, 7)
    Accent.BackgroundColor3 = color
    Accent.BorderSizePixel = 0
    Accent.Parent = Button

    local AccentCorner = Instance.new("UICorner")
    AccentCorner.CornerRadius = UDim.new(1, 0)
    AccentCorner.Parent = Accent

    -- ชื่อปุ่ม
    local ButtonTitle = Instance.new("TextLabel")
    ButtonTitle.Size = UDim2.new(1, -55, 0, 22)
    ButtonTitle.Position = UDim2.new(0, 22, 0, 5)
    ButtonTitle.BackgroundTransparency = 1
    ButtonTitle.Text = text
    ButtonTitle.TextColor3 = Color3.fromRGB(245, 245, 245)
    ButtonTitle.TextSize = 15
    ButtonTitle.Font = Enum.Font.GothamBold
    ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
    ButtonTitle.Parent = Button

    -- คำอธิบาย
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -55, 0, 16)
    Desc.Position = UDim2.new(0, 22, 0, 27)
    Desc.BackgroundTransparency = 1
    Desc.Text = description
    Desc.TextColor3 = Color3.fromRGB(130, 130, 140)
    Desc.TextSize = 10
    Desc.Font = Enum.Font.Gotham
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.Parent = Button

    -- ลูกศร
    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.new(0, 25, 0, 25)
    Arrow.Position = UDim2.new(1, -32, 0.5, -12)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "›"
    Arrow.TextColor3 = color
    Arrow.TextSize = 24
    Arrow.Font = Enum.Font.GothamBold
    Arrow.Parent = Button

    -- Hover
    Button.MouseEnter:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    end)

    Button.MouseLeave:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(30, 30, 37)
    end)

    Button.MouseButton1Click:Connect(callback)

    return Button
end

-- =========================
-- Back
-- =========================

createButton(
    "Back",
    "Activate ragdoll backward",
    Color3.fromRGB(220, 70, 70),
    function()
        pcall(function()
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
        end)
    end
)

-- =========================
-- Front
-- =========================

createButton(
    "Front",
    "Activate ragdoll forward",
    Color3.fromRGB(230, 130, 50),
    function()
        pcall(function()
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
        end)
    end
)

-- =========================
-- Up
-- =========================

createButton(
    "Up",
    "Remove ragdoll effect",
    Color3.fromRGB(60, 190, 100),
    function()
        pcall(function()
            firesignal(
                RagdollEvent.OnClientEvent,
                "Destroy",
                2.5
            )
        end)
    end
)

-- =========================
-- พับ / เปิด
-- =========================

local collapsed = false

ToggleButton.MouseButton1Click:Connect(function()

    collapsed = not collapsed

    if collapsed then

        Container.Visible = false

        MainFrame.Size = UDim2.new(0, 220, 0, 55)

        ToggleButton.Text = "+"

    else

        Container.Visible = true

        MainFrame.Size = UDim2.new(0, 220, 0, 235)

        ToggleButton.Text = "−"

    end
    
end)
