-- Nagax HUB: Organized Loader
repeat wait() until game.Players.LocalPlayer

-- Configuration
getgenv().NagaxConfig = {
    SafeFarm = true,
    SetFFlag = true
}

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

print("Nagax HUB: Loading full integrated core...")
LoadFromGitHub("Modules/Core.lua")
print("Nagax HUB: Loaded Successfully!")
