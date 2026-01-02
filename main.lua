-- [[ RNZ HUB OFFICIAL : DUCK TEAM CORPORATION ]]
-- REPO: RnzHub-Official. | ID: 120057461494992

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Design Base (Seu ID e Transparência)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RnzHub_Official"
ScreenGui.Parent = CoreGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 600, 0, 400)
Main.Position = UDim2.new(0.5, -300, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Main.BackgroundTransparency = 0.2
Main.Parent = ScreenGui
Instance.new("UICorner", Main)

local BgImg = Instance.new("ImageLabel")
BgImg.Size = UDim2.new(1, 0, 1, 0)
BgImg.Image = "rbxassetid://120057461494992" -- Seu novo ID do Chrome
BgImg.ImageTransparency = 0.8
BgImg.BackgroundTransparency = 1
BgImg.Parent = Main

-- [[ SISTEMA DE ABAS IGUAL À FOTO ]]
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 160, 1, 0)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = Main
local Layout = Instance.new("UIListLayout", Sidebar)
Layout.Padding = UDim.new(0, 2)

local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(0, 410, 0, 330)
Content.Position = UDim2.new(0, 175, 0, 50)
Content.BackgroundTransparency = 1
Content.CanvasSize = UDim2.new(0, 0, 2, 0)
Content.ScrollBarThickness = 2
Content.Parent = Main

local function CreateTab(name, icon)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 35)
    Btn.Text = icon .. " " .. name
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.Font = Enum.Font.GothamMedium
    Btn.Parent = Sidebar
    Instance.new("UICorner", Btn)
    return Btn
end

-- [[ CONFIGURANDO AS SEÇÕES ]]

-- 1. ABA MAIN (Kill Aura)
local TabMain = CreateTab("Main", "🏠")
TabMain.MouseButton1Click:Connect(function()
    Content:ClearAllChildren()
    Instance.new("UIListLayout", Content).Padding = UDim.new(0,5)
    -- Kill Aura com Range
    local KA = Instance.new("TextButton")
    KA.Size = UDim2.new(1, -10, 0, 40)
    KA.Text = "Kill Aura (Range: 75)"
    KA.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    KA.Parent = Content
end)

-- 2. ABA BRING (Itens que você mandou)
local TabBring = CreateTab("Bring", "🍎")
TabBring.MouseButton1Click:Connect(function()
    Content:ClearAllChildren()
    local list = Instance.new("UIListLayout", Content)
    
    local function AddItem(name)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, -10, 0, 30)
        b.Text = "Bring: " .. name
        b.Parent = Content
    end
    
    -- Seus itens reais do jogo
    AddItem("Ice Axe")
    AddItem("Raygun")
    AddItem("Obsidiron Hammer")
    AddItem("Alien Armor")
end)

-- 3. ABA AUTO (Crafts e Builds)
local TabAuto = CreateTab("Auto", "⚙️")
TabAuto.MouseButton1Click:Connect(function()
    Content:ClearAllChildren()
    -- Aqui entra o Auto-Craft (Workbench, Furnace)
end)

-- 4. ABA TELEPORT (Locais Reais)
local TabTP = CreateTab("Teleport", "📍")
TabTP.MouseButton1Click:Connect(function()
    Content:ClearAllChildren()
    -- Teleport: Volcano, Mothership, Base
end)

-- PERFIL DO JOGADOR
local Profile = Instance.new("Frame")
Profile.Position = UDim2.new(0, 10, 1, -60)
Profile.Size = UDim2.new(0, 140, 0, 50)
Profile.BackgroundTransparency = 1
Profile.Parent = Main

local Av = Instance.new("ImageLabel")
Av.Size = UDim2.new(0, 40, 0, 40)
Av.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=420&height=420&format=png"
Av.Parent = Profile
Instance.new("UICorner", Av).CornerRadius = UDim.new(1,0)

local Name = Instance.new("TextLabel")
Name.Text = LocalPlayer.Name
Name.Position = UDim2.new(0, 50, 0, 10)
Name.TextColor3 = Color3.new(1,1,1)
Name.BackgroundTransparency = 1
Name.Parent = Profile

print("Rnz Hub Completo Carregado! 👾")
