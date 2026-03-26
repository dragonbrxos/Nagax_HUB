-- Nagax HUB: Organized Loader
-- This script loads the modularized Nagax HUB from GitHub.

repeat wait() until game.Players.LocalPlayer

-- Configuration
getgenv().NagaxConfig = {
    SafeFarm = true,
    SetFFlag = true
}

-- Loader Function
local function LoadFromGitHub(path)
    local baseUrl = "https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/"
    local success, content = pcall(function()
        return game:HttpGet(baseUrl .. path)
    end)
    if success and content then
        local func, err = loadstring(content)
        if func then
            return func()
        else
            warn("Nagax HUB Error loading " .. path .. ": " .. tostring(err))
        end
    else
        warn("Nagax HUB Failed to fetch " .. path)
    end
end

print("Nagax HUB: Loading core modules...")

-- Load Bypass and Utility functions first
LoadFromGitHub("Modules/Bypass.lua")
LoadFromGitHub("Modules/Utils.lua")

-- Load the refactored core logic (remaining code after extraction)
LoadFromGitHub("Modules/Core_Refactored.lua")

-- Load specific feature modules
LoadFromGitHub("Modules/Quests.lua")
LoadFromGitHub("Modules/ESP.lua")

-- Add other module loaders as they are created

print("Nagax HUB: Loaded Successfully!")
