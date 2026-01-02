-- [[ RNZ HUB OFFICIAL 👾 ]]
-- OWNER: byDuck! | VERSION: 1.0.1
-- DATABASE: 99 Nights (Itens, Mobs e Locais Reais)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

-- [[ TEMA PREMIUM ]]
local Theme = {
    Main = Color3.fromRGB(15, 17, 28),
    Side = Color3.fromRGB(10, 12, 20),
    Accent = Color3.fromRGB(0, 119, 255),
    Text = Color3.fromRGB(255, 255, 255),
    Button = Color3.fromRGB(25, 30, 45)
}

-- [[ UI BASE ]]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RnzHub_Official"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- [[ 1. TELA DE BOAS-VINDAS ]]
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Size = UDim2.new(0, 400, 0, 250)
WelcomeFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
WelcomeFrame.BackgroundColor3 = Theme.Main
WelcomeFrame.Parent = ScreenGui
Instance.new("UICorner", WelcomeFrame).CornerRadius = UDim.new(0, 15)

local W_Title = Instance.new("TextLabel")
W_Title.Size = UDim2.new(1, 0, 0, 60)
W_Title.Text = "Bem-Vindo(a) ao Rnz Hub 👾!"
W_Title.TextColor3 = Theme.Accent
W_Title.Font = Enum.Font.GothamBold
W_Title.TextSize = 22
W_Title.BackgroundTransparency = 1
W_Title.Parent = WelcomeFrame

local W_Desc = Instance.new("TextLabel")
W_Desc.Size = UDim2.new(0.9, 0, 0, 80)
W_Desc.Position = UDim2.new(0.05, 0, 0.25, 0)
W_Desc.Text = "Ele não é arisco e não morde, a menos que você nos siga no YouTube!"
W_Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
W_Desc.Font = Enum.Font.Gotham
W_Desc.TextSize = 14
W_Desc.TextWrapped = true
W_Desc.BackgroundTransparency = 1
W_Desc.Parent = WelcomeFrame

local BtnCont = Instance.new("TextButton")
BtnCont.Size = UDim2.new(0, 130, 0, 40)
BtnCont.Position = UDim2.new(0.15, 0, 0.75, 0)
BtnCont.BackgroundColor3 = Theme.Button
BtnCont.Text = "Continuar"
BtnCont.TextColor3 = Theme.Text
BtnCont.Font = Enum.Font.GothamBold
BtnCont.Parent = WelcomeFrame
Instance.new("UICorner", BtnCont).CornerRadius = UDim.new(0, 8)

local BtnYT = Instance.new("TextButton")
BtnYT.Size = UDim2.new(0, 130, 0, 40)
BtnYT.Position = UDim2.new(0.55, 0, 0.75, 0)
BtnYT.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
BtnYT.Text = "Seguir YouTube"
BtnYT.TextColor3 = Theme.Text
BtnYT.Font = Enum.Font.GothamBold
BtnYT.Parent = WelcomeFrame
Instance.new("UICorner", BtnYT).CornerRadius = UDim.new(0, 8)

-- [[ 2. MAIN HUB (INVISÍVEL ATÉ CLICAR) ]]
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 520, 0, 340)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
MainFrame.BackgroundColor3 = Theme.Main
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- BARRA LATERAL
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 140, 1, 0)
Sidebar.BackgroundColor3 = Theme.Side
Sidebar.Parent = MainFrame
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

local TabList = Instance.new("UIListLayout", Sidebar)
TabList.Padding = UDim.new(0, 5) ; TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- CONTAINER DE PÁGINAS
local PageContainer = Instance.new("Frame")
PageContainer.Position = UDim2.new(0, 150, 0, 10)
PageContainer.Size = UDim2.new(1, -160, 1, -20)
PageContainer.BackgroundTransparency = 1
PageContainer.Parent = MainFrame

-- [[ SISTEMA DE ABAS ]]
local function NewButton(parent, text, callback)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1, 0, 0, 40)
    B.BackgroundColor3 = Theme.Button
    B.Text = " " .. text
    B.TextColor3 = Theme.Text
    B.Font = Enum.Font.GothamMedium
    B.TextSize = 13
    B.TextXAlignment = Enum.TextXAlignment.Left
    B.Parent = parent
    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 8)
    B.MouseButton1Click:Connect(callback)
end

local function CreatePage(name)
    local P = Instance.new("ScrollingFrame")
    P.Size = UDim2.new(1, 0, 1, 0)
    P.BackgroundTransparency = 1
    P.Visible = false
    P.ScrollBarThickness = 2
    P.Parent = PageContainer
    Instance.new("UIListLayout", P).Padding = UDim.new(0, 8)
    return P
end

local function AddTab(name, icon)
    local T = Instance.new("TextButton")
    T.Size = UDim2.new(0.9, 0, 0, 35)
    T.BackgroundColor3 = Theme.Button
    T.Text = icon .. " " .. name
    T.TextColor3 = Theme.Text
    T.Font = Enum.Font.GothamBold
    T.TextSize = 12
    T.Parent = Sidebar
    Instance.new("UICorner", T).CornerRadius = UDim.new(0, 6)
    
    local Page = CreatePage(name)
    T.MouseButton1Click:Connect(function()
        for _, v in pairs(PageContainer:GetChildren()) do v.Visible = false end
        Page.Visible = true
    end)
    return Page
end

-- [[ CRIANDO AS ABAS ]]
local MainTab = AddTab("Main", "🏠")
local CombatTab = AddTab("Combat", "⚔️")
local FarmTab = AddTab("Auto Farm", "🚜")
local TP_Tab = AddTab("Teleport", "📍")
local VisualsTab = AddTab("Visuals", "👁️")

-- [[ LÓGICAS DAS FUNÇÕES MACETADAS ]]

-- ABA MAIN
NewButton(MainTab, "⚡ Instant Prompt (Sem Espera)", function()
    RunService.Stepped:Connect(function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then v.HoldDuration = 0 end
        end
    end)
end)

NewButton(MainTab, "🍎 Auto Eat (Apple/Carrot/Corn)", function() print("Auto Eat Ativo!") end)

-- ABA COMBAT
NewButton(CombatTab, "🎯 No Recoil (Rifle/Shotgun/Ray Gun)", function()
    RunService.Stepped:Connect(function()
        for _, t in pairs(LocalPlayer.Character:GetChildren()) do
            if t:IsA("Tool") and t:FindFirstChild("Metadata") then
                if t.Metadata:FindFirstChild("Recoil") then t.Metadata.Recoil.Value = 0 end
            end
        end
    end)
end)

-- ABA FARM (AUTO COLLECT)
NewButton(FarmTab, "💎 Auto Collect (Gems/Coins)", function()
    _G.Collect = true
    while _G.Collect do task.wait(0.3)
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Forest Gem" or v.Name == "Cultist Gem" or v.Name == "Mossy Coin" then
                LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end
    end
end)

-- ABA TELEPORT (LOCAIS DA LISTA)
NewButton(TP_Tab, "🌋 Volcano", function() 
    for _,v in pairs(workspace:GetDescendants()) do if v.Name == "Volcano" then LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame break end end
end)
NewButton(TP_Tab, "🛸 Mothership UFO", function() 
    for _,v in pairs(workspace:GetDescendants()) do if v.Name == "Mothership UFO" then LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame break end end
end)

-- ABA VISUALS
NewButton(VisualsTab, "💎 ESP: Itens Raros (Ice Axe/Gems)", function()
    RunService.RenderStepped:Connect(function()
        for _, v in pairs(workspace:GetDescendants()) do
            if (v.Name == "Ice Axe" or v.Name == "Ray Gun" or v.Name == "Ice Chest") and not v:FindFirstChild("Highlight") then
                Instance.new("Highlight", v).FillColor = Theme.Accent
            end
        end
    end)
end)

-- [[ ÍCONE MÓVEL ]]
local MobileIcon = Instance.new("ImageButton")
MobileIcon.Size = UDim2.new(0, 50, 0, 50)
MobileIcon.Position = UDim2.new(0.1, 0, 0.1, 0)
MobileIcon.BackgroundColor3 = Theme.Accent
MobileIcon.Image = "rbxassetid://6031082916"
MobileIcon.Visible = false
MobileIcon.Active = true ; MobileIcon.Draggable = true
MobileIcon.Parent = ScreenGui
Instance.new("UICorner", MobileIcon).CornerRadius = UDim.new(1, 0)

-- EVENTOS DE BOTÃO
BtnYT.MouseButton1Click:Connect(function() setclipboard("https://www.youtube.com/@ByDilanzx") end)
BtnCont.MouseButton1Click:Connect(function() WelcomeFrame:Destroy() MainFrame.Visible = true MobileIcon.Visible = true MainTab.Visible = true end)
MobileIcon.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
