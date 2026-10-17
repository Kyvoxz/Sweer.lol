--[[
    ╔══════════════════════════════════════════════════════════╗
    ║           Kyvwer.lol | Remasterized                      ║
    ║           Rivals Advanced Cheat                          ║
    ║           Silent Aim • Ragebot • Spoofer • Unlock All    ║
    ╚══════════════════════════════════════════════════════════╝
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Kyvwer.lol | Remasterized",
    LoadingTitle = "Kyvwer.lol",
    LoadingSubtitle = "Rivals Advanced • by Kyvwer",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Kyvwer",
        FileName = "Config"
    },
    KeySystem = false
})

-- ==================== SERVICES ====================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- ==================== SETTINGS ====================
getgenv().Settings = {
    -- Combat
    SilentAim = false,
    Ragebot = false,
    Aimbot = false,
    AimAssist = false,
    AimAssistStrength = 0.55,
    HitboxExpander = false,
    HitboxSize = 15,
    FOV = 250,
    HitChance = 100,
    Prediction = 0.20,
    AimPart = "Head",
    TeamCheck = true,
    VisibleCheck = false,
    
    -- Movement
    Speed = false,
    SpeedValue = 90,
    InfiniteJump = false,
    Noclip = false,
    Spinbot = false,
    SpinbotSpeed = 30,
    
    -- Visuals
    Fullbright = false,
    
    -- Misc
    UnlockAll = false,
    AntiAFK = true,
}

getgenv().Spoof = {
    Enabled = false,
    Rank = "Radiant",
    Level = 999,
    Streak = 100,
    DisplayName = "",
}

-- ==================== TABS ====================
local CombatTab   = Window:CreateTab("Combat", 4483362458)
local MovementTab = Window:CreateTab("Movement", 4483362458)
local SpooferTab  = Window:CreateTab("Spoofer", 4483362458)
local MiscTab     = Window:CreateTab("Misc", 4483362458)

-- ==================== COMBAT ====================
CombatTab:CreateSection("Aim")

CombatTab:CreateToggle({
    Name = "Silent Aim",
    CurrentValue = false,
    Flag = "SilentAim",
    Callback = function(Value)
        getgenv().Settings.SilentAim = Value
    end
})

CombatTab:CreateToggle({
    Name = "Ragebot",
    CurrentValue = false,
    Flag = "Ragebot",
    Callback = function(Value)
        getgenv().Settings.Ragebot = Value
    end
})

CombatTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Aimbot",
    Callback = function(Value)
        getgenv().Settings.Aimbot = Value
    end
})

CombatTab:CreateToggle({
    Name = "Aim Assist",
    CurrentValue = false,
    Flag = "AimAssist",
    Callback = function(Value)
        getgenv().Settings.AimAssist = Value
    end
})

CombatTab:CreateSlider({
    Name = "Aim Assist Strength",
    Range = {0.1, 1},
    Increment = 0.05,
    CurrentValue = 0.55,
    Flag = "AimAssistStrength",
    Callback = function(Value)
        getgenv().Settings.AimAssistStrength = Value
    end
})

CombatTab:CreateDropdown({
    Name = "Aim Part",
    Options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"},
    CurrentOption = "Head",
    Flag = "AimPart",
    Callback = function(Value)
        getgenv().Settings.AimPart = Value
    end
})

CombatTab:CreateSection("Settings")

CombatTab:CreateSlider({
    Name = "FOV Size",
    Range = {50, 1000},
    Increment = 10,
    CurrentValue = 250,
    Flag = "FOV",
    Callback = function(Value)
        getgenv().Settings.FOV = Value
    end
})

CombatTab:CreateSlider({
    Name = "Prediction",
    Range = {0, 0.5},
    Increment = 0.01,
    CurrentValue = 0.20,
    Flag = "Prediction",
    Callback = function(Value)
        getgenv().Settings.Prediction = Value
    end
})

CombatTab:CreateSlider({
    Name = "Hit Chance",
    Range = {10, 100},
    Increment = 1,
    CurrentValue = 100,
    Flag = "HitChance",
    Callback = function(Value)
        getgenv().Settings.HitChance = Value
    end
})

CombatTab:CreateToggle({
    Name = "Team Check",
    CurrentValue = true,
    Flag = "TeamCheck",
    Callback = function(Value)
        getgenv().Settings.TeamCheck = Value
    end
})

CombatTab:CreateSection("Hitbox")

CombatTab:CreateToggle({
    Name = "Hitbox Expander",
    CurrentValue = false,
    Flag = "HitboxExpander",
    Callback = function(Value)
        getgenv().Settings.HitboxExpander = Value
    end
})

CombatTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {3, 40},
    Increment = 1,
    CurrentValue = 15,
    Flag = "HitboxSize",
    Callback = function(Value)
        getgenv().Settings.HitboxSize = Value
    end
})

-- ==================== MOVEMENT ====================
MovementTab:CreateSection("Character")

MovementTab:CreateToggle({
    Name = "Speed",
    CurrentValue = false,
    Flag = "Speed",
    Callback = function(Value)
        getgenv().Settings.Speed = Value
    end
})

MovementTab:CreateSlider({
    Name = "Speed Value",
    Range = {16, 400},
    Increment = 5,
    CurrentValue = 90,
    Flag = "SpeedValue",
    Callback = function(Value)
        getgenv().Settings.SpeedValue = Value
    end
})

MovementTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(Value)
        getgenv().Settings.InfiniteJump = Value
    end
})

MovementTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(Value)
        getgenv().Settings.Noclip = Value
    end
})

MovementTab:CreateSection("Other")

MovementTab:CreateToggle({
    Name = "Spinbot",
    CurrentValue = false,
    Flag = "Spinbot",
    Callback = function(Value)
        getgenv().Settings.Spinbot = Value
    end
})

MovementTab:CreateSlider({
    Name = "Spinbot Speed",
    Range = {10, 60},
    Increment = 1,
    CurrentValue = 30,
    Flag = "SpinbotSpeed",
    Callback = function(Value)
        getgenv().Settings.SpinbotSpeed = Value
    end
})

MovementTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "Fullbright",
    Callback = function(Value)
        getgenv().Settings.Fullbright = Value
    end
})

-- ==================== SPOOFER ====================
SpooferTab:CreateSection("Spoofer")

SpooferTab:CreateToggle({
    Name = "Activar Spoofer",
    CurrentValue = false,
    Flag = "SpoofEnabled",
    Callback = function(Value)
        getgenv().Spoof.Enabled = Value
    end
})

SpooferTab:CreateInput({
    Name = "Rango",
    PlaceholderText = "Radiant",
    CurrentValue = "Radiant",
    Flag = "SpoofRank",
    Callback = function(Value)
        getgenv().Spoof.Rank = Value
    end
})

SpooferTab:CreateInput({
    Name = "Nivel",
    PlaceholderText = "999",
    CurrentValue = "999",
    Flag = "SpoofLevel",
    Callback = function(Value)
        getgenv().Spoof.Level = tonumber(Value) or 999
    end
})

SpooferTab:CreateInput({
    Name = "Racha (Streak)",
    PlaceholderText = "100",
    CurrentValue = "100",
    Flag = "SpoofStreak",
    Callback = function(Value)
        getgenv().Spoof.Streak = tonumber(Value) or 0
    end
})

SpooferTab:CreateInput({
    Name = "Nombre a mostrar",
    PlaceholderText = "Tu nombre spoof",
    CurrentValue = "",
    Flag = "SpoofName",
    Callback = function(Value)
        getgenv().Spoof.DisplayName = Value
    end
})

SpooferTab:CreateParagraph({
    Title = "Info Spoofer",
    Content = "El spoof de Rango, Nivel y Racha es visual (solo en tu pantalla). El nombre sí se puede ver por otros en algunos casos."
})

-- ==================== MISC ====================
MiscTab:CreateSection("Unlock")

MiscTab:CreateToggle({
    Name = "Unlock All",
    CurrentValue = false,
    Flag = "UnlockAll",
    Callback = function(Value)
        getgenv().Settings.UnlockAll = Value
        if Value then
            pcall(function()
                for _, tbl in pairs(getgc(true)) do
                    if typeof(tbl) == "table" then
                        if rawget(tbl, "Unlocked") then rawset(tbl, "Unlocked", true) end
                        if rawget(tbl, "Owned") then rawset(tbl, "Owned", true) end
                        if rawget(tbl, "IsOwned") then rawset(tbl, "IsOwned", true) end
                        if rawget(tbl, "HasItem") then rawset(tbl, "HasItem", true) end
                        if rawget(tbl, "UnlockedSkins") and typeof(tbl.UnlockedSkins) == "table" then
                            for k in pairs(tbl.UnlockedSkins) do
                                tbl.UnlockedSkins[k] = true
                            end
                        end
                    end
                end
            end)
            Rayfield:Notify({
                Title = "Unlock All",
                Content = "Intentando desbloquear todo...",
                Duration = 4
            })
        end
    end
})

MiscTab:CreateSection("Utility")

MiscTab:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = true,
    Flag = "AntiAFK",
    Callback = function(Value)
        getgenv().Settings.AntiAFK = Value
    end
})

MiscTab:CreateButton({
    Name = "PANIC (Apagar todo)",
    Callback = function()
        for key, value in pairs(getgenv().Settings) do
            if type(value) == "boolean" then
                getgenv().Settings[key] = false
            end
        end
        getgenv().Spoof.Enabled = false
        Rayfield:Notify({
            Title = "PANIC",
            Content = "Todas las funciones desactivadas",
            Duration = 4
        })
    end
})

MiscTab:CreateButton({
    Name = "Server Hopper",
    Callback = function()
        pcall(function()
            local response = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            for _, server in ipairs(response.data) do
                if server.playing < server.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                    break
                end
            end
        end)
    end
})

-- ==================== FUNCTIONS ====================

local function GetClosestPlayer()
    local closest = nil
    local shortest = getgenv().Settings.FOV

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            if getgenv().Settings.TeamCheck and player.Team == LocalPlayer.Team then
                continue
            end

            local part = player.Character:FindFirstChild(getgenv().Settings.AimPart) or player.Character:FindFirstChild("Head")
            if part then
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local distance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if distance < shortest and math.random(1, 100) <= getgenv().Settings.HitChance then
                        shortest = distance
                        closest = player
                    end
                end
            end
        end
    end

    return closest
end

-- Silent Aim + Ragebot Hook
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if (getgenv().Settings.SilentAim or getgenv().Settings.Ragebot) then
        if method == "Raycast" or method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRayWithWhitelist" then
            local target = GetClosestPlayer()
            if target and target.Character then
                local part = target.Character:FindFirstChild(getgenv().Settings.AimPart) or target.Character:FindFirstChild("Head")
                if part then
                    local origin = args[1]
                    local predicted = part.Position + (part.AssemblyLinearVelocity * getgenv().Settings.Prediction)

                    if typeof(origin) == "Vector3" then
                        args[2] = (predicted - origin).Unit * 2000
                    end
                end
            end
        end
    end

    return oldNamecall(self, unpack(args))
end))

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if getgenv().Settings.InfiniteJump and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Main Loop
RunService.Heartbeat:Connect(function()
    local character = LocalPlayer.Character
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    -- Speed
    if getgenv().Settings.Speed and humanoid then
        humanoid.WalkSpeed = getgenv().Settings.SpeedValue
    end

    -- Noclip
    if getgenv().Settings.Noclip then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end

    -- Spinbot
    if getgenv().Settings.Spinbot and rootPart then
        rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(getgenv().Settings.SpinbotSpeed), 0)
    end

    -- Hitbox Expander
    if getgenv().Settings.HitboxExpander then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character.HumanoidRootPart
                hrp.Size = Vector3.new(getgenv().Settings.HitboxSize, getgenv().Settings.HitboxSize, getgenv().Settings.HitboxSize)
                hrp.Transparency = 0.5
                hrp.CanCollide = false
            end
        end
    end

    -- Aimbot / Aim Assist
    if getgenv().Settings.Aimbot or getgenv().Settings.AimAssist then
        local target = GetClosestPlayer()
        if target and target.Character then
            local part = target.Character:FindFirstChild(getgenv().Settings.AimPart) or target.Character:FindFirstChild("Head")
            if part then
                local predicted = part.Position + (part.AssemblyLinearVelocity * getgenv().Settings.Prediction)
                if getgenv().Settings.Aimbot then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, predicted)
                else
                    Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, predicted), getgenv().Settings.AimAssistStrength)
                end
            end
        end
    end

    -- Fullbright
    if getgenv().Settings.Fullbright then
        Lighting.Brightness = 2.3
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
    end
end)

-- Spoofer Loop
task.spawn(function()
    while task.wait(0.5) do
        if getgenv().Spoof.Enabled then
            pcall(function()
                -- Nombre
                if getgenv().Spoof.DisplayName ~= "" then
                    LocalPlayer.DisplayName = getgenv().Spoof.DisplayName
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.DisplayName = getgenv().Spoof.DisplayName
                    end
                end

                -- Rank / Level / Streak (visual)
                for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                    if gui:IsA("TextLabel") or gui:IsA("TextButton") then
                        local text = string.lower(tostring(gui.Text))
                        if string.find(text, "rank") or string.find(text, "rango") or string.find(text, "division") then
                            gui.Text = tostring(getgenv().Spoof.Rank)
                        elseif string.find(text, "level") or string.find(text, "nivel") or string.find(text, "lvl") then
                            gui.Text = "Level " .. tostring(getgenv().Spoof.Level)
                        elseif string.find(text, "streak") or string.find(text, "racha") then
                            gui.Text = "Streak: " .. tostring(getgenv().Spoof.Streak)
                        end
                    end
                end
            end)
        end
    end
end)

-- Anti AFK
task.spawn(function()
    while task.wait(15) do
        if getgenv().Settings.AntiAFK then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end
end)

-- ==================== NOTIFY ====================
Rayfield:Notify({
    Title = "Kyvwer.lol",
    Content = "Remasterized cargado correctamente",
    Duration = 5
})

print("[Kyvwer.lol] Remasterized loaded successfully")
