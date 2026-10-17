--[[
    Kyvwer.lol Remasterized
    Rivals Advanced + Spoofer
    Silent Aim + Ragebot + Unlock All + Spoofer
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Kyvwer.lol | Remasterized",
    LoadingTitle = "Kyvwer.lol",
    LoadingSubtitle = "Rivals Advanced",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Kyvwer",
        FileName = "Config"
    },
    KeySystem = false
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Settings
getgenv().Settings = {
    SilentAim = false,
    Aimbot = false,
    Ragebot = false,
    AimAssist = false,
    AimAssistStrength = 0.6,
    HitboxExpander = false,
    HitboxSize = 16,
    FOV = 260,
    HitChance = 100,
    Prediction = 0.21,
    AimPart = "Head",
    TeamCheck = true,
    Spinbot = false,
    SpinbotSpeed = 32,
    Speed = false,
    SpeedValue = 100,
    InfiniteJump = false,
    Noclip = false,
    Fullbright = false,
    UnlockAll = false,
    AntiAFK = true,
}

getgenv().Spoof = {
    Enabled = false,
    Rank = "Radiant",
    Level = 999,
    Streak = 100,
    DisplayName = ""
}

-- ==================== TABS ====================
local CombatTab = Window:CreateTab("Combat", 4483362458)
local MovementTab = Window:CreateTab("Movement", 4483362458)
local SpooferTab = Window:CreateTab("Spoofer", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)

-- ===== COMBAT =====
CombatTab:CreateToggle({
    Name = "Silent Aim",
    CurrentValue = false,
    Flag = "SilentAim",
    Callback = function(v) getgenv().Settings.SilentAim = v end
})

CombatTab:CreateToggle({
    Name = "Ragebot",
    CurrentValue = false,
    Flag = "Ragebot",
    Callback = function(v) getgenv().Settings.Ragebot = v end
})

CombatTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Aimbot",
    Callback = function(v) getgenv().Settings.Aimbot = v end
})

CombatTab:CreateToggle({
    Name = "Aim Assist",
    CurrentValue = false,
    Flag = "AimAssist",
    Callback = function(v) getgenv().Settings.AimAssist = v end
})

CombatTab:CreateSlider({
    Name = "Aim Assist Strength",
    Range = {0.1, 1},
    Increment = 0.05,
    CurrentValue = 0.6,
    Flag = "AimAssistStrength",
    Callback = function(v) getgenv().Settings.AimAssistStrength = v end
})

CombatTab:CreateToggle({
    Name = "Hitbox Expander",
    CurrentValue = false,
    Flag = "HitboxExpander",
    Callback = function(v) getgenv().Settings.HitboxExpander = v end
})

CombatTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {5, 40},
    Increment = 1,
    CurrentValue = 16,
    Flag = "HitboxSize",
    Callback = function(v) getgenv().Settings.HitboxSize = v end
})

CombatTab:CreateToggle({
    Name = "Spinbot",
    CurrentValue = false,
    Flag = "Spinbot",
    Callback = function(v) getgenv().Settings.Spinbot = v end
})

CombatTab:CreateSlider({
    Name = "Spinbot Speed",
    Range = {10, 60},
    Increment = 1,
    CurrentValue = 32,
    Flag = "SpinbotSpeed",
    Callback = function(v) getgenv().Settings.SpinbotSpeed = v end
})

CombatTab:CreateSlider({
    Name = "FOV",
    Range = {50, 1200},
    Increment = 10,
    CurrentValue = 260,
    Flag = "FOV",
    Callback = function(v) getgenv().Settings.FOV = v end
})

CombatTab:CreateSlider({
    Name = "Prediction",
    Range = {0, 0.5},
    Increment = 0.01,
    CurrentValue = 0.21,
    Flag = "Prediction",
    Callback = function(v) getgenv().Settings.Prediction = v end
})

CombatTab:CreateDropdown({
    Name = "Aim Part",
    Options = {"Head", "HumanoidRootPart", "UpperTorso"},
    CurrentOption = "Head",
    Flag = "AimPart",
    Callback = function(v) getgenv().Settings.AimPart = v end
})

-- ===== MOVEMENT =====
MovementTab:CreateToggle({
    Name = "Speed",
    CurrentValue = false,
    Flag = "Speed",
    Callback = function(v) getgenv().Settings.Speed = v end
})

MovementTab:CreateSlider({
    Name = "Speed Value",
    Range = {16, 400},
    Increment = 5,
    CurrentValue = 100,
    Flag = "SpeedValue",
    Callback = function(v) getgenv().Settings.SpeedValue = v end
})

MovementTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(v) getgenv().Settings.InfiniteJump = v end
})

MovementTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(v) getgenv().Settings.Noclip = v end
})

MovementTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "Fullbright",
    Callback = function(v) getgenv().Settings.Fullbright = v end
})

-- ===== SPOOFER =====
SpooferTab:CreateToggle({
    Name = "Activar Spoofer",
    CurrentValue = false,
    Flag = "SpoofEnabled",
    Callback = function(v) getgenv().Spoof.Enabled = v end
})

SpooferTab:CreateInput({
    Name = "Rango",
    PlaceholderText = "Radiant",
    CurrentValue = "Radiant",
    Flag = "SpoofRank",
    Callback = function(v) getgenv().Spoof.Rank = v end
})

SpooferTab:CreateInput({
    Name = "Nivel",
    PlaceholderText = "999",
    CurrentValue = "999",
    Flag = "SpoofLevel",
    Callback = function(v) getgenv().Spoof.Level = tonumber(v) or 999 end
})

SpooferTab:CreateInput({
    Name = "Racha",
    PlaceholderText = "100",
    CurrentValue = "100",
    Flag = "SpoofStreak",
    Callback = function(v) getgenv().Spoof.Streak = tonumber(v) or 0 end
})

SpooferTab:CreateInput({
    Name = "Nombre Spoof",
    PlaceholderText = "Tu nombre",
    CurrentValue = "",
    Flag = "SpoofName",
    Callback = function(v) getgenv().Spoof.DisplayName = v end
})

-- ===== MISC =====
MiscTab:CreateToggle({
    Name = "Unlock All",
    CurrentValue = false,
    Flag = "UnlockAll",
    Callback = function(v)
        getgenv().Settings.UnlockAll = v
        if v then
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
            Rayfield:Notify({Title = "Unlock All", Content = "Intentando desbloquear todo...", Duration = 3})
        end
    end
})

MiscTab:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = true,
    Flag = "AntiAFK",
    Callback = function(v) getgenv().Settings.AntiAFK = v end
})

MiscTab:CreateButton({
    Name = "PANIC (Apagar todo)",
    Callback = function()
        for k, v in pairs(getgenv().Settings) do
            if type(v) == "boolean" then
                getgenv().Settings[k] = false
            end
        end
        getgenv().Spoof.Enabled = false
        Rayfield:Notify({Title = "PANIC", Content = "Todo desactivado", Duration = 4})
    end
})

MiscTab:CreateButton({
    Name = "Server Hopper",
    Callback = function()
        pcall(function()
            local data = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
            for _, server in ipairs(data.data) do
                if server.playing < server.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                    break
                end
            end
        end)
    end
})

-- ==================== FUNCIONES ====================

local function GetClosestPlayer()
    local closest, shortest = nil, getgenv().Settings.FOV
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            if getgenv().Settings.TeamCheck and player.Team == LocalPlayer.Team then continue end
            local part = player.Character:FindFirstChild(getgenv().Settings.AimPart) or player.Character:FindFirstChild("Head")
            if part then
                local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if dist < shortest and math.random(1, 100) <= getgenv().Settings.HitChance then
                        shortest = dist
                        closest = player
                    end
                end
            end
        end
    end
    return closest
end

-- Silent Aim + Ragebot
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if (getgenv().Settings.SilentAim or getgenv().Settings.Ragebot) and (method == "Raycast" or method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRayWithWhitelist") then
        local target = GetClosestPlayer()
        if target and target.Character then
            local part = target.Character:FindFirstChild(getgenv().Settings.AimPart) or target.Character:FindFirstChild("Head")
            if part then
                local origin = args[1]
                local predictedPos = part.Position + (part.AssemblyLinearVelocity * getgenv().Settings.Prediction)
                
                if typeof(origin) == "Vector3" then
                    args[2] = (predictedPos - origin).Unit * 2000
                end
            end
        end
    end

    return oldNamecall(self, unpack(args))
end))

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if getgenv().Settings.InfiniteJump and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Main Loop
RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")

    if getgenv().Settings.Speed and hum then
        hum.WalkSpeed = getgenv().Settings.SpeedValue
    end

    if getgenv().Settings.Noclip then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end

    if getgenv().Settings.Spinbot and hrp then
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(getgenv().Settings.SpinbotSpeed), 0)
    end

    if getgenv().Settings.HitboxExpander then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local t = player.Character.HumanoidRootPart
                t.Size = Vector3.new(getgenv().Settings.HitboxSize, getgenv().Settings.HitboxSize, getgenv().Settings.HitboxSize)
                t.Transparency = 0.5
                t.CanCollide = false
            end
        end
    end

    if getgenv().Settings.Aimbot or getgenv().Settings.AimAssist then
        local target = GetClosestPlayer()
        if target and target.Character then
            local part = target.Character:FindFirstChild(getgenv().Settings.AimPart) or target.Character.Head
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

    if getgenv().Settings.Fullbright then
        Lighting.Brightness = 2.4
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
    end
end)

-- Spoofer
task.spawn(function()
    while task.wait(0.6) do
        if getgenv().Spoof.Enabled then
            pcall(function()
                if getgenv().Spoof.DisplayName ~= "" then
                    LocalPlayer.DisplayName = getgenv().Spoof.DisplayName
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.DisplayName = getgenv().Spoof.DisplayName
                    end
                end

                for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                    if gui:IsA("TextLabel") or gui:IsA("TextButton") then
                        local text = string.lower(tostring(gui.Text))
                        if string.find(text, "rank") or string.find(text, "rango") or string.find(text, "division") then
                            gui.Text = tostring(getgenv().Spoof.Rank)
                        elseif string.find(text, "level") or string.find(text, "nivel") or string.find(text, "lvl") then
                            gui.Text = "Level " .. tostring(getgenv().Spoof.Level)
                        elseif string.find(text, "streak") or string.find(text, "racha") or string.find(text, "win streak") then
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
    local VirtualUser = game:GetService("VirtualUser")
    while task.wait(16) do
        if getgenv().Settings.AntiAFK then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end
end)

Rayfield:Notify({
    Title = "Kyvwer.lol",
    Content = "Remasterized cargado correctamente",
    Duration = 5
})

print("Kyvwer.lol Remasterized cargado")
