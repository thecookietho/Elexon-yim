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

    --HeistMenu = recoverymenu:add_tab("Heist Editor")                                        -- Recovery Menu -> Heist editor

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

local unlocks = require("elexon-incl.unlocks_consolidated")                                 -- consolidated unlocks system



-- MP Helper
function mp()
    return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
end

Info = MoneyMenu:add_tab("Read before using Money Methods")
Info:add_text("Money Methods are always risky.")
Info:add_text("If you dont want to risk your account, do not use Money Methods.")
Info:add_separator()
Info:add_text("If you choose to use Money Methods, dont go over 10.000.000GTA$ per real life day.")

-- Setup unlock GUI
unlocks.setup_gui(LatestUnlock, MPX, player_male, script)


