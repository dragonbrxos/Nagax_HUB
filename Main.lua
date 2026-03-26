-- Nagax HUB: Organized Loader
-- This script loads the full modularized Nagax HUB from GitHub.

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

-- Load the Core Logic (Full original script organized)
-- We use Core.lua which contains the full 600KB+ script to ensure 100% functionality
print("Nagax HUB: Initializing full core...")
LoadFromGitHub("Modules/Core.lua")

print("Nagax HUB: Loaded Successfully!")
