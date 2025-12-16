function MPX()
	local ONLINE = stats.get_int("MPPLY_LAST_MP_CHAR")
	if ONLINE == 0 then
		return "MP0_"
	elseif ONLINE == 1 then
		return "MP1_"
	else
		return "MP0_"
	end
end

player_male = (ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID()) == joaat("mp_m_freemode_01"))
player_female = (ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID()) == joaat("mp_m_freemode_0"))

-- Validate API globals
if not ENTITY then
    print(" ENTITY API not found — you might be on an unsupported YimMenu version!")
    return
end

FMISSIONC = "fm_mission_controller"
FMISSIONC2020 = "fm_mission_controller_2020"
HISLANDP = "heist_island_planning"

log.info("TCC & RROCAS", "Love you internet people <3")
log.info("Enjoy Elexon :D")


------------------------------------------------------------------------------
--[[ Elexon Main Menu Structure ]]--
------------------------------------------------------------------------------

    ScriptMainMenu = gui.get_tab("Elexon made by TCC & RROCAS")
    ScriptMainMenu:add_text("Elexon 1.72 Beta")


    SelfTab = ScriptMainMenu:add_tab("Self Menu") -- Self Menu Tab

    recoverymenu = ScriptMainMenu:add_tab("Recovery Menu")                                  -- Recovery Menu Tab
        MoneyMenu = recoverymenu:add_tab("Money Methods")                                   -- Recovery Menu -> Money Methods
            NightClub = MoneyMenu:add_tab("Nightclub money loop")                           -- Recovery Menu -> Money Methods -> Nightclub money loop

    StatsMenu = recoverymenu:add_tab("Stats Menu")                                          -- Recovery Menu -> Stats Menu
        RP_settings = StatsMenu:add_tab("Crew / Rank Editor")                               -- Recovery Menu -> Stats Menu -> RP Editor
        KD_Editor_Tab = StatsMenu:add_tab("KD Editor")                                      -- Recovery Menu -> Stats Menu -> KD Editor
        Reports = StatsMenu:add_tab("Report Checker & Editor")                              -- Recovery Menu -> Stats Menu -> Report Checker & Editor
        
    LatestUnlock = recoverymenu:add_tab("Unlocker Menu")                                    -- Recovery Menu -> Unlocker Menu
    MissionEdit = recoverymenu:add_tab("Missions Menu")                                     -- Recovery Menu -> Missions Menu
    

    VehiclesMenu = ScriptMainMenu:add_tab("Vehicle Menu")                                   -- Vehicle Menu


    settings = ScriptMainMenu:add_tab("Script Settings")                                    -- Settings Tab
    


------------------------------------------------------------------------------
--[[ Load Included Modules ]]--
------------------------------------------------------------------------------

require("elexon-incl.kd_editor")(KD_Editor_Tab)                                             -- KD Editor
require("elexon-incl.report_editor")(Reports)                                               -- Report Checker & Editor
require("elexon-incl.rank_editor")(RP_settings)                                             -- Crew / Rank Editor
require("elexon-incl.self_menu")(SelfTab)                                                   -- Self Menu
require("elexon-incl.money_methods")(recoverymenu, NightClub)                               -- Money Methods
require("elexon-incl.vehicle_menu")(VehiclesMenu)                                           -- Vehicle Menu

local packed_unlocks = require("elexon-incl.unlocks")
local unlocks_config = require("elexon-incl.unlocks")                                       -- load the unlocks configuration
local stat_unlocks   = require("elexon-incl.unlocks2")

local removed_vehicles = require("elexon-incl.removed_vehicles")                            -- load the removed vehicles list








------------------------------------------------------------------------------
--[[ Removed Vehicles Auto-Loader(on session start) ]]--
------------------------------------------------------------------------------

local removed_vehicles_triggered = false

script.register_looped("removed_vehicles_auto", function(script)
    script:yield()
    if network.is_session_started() and not removed_vehicles_triggered then
        log.debug("[Load Removed Vehicles][DEBUG] Starting auto-trigger for removed vehicles")
        for _, offset in ipairs(removed_vehicles) do -- iterate through each offset
            print("[Load Removed Vehicles][DEBUG] Setting global: " .. tostring(262145 + offset))
            globals.set_int(262145 + offset, 1) -- set the global to 1
        end
        log.debug("[Load Removed Vehicles][DEBUG] Finished auto-trigger")
        removed_vehicles_triggered = true
    end
end)

------------------------------------------------------------------------------
--[[ Missions Menu (seems unnecessary for the scripts purpose atm) ]]--
------------------------------------------------------------------------------
    

    MissionEdit:add_button("Remove dax fooligan missions", function()
	stats.set_int(MPX() .. "XM22JUGGALOWORKCDTIMER", -1)
end)

MissionEdit:add_button("Remove CEO/MC Cooldown", function()
	stats.set_int("MPPLY_VIPGAMEPLAYDISABLEDTIMER", 0)
end)

MissionEdit:add_button("Skip yacht missionsS", function()
	stats.set_int(MPX() .. "YACHT_MISSION_PROG", 0)
	stats.set_int(MPX() .. "YACHT_MISSION_FLOW", 21845)
	stats.set_int(MPX() .. "CASINO_DECORATION_GIFT_1", -1)
end)

MissionEdit:add_separator()


-- MP Helper
function mp()
    return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
end



------------------------------------------------------------------------------
--[[ Unlocker Menu ]]--
------------------------------------------------------------------------------


function unlock_packed_bools(from, to)
    for i = from, to do
        stats.set_packed_stat_bool(i, true)
        -- log.debug("[DEBUG] Unlocking stat ID:", i) -- prints to YimMenu console. commented out to stop spam and clogging of logs
    end
end

LatestUnlock:add_button("Unlock Everything", function()
    log.debug("[DEBUG] Starting to Unlock Everything")

    -- packed bools
    for _, range in ipairs(unlocks_config.generic) do
        unlock_packed_bools(range.from, range.to)
    end

    local gender_ranges = player_male and unlocks_config.male or unlocks_config.female
    for _, range in ipairs(gender_ranges) do
        unlock_packed_bools(range.from, range.to)
    end

    -- normal stats
    stat_unlocks.apply(MPX)

    log.debug("[DEBUG] Finished Unlock Everything")
end)



function MP_INDEX()
    return stats.get_int("MPPLY_LAST_MP_CHAR")
end





----------------------------------------------------------------------
------[[ Settings Section ]]------------------------------------------
----------------------------------------------------------------------


settings:add_text("No settings available yet.")



----------------------------------------------------------------------
------[[ Credits Section (implemented into settings tab) ]]-----------
----------------------------------------------------------------------

ilovecredits = settings:add_tab("Credits <3")

    TCC = ilovecredits:add_tab("TCC - TheCookieTho")
    TCC:add_text("Elexon Main Developer, Script Writer & Tester")
    TCC:add_text("Reach out to me on Discord @njdergeilomat")

    Rrocas = ilovecredits:add_tab("RROCAS - Rrocas")
    Rrocas:add_text("Elexon Co-Developer, Script Writer & Tester")
    

    SpecialThanks = ilovecredits:add_tab("Special Thanks To:")
    SpecialThanks:add_text("INTRXDUCE - For script base(UTHENSIA)")
    SpecialThanks:add_text("ShinyWasabi - For Claiming Vehicle as PV script")
    SpecialThanks:add_text("Alestarov - For Nightclub money loop & tp functions")
    SpecialThanks:add_text("YimMura & YimMenu Collaborators - For YimMenu API")