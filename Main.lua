-- Nagax_HUB - Main Entry Point
repeat
    wait()
until game.Players.LocalPlayer

-- Load Library
local LibURL = "https://you.whimper.xyz/sources/pihub/lib/bf.lua"
local Lib = loadstring(game:HttpGet(LibURL, true))()
local Window = Lib:Window("Nagax HUB")

-- Global Configuration & State
getgenv().NagaxConfig = {
    SafeFarm = true,
    SetFFlag = true
}

-- Load Modules
local function LoadModule(name)
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/Modules/" .. name .. ".lua"))()
    end)
    if not success then
        warn("Nagax HUB: Failed to load module " .. name .. " - " .. tostring(result))
    end
    return result
end

-- Initialize Anti-Cheat Bypass & Utilities
LoadModule("Bypass")
LoadModule("Utils")

-- Create Tabs
local Tabs = {
    Settings = Window:Tab("Settings Farm", "rbxassetid://18899804355"),
    Main = Window:Tab("Auto Farm", "rbxassetid://18899804355"),
    Item = Window:Tab("Item Quest", "rbxassetid://18899804355"),
    Sea = Window:Tab("Sea Event", "rbxassetid://18899804355"),
    Stats = Window:Tab("Auto Stats", "rbxassetid://18899804355"),
    Teleport = Window:Tab("World Tele", "rbxassetid://18899804355"),
    Player = Window:Tab("Player Pvp", "rbxassetid://18899804355"),
    Race = Window:Tab("Race V4", "rbxassetid://18899804355"),
    Raid = Window:Tab("Dungeon Raid", "rbxassetid://18899804355"),
    Fruit = Window:Tab("Fruit Demon", "rbxassetid://18899804355"),
    Esp = Window:Tab("Esp Player", "rbxassetid://18899804355"),
    Shop = Window:Tab("Shopee", "rbxassetid://18899804355"),
    Misc = Window:Tab("Miscellaneous", "rbxassetid://18899804355")
}

-- Load Tab Contents
-- Note: These would typically be separate files or functions
LoadModule("Tabs/MainFarm")
LoadModule("Tabs/ESP")
-- Add other tab loaders as needed

print("Nagax HUB Loaded Successfully!")
