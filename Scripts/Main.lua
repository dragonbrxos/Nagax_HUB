-- NAGAX HUB | MAIN ORCHESTRATOR
local Main = {}
local BaseURL = "https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/"
function Main:Load(Path) return loadstring(game:HttpGet(BaseURL .. Path))() end
_G.Nagax = {
    Combat = Main:Load("Modules/Combat/Combat.lua"),
    Race = Main:Load("Modules/RaceV4/RaceV4.lua"),
    Events = Main:Load("Modules/Events/SeaEvents.lua"),
    Items = Main:Load("Modules/Items/Items.lua"),
    W1 = Main:Load("Modules/Farm/World1.lua"),
    W2 = Main:Load("Modules/Farm/World2.lua"),
    W3 = Main:Load("Modules/Farm/World3.lua"),
    Misc = Main:Load("Modules/Misc/Misc.lua"),
    Fruit = Main:Load("Modules/Fruit/Fruit.lua"),
    Stats = Main:Load("Modules/Stats/Stats.lua"),
    Raid = Main:Load("Modules/Raid/Raid.lua")
}
return _G.Nagax
