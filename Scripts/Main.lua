-- NAGAX HUB | MAIN LOADER
local Main = {}
local BaseURL = "https://raw.githubusercontent.com/dragonbrxos/Nagax_HUB/main/"
function Main:Load(Path) return loadstring(game:HttpGet(BaseURL .. Path))() end
_G.Nagax = {
    Combat = Main:Load("Modules/Combat/Combat.lua"),
    Race = Main:Load("Modules/RaceV4/RaceV4.lua"),
    Events = Main:Load("Modules/Events/SeaEvents.lua"),
    Items = Main:Load("Modules/Items/Items.lua"),
    W1 = Main:Load("Modules/Farm/World1.lua"),
    W2 = Main:Load("Modules/Farm/World2.lua")
}
return _G.Nagax
