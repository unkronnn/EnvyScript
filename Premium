local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

repeat task.wait() until LocalPlayer and LocalPlayer.Character
if not game:IsLoaded() then game.Loaded:Wait() end

local loaders = {
    [6911148748] = 'https://api.luarmor.net/files/v4/loaders/07a30652ebbe87970997fa6c7eef8c09.lua', -- CDID
    [110369730911937] = 'https://api.luarmor.net/files/v4/loaders/07a30652ebbe87970997fa6c7eef8c09.lua', -- CDID Jawa Timur
    [9233343468] = 'https://api.luarmor.net/files/v4/loaders/07a30652ebbe87970997fa6c7eef8c09.lua', -- CDID Jawa Barat
[131378148336503] = 'https://api.luarmor.net/files/v4/loaders/f390c2859a25f13a0f0665c549915a6d.lua'
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
