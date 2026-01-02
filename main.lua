-- [[ RNZ HUB OFFICIAL : ULTIMATE CINEMATIC EDITION ]]
-- VERSION: v1.0.2 🔐 | BYDUCK CORPORATION
-- ID: 120057461494992

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- [[ 🎬 1. CUTSCENE: PERSONAGEM ZERANDO O JOGO ]]
local function PlayMasterCutscene()
    local IntroGui = Instance.new("ScreenGui", CoreGui)
    local Blackout = Instance.new("Frame", IntroGui)
    Blackout.Size = UDim2.new(1, 0, 1, 0)
    Blackout.BackgroundColor3 = Color3.new(0, 0, 0)
    Blackout.ZIndex = 100

    local StatusText = Instance.new("TextLabel", IntroGui)
    StatusText.Size = UDim2.new(1, 0, 1, 0)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = "Rnz Corporation Apresenta..."
    StatusText.TextColor3 = Color3.fromRGB(0, 255, 150)
    StatusText.Font = Enum.Font.GothamBold
    StatusText.TextSize = 40
    StatusText.ZIndex = 101
    StatusText.TextTransparency = 1

    -- Início da Intro
    task.spawn(function()
        TweenService:Create(StatusText, TweenInfo.new(1), {TextTransparency = 0}):Play()
        task.wait(2)
        TweenService:Create(StatusText, TweenInfo.new(1), {TextTransparency = 1}):Play()
        task.wait(0.5)
        StatusText.Text = "ZERANDO O JOGO..."
        TweenService:Create(StatusText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
        task.wait(1.5)
        TweenService:Create(StatusText, TweenInfo.new(1), {TextTransparency = 1}):Play()
        TweenService:Create(Blackout, TweenInfo.new(2), {BackgroundTransparency = 1}):Play()
        task.wait(2)
        IntroGui:Destroy()
    end)
end

-- [[ 🛠️ 2. MOTOR DO HUB PRINCIPAL ]]
local function LoadRnzHub()
    -- BOLA FLUTUANTE (DESIGN GAMER)
    local ToggleUI = Instance.new("ScreenGui", CoreGui)
    local FloatingBtn = Instance.new("ImageButton", ToggleUI)
    FloatingBtn.Size = UDim2.new(0, 55, 0, 55)
    FloatingBtn.Position = UDim2.new(0, 20, 0.5, -27)
    FloatingBtn.Image = "rbxassetid://120057461494992"
    FloatingBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    Instance.new("UICorner", FloatingBtn).CornerRadius = UDim.new(1, 0)

    -- MENU PRINCIPAL
    local MainGui = Instance.new("ScreenGui", CoreGui)
    local Main = Instance.new("Frame", MainGui)
    Main.Size = UDim2.new(0, 650, 0, 420)
    Main.Position = UDim2.new(-1, 0, 0.5, -210) -- Escondido para animação < >
    Main.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
    Main.BackgroundTransparency = 0.1
    Instance.new("UICorner", Main)

    -- SIDEBAR COM ROLAGEM (ORGANIZAÇÃO)
    local Sidebar = Instance.new("ScrollingFrame", Main)
    Sidebar.Size = UDim2.new(0, 170, 1, -20)
    Sidebar.Position = UDim2.new(0, 8, 0, 10)
    Sidebar.BackgroundTransparency = 1
    Sidebar.ScrollBarThickness = 0
    local Layout = Instance.new("UIListLayout", Sidebar)
    Layout.Padding = UDim.new(0, 5)

    -- CONTAINER DE CONTEÚDO
    local Container = Instance.new("Frame", Main)
    Container.Size = UDim2.new(1, -195, 1, -65)
    Container.Position = UDim2.new(0, 185, 0, 55)
    Container.BackgroundTransparency = 1

    -- BARRA DE ANÚNCIOS (INFO)
    local AdLabel = Instance.new("TextLabel", Main)
    AdLabel.Size = UDim2.new(0, 400, 0, 30)
    AdLabel.Position = UDim2.new(0, 185, 0, 15)
    AdLabel.Text = "Bem vindo a nosso hub! 👀 | Premium v1.0.2 🔐"
    AdLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
    AdLabel.Font = Enum.Font.GothamBold
    AdLabel.BackgroundTransparency = 1
    AdLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- FUNÇÃO PARA CRIAR ABAS
    local function AddTab(name)
        local B = Instance.new("TextButton", Sidebar)
        B.Size = UDim2.new(1, 0, 0, 38)
        B.Text = "  " .. name
        B.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        B.TextColor3 = Color3.new(1,1,1)
        B.Font = Enum.Font.GothamMedium
        B.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", B)

        local P = Instance.new("ScrollingFrame", Container)
        P.Size = UDim2.new(1, 0, 1, 0)
        P.Visible = false
        P.BackgroundTransparency = 1
        P.ScrollBarThickness = 2
        Instance.new("UIListLayout", P).Padding = UDim.new(0, 8)

        B.MouseButton1Click:Connect(function()
            for _, v in pairs(Container:GetChildren()) do v.Visible = false end
            P.Visible = true
        end)
        return P
    end

    -- FUNÇÃO PARA TOGGLES (ESTILO VOIDWARE)
    local function AddToggle(parent, text, callback)
        local TFrame = Instance.new("Frame", parent)
        TFrame.Size = UDim2.new(1, -10, 0, 45)
        TFrame.BackgroundTransparency = 0.9
        TFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        Instance.new("UICorner", TFrame)

        local Lbl = Instance.new("TextLabel", TFrame)
        Lbl.Size = UDim2.new(0.7, 0, 1, 0)
        Lbl.Position = UDim2.new(0, 10, 0, 0)
        Lbl.Text = text
        Lbl.TextColor3 = Color3.new(1,1,1)
        Lbl.Font = Enum.Font.Gotham
        Lbl.TextXAlignment = Enum.TextXAlignment.Left
        Lbl.BackgroundTransparency = 1

        local Swit = Instance.new("TextButton", TFrame)
        Swit.Size = UDim2.new(0, 42, 0, 20)
        Swit.Position = UDim2.new(1, -50, 0.5, -10)
        Swit.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        Swit.Text = ""
        Instance.new("UICorner", Swit).CornerRadius = UDim.new(1, 0)

        local Ball = Instance.new("Frame", Swit)
        Ball.Size = UDim2.new(0, 16, 0, 16)
        Ball.Position = UDim2.new(0, 2, 0.5, -8)
        Ball.BackgroundColor3 = Color3.new(1,1,1)
        Instance.new("UICorner", Ball).CornerRadius = UDim.new(1,0)

        local active = false
        Swit.MouseButton1Click:Connect(function()
            active = not active
            local p = active and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            local c = active and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(60, 60, 70)
            TweenService:Create(Ball, TweenInfo.new(0.2), {Position = p}):Play()
            TweenService:Create(Swit, TweenInfo.new(0.2), {BackgroundColor3 = c}):Play()
            callback(active)
        end)
    end

    -- [[ 📂 DEFINIÇÃO DAS 10 ABAS ]]
    local TabInfo      = AddTab("Information")
    local TabMain      = AddTab("Main")
    local TabBring     = AddTab("Bring Stuff")
    local TabTeleport  = AddTab("Teleport")
    local TabAutoFarm  = AddTab("Auto Farm")
    local TabFarmDays  = AddTab("Farm Days")
    local TabStrong    = AddTab("Auto Stronghold")
    local TabPlayer    = AddTab("Player")
    local TabVision    = AddTab("Vision")
    local TabAntiLag   = AddTab("Ant Lag")

    -- [[ 🚀 EXEMPLOS DE FUNÇÕES ]]
    AddToggle(TabMain, "Kill Aura", function(state) print("Kill Aura:", state) end)
    AddToggle(TabMain, "Chop All Trees", function(state) print("Chop:", state) end)
    AddToggle(TabPlayer, "Auto Saplings (inf)", function(state) print("Saplings:", state) end)
    AddToggle(TabTeleport, "Teleport to LostChilds", function(state) print("TP Kids:", state) end)

    -- LÓGICA DE ABRIR/FECHAR MENU (ANIMAÇÃO LATERAL)
    local isOpen = false
    FloatingBtn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        local target = isOpen and UDim2.new(0, 85, 0.5, -210) or UDim2.new(-1, 0, 0.5, -210)
        TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = target}):Play()
    end)
end

-- [[ EXECUÇÃO FINAL ]]
task.spawn(PlayMasterCutscene)
task.delay(6, LoadRnzHub)

print("Rnz Corporation: Ultimate Script Loaded! 🎬")
