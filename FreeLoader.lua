local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

repeat task.wait() until LocalPlayer and LocalPlayer.Character
if not game:IsLoaded() then game.Loaded:Wait() end

local loaders = {
    [6911148748] = 'https://api.luarmor.net/files/v4/loaders/4dcd7d36f19fd9c3a5c35fc8948c7f89.lua', -- CDID
    [110369730911937] = 'https://api.luarmor.net/files/v4/loaders/4dcd7d36f19fd9c3a5c35fc8948c7f89.lua', -- CDID Jawa Timur
    [9233343468] = 'https://api.luarmor.net/files/v4/loaders/4dcd7d36f19fd9c3a5c35fc8948c7f89.lua' -- CDID Jawa Barat
    -- [PlaceId] =  'loader url', -- Place
}

local placeId = game.PlaceId
local url = loaders[placeId]

if url then
    local success, err = pcall(function()
        local src = game:HttpGet(url)
        local fn = loadstring(src)
        if fn then fn() end
    end)

    if not success then LocalPlayer:Kick("Load failed: " .. tostring(err)) end
else
    LocalPlayer:Kick("Script not support")
end
