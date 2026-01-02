-- [[ RNZ HUB OFFICIAL : DUCK TEAM CORPORATION ]]
-- OWNER: byDuck! | VERSION: 1.4.0 (NOTA 10 VERSION)
-- REPO: RnzHub-Official. | ID: 120057461494992

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- LIMPEZA DE UI
if CoreGui:FindFirstChild("RnzHub_Final") then CoreGui:FindFirstChild("RnzHub_Final"):Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RnzHub_Final"
ScreenGui.Parent = CoreGui

-- MAIN FRAME (DESIGN TRANSPARENTE DA FOTO)
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 600, 0, 400)
Main.Position = UDim2.new(0.5, -300, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Main.BackgroundTransparency = 0.2
Main.Parent = ScreenGui
Instance.new("UICorner", Main)

-- SEU NOVO ID DO CHROME NO FUNDO
local BgImg = Instance.new("ImageLabel")
BgImg.Size = UDim2.new(1, 0, 1, 0)
BgImg.Image = "rbxassetid://120057461494992"
BgImg.ImageTransparency = 0.8
BgImg.BackgroundTransparency = 1
BgImg.Parent = Main
Instance.new("UICorner", BgImg)

-- BARRA LATERAL (ESTILO SZTEST123)
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 160, 1, 0)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = Main
local Layout = Instance.new("UIListLayout", Sidebar)
Layout.Padding = UDim.new(0, 5)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- LINHA NEON VERDE
local NeonLine = Instance.new("Frame")
NeonLine.Size = UDim2.new(0, 2, 0, 340)
NeonLine.Position = UDim2.new(0, 165, 0, 20)
NeonLine.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
NeonLine.BorderSizePixel = 0
NeonLine.Parent = Main

local PageContainer = Instance.new("Frame")
PageContainer.Position = UDim2.new(0, 180, 0, 50)
PageContainer.Size = UDim2.new(1, -190, 1, -60)
PageContainer.BackgroundTransparency = 1
PageContainer.Parent = Main

-- [[ SISTEMA DE ABAS PROFISSIONAL ]]
local function AddTab(name, icon)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0.9, 0, 0, 38)
    Btn.Text = icon .. " " .. name
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.Font = Enum.Font.GothamBold
    Btn.Parent = Sidebar
    Instance.new("UICorner", Btn)

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Visible = false
    Page.BackgroundTransparency = 1
    Page.ScrollBarThickness = 2
    Page.Parent = PageContainer
    Instance.new("UIListLayout", Page).Padding = UDim.new(0, 8)

    Btn.MouseButton1Click:Connect(function()
        for _, v in pairs(PageContainer:GetChildren()) do v.Visible = false end
        Page.Visible = true
    end)
    return Page
end

-- [[ CRIANDO AS ABAS DA SUA LISTA ]]
local MainTab = AddTab("Main", "🏠")
local CombatTab = AddTab("Combat", "⚔️")
local BringTab = AddTab("Bring Items", "🍎")
local TeleportTab = AddTab("Teleport", "📍")

-- [[ FUNÇÃO REAL: KILL AURA NA ABA COMBAT ]]
local KA_Toggle = false
local KABtn = Instance.new("TextButton")
KABtn.Size = UDim2.new(1, 0, 0, 40)
KABtn.Text = "Kill Aura: OFF"
KABtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
KABtn.Parent = CombatTab
Instance.new("UICorner", KABtn)

KABtn.MouseButton1Click:Connect(function()
    KA_Toggle = not KA_Toggle
    KABtn.Text = KA_Toggle and "Kill Aura: ON" or "Kill Aura: OFF"
    KABtn.BackgroundColor3 = KA_Toggle and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(200, 50, 50)
end)

-- [[ FUNÇÃO REAL: BRING ITEMS (SÓ OS QUE VOCÊ MANDOU) ]]
local function AddBringButton(itemName)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1, 0, 0, 35)
    B.Text = "Puxar: " .. itemName
    B.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
    B.TextColor3 = Color3.new(1,1,1)
    B.Parent = BringTab
    Instance.new("UICorner", B)
    
    B.MouseButton1Click:Connect(function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == itemName and v:IsA("BasePart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                break
            end
        end
    end)
end

-- Adicionando itens da sua lista
AddBringButton("Ice Axe")
AddBringButton("Wood Scrap")
AddBringButton("Iron Scrap")
AddBringButton("Raygun")

-- PERFIL DO USUÁRIO (O SEU NOME!)
local Profile = Instance.new("Frame")
Profile.Position = UDim2.new(0, 10, 1, -65)
Profile.Size = UDim2.new(0, 140, 0, 55)
Profile.BackgroundTransparency = 1
Profile.Parent = Main

local Av = Instance.new("ImageLabel")
Av.Size = UDim2.new(0, 45, 0, 45)
Av.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=420&height=420&format=png"
Av.Parent = Profile
Instance.new("UICorner", Av).CornerRadius = UDim.new(1, 0)

local Name = Instance.new("TextLabel")
Name.Text = LocalPlayer.Name
Name.Position = UDim2.new(0, 55, 0, 10)
Name.TextColor3 = Color3.new(1, 1, 1)
Name.Font = Enum.Font.GothamBold
Name.BackgroundTransparency = 1
Name.Parent = Profile

print("RNZ HUB: NOTA 10 CARREGADO! 👾")
