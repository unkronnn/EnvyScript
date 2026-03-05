--// Setup
local cr = cloneref or function(v) return v end

local Game = cr(game)
local Pls = cr(Game:GetService("Players"))
local UI = cr(Game:GetService("StarterGui"))
local LP = Pls.LocalPlayer

--// Init
if not Game:IsLoaded() then Game.Loaded:Wait() end
local Char = LP.Character or LP.CharacterAdded:Wait()

--// Config
local Config = {
    Default = "https://api.luarmor.net/files/v4/loaders/07a30652ebbe87970997fa6c7eef8c09.lua",
    Map = {
        [6911148748]        = "https://api.luarmor.net/files/v4/loaders/07a30652ebbe87970997fa6c7eef8c09.lua",
        [110369730911937]   = "https://api.luarmor.net/files/v4/loaders/07a30652ebbe87970997fa6c7eef8c09.lua",
        [9233343468]        = "https://api.luarmor.net/files/v4/loaders/07a30652ebbe87970997fa6c7eef8c09.lua",
        [131378148336503]   = "https://api.luarmor.net/files/v4/loaders/f390c2859a25f13a0f0665c549915a6d.lua"
    }
}

--// Utils
local function Notify(ttl, txt)
    pcall(function()
        UI:SetCore("SendNotification", {
            Title = ttl,
            Text = txt,
            Duration = 8
        })
    end)
end

--// Main
local function Loader()
    local url = Config.Map[Game.PlaceId] or Config.Default
    
    Notify("Envy", "Executing")

    local ok, res = pcall(function()
        local src = Game:HttpGet(url)
        local fn = loadstring(src)
        
        if not fn then return error("Load fail") end
        
        task.spawn(fn)
        return true
    end)

    if ok then
        Notify("Envy", "Hello, " .. LP.DisplayName)
    else
        warn("Error: " .. tostring(res))
        Notify("Envy (error)", "Check F9 Console")
    end
end

Loader()
