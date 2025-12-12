local function MPX()
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

FMISSIONC = "fm_mission_controller"
FMISSIONC2020 = "fm_mission_controller_2020"
HISLANDP = "heist_island_planning"

gui.show_message("TCC", "Love you internet people <3")


log.warning("Enjoy Elexon :D")

    ScriptMainMenu = gui.get_tab("Elexon made by TheCookieTho")
    ScriptMainMenu:add_text("Elexon 1.72 Beta")


    moneymethods = ScriptMainMenu:add_tab("Money Methods")
    ranksmenu = ScriptMainMenu:add_tab("Ranks Menu")
    unlocks = ScriptMainMenu:add_tab("Unlocks Menu")


    
VehiclesMenu = ScriptMainMenu:add_tab("Vehicle Menu")


local removed_vehicles = require("elexon-incl.removed_vehicles") -- load the removed vehicles list

VehiclesMenu:add_button("Removed Vehicles(WIP)", function() -- button to set globals for removed vehicles
    for _, offset in ipairs(removed_vehicles) do -- iterate through each offset
        print("Setting global:", 262145 + offset) -- debug print to yimmenu console
        globals.set_int(262145 + offset, 1) -- set the global to 1
    end
end)



    MissionEdit = ScriptMainMenu:add_tab("Missions Menu")

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


-- Compressed RP table for low ranks as a CSV string
local levelsCSV = "0,800,2100,3800,6100,9500,12500,16000,19800,24000,28500,33400,38700,44200,50200,56400,63000,69900,77100,84700,92500,100700,109200,118000,127100,136500,146200,156200,166500,177100,188000,199200,210700,222400,234500,246800,259400,272300,285500,299000,312700,326800,341000,355600,370500,385600,401000,416600,432600,448800,465200"

-- Parse CSV into a Lua table at runtime
local baseLevels = {}
for v in string.gmatch(levelsCSV, "[^,]+") do
    table.insert(baseLevels, tonumber(v))
end

-- Function to get RP for any rank 1-8000
local function getRPForRank(rank)
    if rank <= #baseLevels then
        return baseLevels[rank]
    end
    -- Quadratic approximation for high ranks
    return math.floor(25*rank^2 + 23575*rank - 1023150)
end

-- Helper function to set RP for player or crew
local function setRankRP(levelValue, isCrew, changeSession)
    if levelValue <= 0 or levelValue > 8000 then
        gui.show_message("ERROR", "Rank "..levelValue.." is out of range (1-8000).")
        return
    end

    local rp = getRPForRank(levelValue)

    if isCrew then
        for i = 0, 4 do
            stats.set_int("MPPLY_CREW_LOCAL_XP_"..i, rp)
        end
        gui.show_message("Crew Rank Editor", "Your Crew Rank is now "..levelValue)
    else
        stats.set_int(MPX() .. "CHAR_SET_RP_GIFT_ADMIN", rp)
        globals.set_int(1575036, 11)
        globals.set_int(1574589, 1)
        globals.set_int(1574589, 0)
        local msg = "Your rank is set to "..levelValue
        if changeSession then
            msg = msg .. ", changing session."
            network.go_online(true)
        else
            msg = msg .. ", change session to apply."
        end
        gui.show_message("Rank editor", msg)
    end
end

-- Rank Editor Tab
RankEditor = ranksmenu:add_tab("Custom Rank Editor")
RankEditor:add_text("Set your rank to:")
local rankLevel = RankEditor:add_input_int("rank")


RankEditor:add_button("Set rank and change session", function()
    setRankRP(rankLevel:get_value(), false, true)
end)

-- Crew Rank Editor Tab
CrewRankEditor = ranksmenu:add_tab("Crew Rank Editor")
CrewRankEditor:add_text("Set your Rank to:")
local crewRankLevel = CrewRankEditor:add_input_int("Crew Rank")

CrewRankEditor:add_button("set Crew Rank and change session", function()
    setRankRP(crewRankLevel:get_value(), false, true)
end)

    
    LatestUnlock = unlocks:add_tab("Unlocker Menu")
    LSCMUnlocker = unlocks:add_tab("LCSM Unlocker")


local unlocks_config = require("elexon-incl.unlocks")

function unlock_packed_bools(from, to)
    for i = from, to do
        stats.set_packed_stat_bool(i, true)
        print("[DEBUG] Unlocking stat ID:", i) -- prints to YimMenu console
    end
end

LatestUnlock:add_button("Unlock Everything", function()
    print("[DEBUG] Starting Unlock Everything") -- optional start marker

    -- Generic unlocks
    for _, range in ipairs(unlocks_config.generic) do
        unlock_packed_bools(range.from, range.to)
    end

    -- Gender-specific unlocks
    local gender_ranges = player_male and unlocks_config.male or unlocks_config.female
    for _, range in ipairs(gender_ranges) do
        unlock_packed_bools(range.from, range.to)
    end

    print("[DEBUG] Finished Unlock Everything") -- optional end marker
end)





    local TransactionManager <const> = {};
    TransactionManager.__index = TransactionManager
    
    function TransactionManager.new()
        local instance = setmetatable({}, TransactionManager);
    
        instance.Transactions = {
            {label = "7 MILLION", hash = 0xED97AFC1},
            {label = "3.6 MILLION", hash = 0xB703ED29},
            {label = "3 MILLION", hash = 0x176D9D54},
            {label = "2.5 MILLION", hash = 0x46521174},
            {label = "2.5 MILLION", hash = 0xDBF39508},
            {label = "2 MILLION", hash = 0x8107BB89},
            {label = "2 MILLION", hash = 0x921FCF3C},
            {label = "2 MILLION", hash = 0x4B6A869C},
            {label = "1 MILLION", hash = 0xE9BBC247},
            {label = "1 MILLION", hash = 0x314FB8B0},
            {label = "1 MILLION", hash = 0xBFCBE6B6},
            {label = "680 THOUSAND", hash = 0xACA75AAE},
            {label = "500 THOUSAND", hash = 0x05F2B7EE},
            {label = "310 THOUSAND", hash = 0xEE884170},
            {label = "200 THOUSAND", hash = 0xBA16F44B},
            {label = "200 THOUSAND",  hash = 0x9145F938},
            {label = "200 THOUSAND",    hash = 0xCDCF2380},
            {label = "190 THOUSAND",   hash = 0xFD389995}
        }
    
        return instance;
    end
    
    ---@return Table TransactionList
    function TransactionManager:GetTransactionList()
        return self.Transactions;
    end
    
    ---@return Int32 character
    function TransactionManager:GetCharacter()
        local _, char = STATS.STAT_GET_INT(joaat("MPPLY_LAST_MP_CHAR"), 0, 1)
        return tonumber(char);
    end
    
    ---@param Int32 hash 
    ---@param Int32 category
    ---@return Int32 price
    function TransactionManager:GetPrice(hash)
        return tonumber(NETSHOPPING.NET_GAMESERVER_GET_PRICE(hash, 0x57DE404E, true))
    end
    
     
    ---@param Int32 hash 
    ---@param? Int32 amount 
    function TransactionManager:TriggerTransaction(item_hash)
        script.execute_as_script("shop_controller", function()
            if NETSHOPPING.NET_GAMESERVER_BASKET_IS_ACTIVE() then
                NETSHOPPING.NET_GAMESERVER_BASKET_END()
            end
    
            local status, tranny_id = NETSHOPPING.NET_GAMESERVER_BEGIN_SERVICE(-1, 0x57DE404E, item_hash, 0x562592BB, self:GetPrice(item_hash), 2)
            if status then
                NETSHOPPING.NET_GAMESERVER_CHECKOUT_START(tranny_id)
            end
        end)
    end
    
    function TransactionManager:Init()
        local sub_transactionL  = moneymethods:add_tab("OP MONEY METHODS")

        for _, stealth in ipairs(self:GetTransactionList()) do
            sub_transactionL:add_button(stealth.label, function()
                self:TriggerTransaction(stealth.hash)
            end)
        end    
    end
    
    
    TransactionManager.new():Init()

    NightClubMoney = moneymethods:add_tab("NIGHTCLUB SAFE LOOP")

    SafeAmount = 250000
    SafeCapacity = 23680 --NIGHTCLUBMAXSAFEVALUE
    IncomeStart = 23657 --NIGHTCLUBINCOMEUPTOPOP5
    IncomeEnd = 23676 --NIGHTCLUBINCOMEUPTOPOP100
    
    NCRSCB = NightClubMoney:add_checkbox("ENABLE NIGHTCLUB LOOP")
    script.register_looped("nightclubremotelooptest", function(script)
        script:yield()
        if NCRSCB:is_enabled() == true then
            SafeValue = 1845221 + self.get_id() + 268 + 360 + 6
            for i = IncomeStart, IncomeEnd do
                globals.set_int(262145 + i, SafeAmount)
            end
            globals.set_int(262145 + SafeCapacity, SafeAmount)
            stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
            script:sleep(2500)
            if globals.get_int(SafeValue) ~= 0 then
            end
            locals.set_int("am_mp_nightclub", NLCl, 1)
            globals.set_int(4538089, 0)
            globals.set_int(4538090, 0)
            globals.set_int(4538091, 0)
            script:sleep(1000)
        end
    end)
    
    NightClubMoney:add_separator()



--[[ Report Checker ]]
    CheckUrReports = ScriptMainMenu:add_tab("REPORTS")
    CheckUrReports:add_text("GRIEFING: " .. stats.get_int("MPPLY_GRIEFING"))
    CheckUrReports:add_text("EXPLOITING: " .. stats.get_int("MPPLY_EXPLOITS"))
    CheckUrReports:add_text("ABUSING BUGS: " .. stats.get_int("MPPLY_GAME_EXPLOITS"))
    CheckUrReports:add_text("ANNOYING PEOPLE IN TEXT: " .. stats.get_int("MPPLY_TC_ANNOYINGME"))
    CheckUrReports:add_text("HATE SPEECH IN TEXT: " .. stats.get_int("MPPLY_TC_HATE"))
    CheckUrReports:add_text("ANNOYING PEOPLE IN VOICE: " .. stats.get_int("MPPLY_VC_ANNOYINGME"))
    CheckUrReports:add_text("HATE SPEECH IN VOICE: " .. stats.get_int("MPPLY_VC_HATE"))
    CheckUrReports:add_text("OFFENSIVE LANGUAGE: " .. stats.get_int("MPPLY_OFFENSIVE_LANGUAGE"))
    CheckUrReports:add_text("OFFENSIVE TAGPLATE: " .. stats.get_int("MPPLY_OFFENSIVE_TAGPLATE"))
    CheckUrReports:add_text("OFFENSIVE CONTENT: " .. stats.get_int("MPPLY_OFFENSIVE_UGC"))
    CheckUrReports:add_text("BAD CREW NAME: " .. stats.get_int("MPPLY_BAD_CREW_NAME"))
    CheckUrReports:add_text("BAD CREW MOTTO: " .. stats.get_int("MPPLY_BAD_CREW_MOTTO"))
    CheckUrReports:add_text("BAD CREW STATUS: " .. stats.get_int("MPPLY_BAD_CREW_STATUS"))
    CheckUrReports:add_text("BAD CREW EMBLEM: " .. stats.get_int("MPPLY_BAD_CREW_EMBLEM"))
    CheckUrReports:add_separator()
    CheckUrReports:add_text("COMMENDS:")
    CheckUrReports:add_separator()
    CheckUrReports:add_text("FRIENDLY: " .. stats.get_int("MPPLY_FRIENDLY"))
    CheckUrReports:add_text("HELPFUL: " .. stats.get_int("MPPLY_HELPFUL"))




-- Safe vehicle-claim patch for 1.72(maybe) (replace the previous RUN_SCRIPT/GIVE logic)
local GARAGE_MENU_DATA    = 176 -- keep original as fallback; may need update for 1.72
local VEHICLE_REWARD_DATA = 129 -- keep original as fallback; may need update for 1.72

local should_run_script = false

local function safe_get_pointer(script_name, offset)
    local ok, ptr = pcall(function() return locals.get_pointer(script_name, offset) end)
    if not ok then return nil end
    if ptr == 0 or ptr == nil then return nil end
    return ptr
end

-- wrapper for GIVE_VEHICLE_REWARD that uses pcall so lua errors don't crash game
local function SAFE_GIVE_VEHICLE_REWARD(vehicle_id, data, transaction, garage, slot, state)
    local ok, res = pcall(function()
        return scr_function.call_script_function("am_mp_vehicle_reward", "GVR", "2D 0C 1E 00 00", "bool", {
            { "int", vehicle_id },
            { "ptr", data },
            { "ptr", transaction },
            { "ptr", garage },
            { "ptr", slot },
            { "ptr", state },
            { "bool", false }, -- ??? (kept from original)
            { "bool", true },  -- Set as Last PV
            { "bool", true },  -- Display Cancel Error Message
            { "bool", false }, -- Is Podium Vehicle
            { "int", 0 },      -- ??? 
            { "int", -1 }      -- ??? 
        })
    end)
    if not ok then
        return false, tostring(res)
    end
    return res, nil
end

local function RUN_SCRIPT_SAFE()
    -- sanity checks
    if not ENTITY.DOES_ENTITY_EXIST(self.get_veh()) then
        should_run_script = false
        return
    end

    -- get pointers safely
    local menu_data    = safe_get_pointer("am_mp_vehicle_reward", GARAGE_MENU_DATA)
    local trans_res    = safe_get_pointer("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 4)
    local garage_id    = safe_get_pointer("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 5)
    local garage_slot  = safe_get_pointer("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 6)
    local reward_state = safe_get_pointer("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 7)

    -- if any pointer is missing, abort safely and show helpful message
    if not menu_data or not trans_res or not garage_id or not garage_slot or not reward_state then
        should_run_script = false
        gui.show_error("Vehicle Reward", "Cannot claim vehicle: vehicle-reward script pointers invalid (1.72 changed layout?).")
        log.warning("Vehicle Reward: missing pointer(s). Try updating GARAGE_MENU_DATA/VEHICLE_REWARD_DATA for 1.72.")
        return
    end

    -- final check: ensure the vehicle model is valid for PV (keeps original safeguard)
    local veh = self.get_veh()
    local model = ENTITY.GET_ENTITY_MODEL(veh)
    local ok = pcall(function() return IS_VEHICLE_VALID_FOR_PV(model) end)
    if not ok or not IS_VEHICLE_VALID_FOR_PV(model) then
        should_run_script = false
        gui.show_error("Vehicle Reward", "This vehicle cannot be saved as a personal vehicle.")
        return
    end

    -- call the function safely and capture errors
    local succ, err = SAFE_GIVE_VEHICLE_REWARD(veh, menu_data, trans_res, garage_id, garage_slot, reward_state)
    if not succ then
        should_run_script = false
        local msg = "Vehicle Reward failed: " .. (err or "unknown error")
        gui.show_error("Vehicle Reward", msg)
        log.warning(msg)
        return
    end

    -- success path (attempt to clear inputs like original did)
    -- note: check that the reward_state actually changed to avoid infinite loops
    local state_val = locals.get_int("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 7)
    if state_val and state_val ~= 3 then
        locals.set_int("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 4, 0)
        locals.set_int("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 5, 0)
        locals.set_int("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 6, 0)
        locals.set_int("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 7, 0)
        should_run_script = false
        gui.show_message("Vehicle Reward", "Claim attempted. If vehicle wasn't saved, a 1.72 offset update is likely needed.")
    else
        -- either no state value or it equals 3 (whatever original logic expected)
        should_run_script = false
        gui.show_message("Vehicle Reward", "Claim attempt finished; check garage/inventory.")
    end
end

-- safer loop registration (replaces previous looped registration)
script.register_looped("Vehicle Reward", function()
    if not script.is_active("am_mp_vehicle_reward") then
        should_run_script = false
        return
    end
    if should_run_script then
        -- run the safer runner inside a fiber so it won't hold up UI
        script.run_in_fiber(RUN_SCRIPT_SAFE)
    end
end)




local VehiclesMenu = VehiclesMenu:add_button("CLAIM CURRENT VEHICLE AS PV", function()
    script.run_in_fiber(function()
        if network.is_session_started() and script.is_active("freemode") and script.is_active("am_mp_vehicle_reward") then
            if PED.IS_PED_IN_ANY_VEHICLE(self.get_ped(), false) then
                if IS_VEHICLE_VALID_FOR_PV(ENTITY.GET_ENTITY_MODEL(self.get_veh())) then
                    should_run_script = true
                else
                    gui.show_error("Vehicle Reward", "This vehicle cannot be saved as a personal vehicle.")
                end
            else
                gui.show_error("Vehicle Reward", "Please get in a vehicle.")
            end
        else
            gui.show_error("Vehicle Reward", "Cannot give vehicle at the moment. Are you online?")
        end
    end)
end)


----------------------------------------------------------------------

ilovecredits = ScriptMainMenu:add_tab("C R E D I T S")

    ScriptMainMenui = ilovecredits:add_tab("INTRXDUCE")
    ScriptMainMenui:add_text("UTHENSIA MENU DEVELOPER")
    ScriptMainMenui:add_text("INSTAGRAM:")
    ScriptMainMenui:add_text("https://www.instagram.com/intrxduce.gta/")
    
    Shoxii = ilovecredits:add_tab("Shoxii_")
    Shoxii:add_text("FIRST PERSON TO TEST UTHENSIA")
    Shoxii:add_text("DISCORD: shoxii.")

ThanksMate = ilovecredits:add_tab("SPECIAL THANKS TO:")
yagz2jz = ThanksMate:add_tab("Yagz2jz")
             yagz2jz:add_text("HELPED ME A LOT WITH THE MENU AND GAVE ME SO MANY IDEAS.")
             yagz2jz:add_text("INSTAGRAM:")
             yagz2jz:add_text("https://www.instagram.com/yagz2jz/")
