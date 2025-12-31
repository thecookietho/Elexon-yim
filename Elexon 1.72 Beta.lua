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

log.info("TCT & Rrocas", "Love you internet people <3")
log.info("Enjoy Elexon :D")

--SWYgeW91IGRlY29kZWQgdGhpcywgeW91wrRyZSBwcm9iYWJseSBjdXJpb3VzLi4gc2hvb3QgbWUgYSBtc2cgb24gZGlzY29yZCBAbmpkZXJnZWlsb21hdA==


------------------------------------------------------------------------------
--[[ Elexon Main Menu Structure ]]--
------------------------------------------------------------------------------

    ScriptMainMenu = gui.get_tab("Elexon made by TCT & RROCAS")
    ScriptMainMenu:add_text("Elexon 1.72 Beta")


    SelfTab = ScriptMainMenu:add_tab("Self Menu") -- Self Menu Tab

    recoverymenu = ScriptMainMenu:add_tab("Recovery Menu")                                  -- Recovery Menu Tab
        MoneyMenu = recoverymenu:add_tab("Money Methods")                                   -- Recovery Menu -> Money Methods
            CasinoServicesMenu = MoneyMenu:add_tab("Casino Services")                       -- Recovery Menu -> Money Methods -> Casino Services
            NightClub = MoneyMenu:add_tab("Nightclub money loop")                           -- Recovery Menu -> Money Methods -> Nightclub money loop

    HeistMenu = recoverymenu:add_tab("Heist Editor")                                        -- Recovery Menu -> Heist editor

    StatsMenu = recoverymenu:add_tab("Stats Menu")                                          -- Recovery Menu -> Stats Menu
        RP_settings = StatsMenu:add_tab("Crew / Rank Editor")                               -- Recovery Menu -> Stats Menu -> RP Editor
        KD_Editor_Tab = StatsMenu:add_tab("KD Editor")                                      -- Recovery Menu -> Stats Menu -> KD Editor
        Reports = StatsMenu:add_tab("Report Checker & Editor")                              -- Recovery Menu -> Stats Menu -> Report Checker & Editor
        
    LatestUnlock = recoverymenu:add_tab("Unlocker Menu")                                    -- Recovery Menu -> Unlocker Menu
    

    VehiclesMenu = ScriptMainMenu:add_tab("Vehicle Menu")                                   -- Vehicle Menu


    SettingsMenu = ScriptMainMenu:add_tab("Script Settings")                                -- Settings Tab
    


------------------------------------------------------------------------------
--[[ Load Included Modules ]]--
------------------------------------------------------------------------------

require("elexon-incl.required_offsets")                                                     -- Offsets(from L7NEG)
require("elexon-incl.kd_editor")(KD_Editor_Tab)                                             -- KD Editor
require("elexon-incl.report_editor")(Reports)                                               -- Report Checker & Editor
require("elexon-incl.rank_editor")(RP_settings)                                             -- Crew / Rank Editor
require("elexon-incl.self_menu")(SelfTab)                                                   -- Self Menu
require("elexon-incl.money_methods")(recoverymenu, NightClub)                               -- Money Methods
require("elexon-incl.casino_menu")(CasinoServicesMenu)                                      -- Casino Services
require("elexon-incl.heist_editor")(recoverymenu)                                           -- Heist editor
require("elexon-incl.vehicle_menu")(VehiclesMenu)                                           -- Vehicle Menu
require("elexon-incl.settings")(SettingsMenu)                                               -- Settings Menu

local packed_unlocks = require("elexon-incl.unlocks")
local unlocks_config = require("elexon-incl.unlocks")                                       -- load the unlocks configuration
local stat_unlocks   = require("elexon-incl.unlocks2")



-- MP Helper
function mp()
    return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
end


Info = MoneyMenu:add_tab("Read before using Money Methods")
Info:add_text("Money Methods are always risky.")
Info:add_text("If you dont want to risk your account, do not use Money Methods.")
Info:add_separator()
Info:add_text("If you choose to use Money Methods, dont go over 10.000.000GTA$ per real life day.")
------------------------------------------------------------------------------
--[[ Unlocker Menu ]]--
------------------------------------------------------------------------------


function unlock_packed_bools(from, to)
    for i = from, to do
        stats.set_packed_stat_bool(i, true)
        -- log.debug("[DEBUG] Unlocking stat ID:", i) -- prints to YimMenu console. commented out to stop spam and clogging of logs
    end
end

Acv0 = false
AG = 4546910 + 1 --("CHEAT_ACHIEVE")

LatestUnlock:add_button("Unlock All Achievements", function()
	script.run_in_fiber(function(script)
		for i = 0, 77 do
			script:sleep(200)
			globals.set_int(AG, i)
			if i == 77 then
				gui.show_message("Achievements", "Unlocked 77 Achievements")
			end
		end
	end)
end)

LatestUnlock:add_sameline()

LatestUnlock:add_button("Max Character Skills", function()
	stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 100)
end)

LatestUnlock:add_sameline()

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

GeCh = LatestUnlock:add_checkbox("Unlock Gender Change")
script.register_looped("UnlockGenderChange", function(script)
	script:yield()
	if GeCh:is_enabled() then
		stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", 52)
	else
		stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", 52)
	end
end)

