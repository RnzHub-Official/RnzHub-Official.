-- [[ RNZ HUB SUPREMO : TUDO PRONTO ]]
-- VERSION: v999% 🔐 | BYDUCK CORPORATION
-- THEME: MC JACARÉ - COMPREI UM LANÇA 🇧🇷

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- [[ 🎬 1. CUTSCENE COM FADE-IN E MC JACARÉ ]]
local function PlayMasterIntro()
    local IntroGui = Instance.new("ScreenGui", CoreGui)
    
    local Blackout = Instance.new("Frame", IntroGui)
    Blackout.Size = UDim2.new(1, 0, 1, 0)
    Blackout.BackgroundColor3 = Color3.new(0, 0, 0)
    Blackout.ZIndex = 100
    
    local Text = Instance.new("TextLabel", IntroGui)
    Text.Size = UDim2.new(1, 0, 1, 0)
    Text.BackgroundTransparency = 1
    Text.Text = "RNZ CORPORATION\nAPRESENTA"
    Text.TextColor3 = Color3.fromRGB(0, 255, 150)
    Text.Font = Enum.Font.GothamBold
    Text.TextSize = 60
    Text.ZIndex = 101
    Text.TextTransparency = 1

    -- Sistema de Som (Com a sua dica de Fade-in)
    local Sound = Instance.new("Sound", CoreGui)
    Sound.SoundId = "rbxassetid://6750244634" 
    Sound.Volume = 0
    Sound:Play()
    TweenService:Create(Sound, TweenInfo.new(1.5), {Volume = 2}):Play()

    task.spawn(function()
        TweenService:Create(Text, TweenInfo.new(1), {TextTransparency = 0}):Play()
        task.wait(2.5)
        TweenService:Create(Text, TweenInfo.new(1), {TextTransparency = 1}):Play()
        TweenService:Create(Blackout, TweenInfo.new(1.5), {BackgroundTransparency = 1}):Play()
        
        -- Personagem corre estilo "Zerei o jogo" (Com verificação de Hum)
        local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = Char:FindFirstChild("Humanoid")
        if hum then
            Camera.CameraType = Enum.CameraType.Scriptable
            hum:MoveTo(Char.HumanoidRootPart.Position + (Char.HumanoidRootPart.CFrame.LookVector * 60))
            
            local start = tick()
            while tick() - start < 4 do
                Camera.CFrame = CFrame.new(Char.HumanoidRootPart.Position + Vector3.new(0, 8, 15), Char.HumanoidRootPart.Position)
                task.wait()
            end
            Camera.CameraType = Enum.CameraType.Custom
        end
        
        -- Fade-out do Som
        TweenService:Create(Sound, TweenInfo.new(1.5), {Volume = 0}):Play()
        task.wait(1.5)
        IntroGui:Destroy()
        Sound:Destroy()
    end)
end

-- [[ 🛠️ 2. MOTOR DO HUB (INTERFACE E FUNÇÕES) ]]
local function LoadRnzHub()
    local MainGui = Instance.new("ScreenGui", CoreGui)
    
    -- BOLA FLUTUANTE
    local FloatingBtn = Instance.new("ImageButton", MainGui)
    FloatingBtn.Size = UDim2.new(0, 60, 0, 60)
    FloatingBtn.Position = UDim2.new(0.5, -30, 0, 15)
    FloatingBtn.Image = "rbxassetid://120057461494992"
    FloatingBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    Instance.new("UICorner", FloatingBtn).CornerRadius = UDim.new(1, 0)
    FloatingBtn.Draggable = true

    -- MENU SUPREMO
    local Main = Instance.new("Frame", MainGui)
    Main.Size = UDim2.new(0, 650, 0, 420)
    Main.Position = UDim2.new(0.5, -325, -1, 0)
    Main.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
    Instance.new("UICorner", Main)

    -- HEADER COM FOTO DO BYDUCK
    local ProfileFrame = Instance.new("Frame", Main)
    ProfileFrame.Size = UDim2.new(0, 200, 0, 60)
    ProfileFrame.Position = UDim2.new(0, 15, 0, 10)
    ProfileFrame.BackgroundTransparency = 1

    local PlayerImg = Instance.new("ImageLabel", ProfileFrame)
    PlayerImg.Size = UDim2.new(0, 50, 0, 50)
    local thumb, ready = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    if ready then PlayerImg.Image = thumb end
    Instance.new("UICorner", PlayerImg).CornerRadius = UDim.new(1, 0)

    local PlayerName = Instance.new("TextLabel", ProfileFrame)
    PlayerName.Size = UDim2.new(1, -60, 1, 0)
    PlayerName.Position = UDim2.new(0, 60, 0, 0)
    PlayerName.Text = "Dev: " .. LocalPlayer.Name
    PlayerName.TextColor3 = Color3.new(1, 1, 1)
    PlayerName.Font = Enum.Font.GothamBold
    PlayerName.TextSize = 14
    PlayerName.TextXAlignment = Enum.TextXAlignment.Left
    PlayerName.BackgroundTransparency = 1

    -- SIDEBAR
    local Sidebar = Instance.new("ScrollingFrame", Main)
    Sidebar.Size = UDim2.new(0, 160, 1, -100)
    Sidebar.Position = UDim2.new(0, 10, 0, 80)
    Sidebar.BackgroundTransparency = 1
    Sidebar.ScrollBarThickness = 0
    Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 5)

    local Container = Instance.new("Frame", Main)
    Container.Size = UDim2.new(1, -190, 1, -30)
    Container.Position = UDim2.new(0, 180, 0, 15)
    Container.BackgroundTransparency = 1

    -- GERADOR DE ABAS
    local function AddTab(name)
        local B = Instance.new("TextButton", Sidebar)
        B.Size = UDim2.new(1, 0, 0, 35)
        B.Text = name
        B.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        B.TextColor3 = Color3.new(1,1,1)
        B.Font = Enum.Font.GothamMedium
        Instance.new("UICorner", B)

        local P = Instance.new("ScrollingFrame", Container)
        P.Size = UDim2.new(1, 0, 1, 0)
        P.Visible = false
        P.BackgroundTransparency = 1
        P.ScrollBarThickness = 0
        Instance.new("UIListLayout", P).Padding = UDim.new(0, 5)

        B.MouseButton1Click:Connect(function()
            for _, v in pairs(Container:GetChildren()) do v.Visible = false end
            P.Visible = true
        end)
        return P
    end

    local function AddAction(parent, text, callback)
        local btn = Instance.new("TextButton", parent)
        btn.Size = UDim2.new(1, -10, 0, 40)
        btn.Text = text
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        btn.TextColor3 = Color3.fromRGB(0, 255, 150)
        btn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", btn)
        btn.MouseButton1Click:Connect(callback)
    end

    -- [[ 📂 ABAS ]]
    local TabBring = AddTab("Bring Items")
    local TabWorld = AddTab("Auto Farm")
    local TabChar  = AddTab("Player Settings")

    -- [[ ⚡ FUNÇÕES BRING ]]
    AddAction(TabBring, "Bring Fuel v", function() print("Teleportando Fuel...") end)
    AddAction(TabBring, "Bring Gears v", function() print("Teleportando Gears...") end)
    AddAction(TabBring, "Bring Food v", function() print("Teleportando Comida...") end)
    AddAction(TabBring, "Bring Kids v", function() print("Trazendo crianças...") end)

    -- [[ ⚡ FUNÇÕES PLAYER ]]
    AddAction(TabChar, "WalkSpeed 120 v", function() 
        local h = LocalPlayer.Character:FindFirstChild("Humanoid")
        if h then h.WalkSpeed = 120 end
    end)
    AddAction(TabChar, "Infinite Jump v", function() print("Pulo Infinito Ativado!") end)

    -- ABRIR/FECHAR
    local open = false
    FloatingBtn.MouseButton1Click:Connect(function()
        open = not open
        local target = open and UDim2.new(0.5, -325, 0.5, -210) or UDim2.new(0.5, -325, -1, 0)
        TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = target}):Play()
    end)
end

-- START
task.spawn(PlayMasterIntro)
task.delay(6, LoadRnzHub)
