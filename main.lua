-- [[ RNZ HUB : DUCK TEAM CORPORATION ]]
-- [[ VERSÃO FINAL PARA MAIN GITHUB ]]

local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Limpeza de Versões Antigas
if CoreGui:FindFirstChild("RnzHub_Ultra") then 
    CoreGui:FindFirstChild("RnzHub_Ultra"):Destroy() 
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RnzHub_Ultra"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- 1. JANELA PRINCIPAL (TRANSPARENTE + SEU ID)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 650, 0, 420)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
MainFrame.BackgroundTransparency = 0.2 -- Efeito Glassmorphism da foto
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

-- AQUI ESTÁ O TEU ID QUE FALTAVA!
local BgImg = Instance.new("ImageLabel")
BgImg.Size = UDim2.new(1, 0, 1, 0)
BgImg.Image = "rbxassetid://125707463606949" -- O ID que tu pegaste no Chrome
BgImg.ImageTransparency = 0.8
BgImg.BackgroundTransparency = 1
BgImg.ZIndex = 0
BgImg.Parent = MainFrame
Instance.new("UICorner", BgImg).CornerRadius = UDim.new(0, 10)

-- 2. BARRA LATERAL NEON
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 160, 1, 0)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = MainFrame

local NeonLine = Instance.new("Frame")
NeonLine.Size = UDim2.new(0, 2, 0, 380)
NeonLine.Position = UDim2.new(0, 165, 0, 20)
NeonLine.BackgroundColor3 = Color3.fromRGB(0, 255, 150) -- Verde Neon da tua foto
NeonLine.BorderSizePixel = 0
NeonLine.Parent = MainFrame

-- 3. PERFIL DO JOGADOR (SZTEST123 STYLE)
local UserProfile = Instance.new("Frame")
UserProfile.Position = UDim2.new(0, 10, 1, -70)
UserProfile.Size = UDim2.new(0, 150, 0, 60)
UserProfile.BackgroundTransparency = 1
UserProfile.Parent = MainFrame

local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.new(0, 45, 0, 45)
Avatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..Player.UserId.."&width=420&height=420&format=png"
Avatar.Parent = UserProfile
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)

local NameTag = Instance.new("TextLabel")
NameTag.Text = Player.Name
NameTag.TextColor3 = Color3.new(1, 1, 1)
NameTag.Position = UDim2.new(0, 55, 0, 5)
NameTag.Font = Enum.Font.GothamBold
NameTag.TextXAlignment = Enum.TextXAlignment.Left
NameTag.BackgroundTransparency = 1
NameTag.Parent = UserProfile

-- 4. FUNÇÕES DE ELITE (BASEADAS NAS FOTOS)
-- KILL AURA (99 NIGHTS)
local KillAuraActive = false
local function DoKillAura()
    while KillAuraActive do
        task.wait(0.1)
        -- Aqui entra a lógica de detectar inimigos próximos
    end
end

-- TÍTULOS E INTERFACE
local HubTitle = Instance.new("TextLabel")
HubTitle.Text = "DUCK Team Corporation | Rnz Hub"
HubTitle.TextColor3 = Color3.fromRGB(0, 255, 150)
HubTitle.Position = UDim2.new(0, 185, 0, 15)
HubTitle.TextSize = 18
HubTitle.Font = Enum.Font.GothamBold
HubTitle.BackgroundTransparency = 1
HubTitle.Parent = MainFrame

print("RNZ HUB BYDUCK: CARREGADO COM SUCESSO E ID ATIVO! 👾")
