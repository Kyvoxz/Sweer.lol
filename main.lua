--[[
    Kyvwer.lol Remasterized
    Rivals Advanced + Spoofer
    Silent Aim + Ragebot + Unlock All + Spoofer fuertes
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/yenkgg/Sleepy-Hub-UI/refs/heads/main/Library.lua"))()

local Window = Library:window({
    name = "Kyvwer",
    suffix = "lol",
    gameInfo = "Remasterized | Rivals"
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
local Combat = Window:tab("Combat")
local Movement = Window:tab("Movement")
local Spoofer = Window:tab("Spoofer")
local Misc = Window:tab("Misc")

-- Combat
Combat:toggle({name = "Silent Aim", callback = function(v) getgenv().Settings.SilentAim = v end})
Combat:toggle({name = "Ragebot", callback = function(v) getgenv().Settings.Ragebot = v end})
Combat:toggle({name = "Aimbot", callback = function(v) getgenv().Settings.Aimbot = v end})
Combat:toggle({name = "Aim Assist", callback = function(v) getgenv().Settings.AimAssist = v end})
Combat:slider({name = "Aim Assist Strength", min = 0.1, max = 1, default = 0.6, callback = function(v) getgenv().Settings.AimAssistStrength = v end})
Combat:toggle({name = "Hitbox Expander", callback = function(v) getgenv().Settings.HitboxExpander = v end})
Combat:slider({name = "Hitbox Size", min = 5, max = 40, default = 16, callback = function(v) getgenv().Settings.HitboxSize = v end})
Combat:toggle({name = "Spinbot", callback = function(v) getgenv().Settings.Spinbot = v end})
Combat:slider({name = "Spinbot Speed", min = 10, max = 60, default = 32, callback = function(v) getgenv().Settings.SpinbotSpeed = v end})
Combat:slider({name = "FOV", min = 50, max = 1200, default = 260, callback = function(v) getgenv().Settings.FOV = v end})
Combat:slider({name = "Prediction", min = 0, max = 0.5, default = 0.21, callback = function(v) getgenv().Settings.Prediction = v end})
Combat:dropdown({name = "Aim Part", options = {"Head", "HumanoidRootPart", "UpperTorso"}, default = "Head", callback = function(v) getgenv().Settings.AimPart = v end})

-- Movement
Movement:toggle({name = "Speed", callback = function(v) getgenv().Settings.Speed = v end})
Movement:slider({name = "Speed Value", min = 16, max = 400, default = 100, callback = function(v) getgenv().Settings.SpeedValue = v end})
Movement:toggle({name = "Infinite Jump", callback = function(v) getgenv().Settings.InfiniteJump = v end})
Movement:toggle({name = "Noclip", callback = function(v) getgenv().Settings.Noclip = v end})
Movement:toggle({name = "Fullbright", callback = function(v) getgenv().Settings.Fullbright = v end})

-- Spoofer
Spoofer:toggle({name = "Activar Spoofer", callback = function(v) getgenv().Spoof.Enabled = v end})
Spoofer:textbox({name = "Rango", default = "Radiant", callback = function(v) getgenv().Spoof.Rank = v end})
Spoofer:textbox({name = "Nivel", default = "999", callback = function(v) getgenv().Spoof.Level = tonumber(v) or 999 end})
Spoofer:textbox({name = "Racha", default = "100", callback = function(v) getgenv().Spoof.Streak = tonumber(v) or 0 end})
Spoofer:textbox({name = "Nombre Spoof", callback = function(v) getgenv().Spoof.DisplayName = v end})

-- Misc
Misc:toggle({name = "Unlock All", callback = function(v)
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
        Library:notify("Unlock All", "Intentando desbloquear todo...")
    end
end})

Misc:toggle({name = "Anti AFK", default = true, callback = function(v) getgenv().Settings.AntiAFK = v end})

Misc:button({
    name = "PANIC",
    callback = function()
        for k,v in pairs(getgenv().Settings) do
            if type(v) == "boolean" then getgenv().Settings[k] = false end
        end
        getgenv().Spoof.Enabled = false
        Library:notify("PANIC", "Todo desactivado")
    end
})

Misc:button({
    name = "Server Hopper",
    callback = function()
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
                    if dist < shortest and math.random(1,100) <= getgenv().Settings.HitChance then
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
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
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
            if part:IsA("BasePart") then part.CanCollide = false end
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

Library:notify("Kyvwer.lol", "Remasterized cargado")
print("Kyvwer.lol Remasterized cargado correctamente")
