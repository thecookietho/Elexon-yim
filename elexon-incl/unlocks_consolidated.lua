-- ============================================================================
-- Elexon Consolidated Unlocks System
-- Combines cosmetics, achievements, and stats unlocks into one unified module
-- ============================================================================

local M = {}

-- ============================================================================
-- COSMETIC & ACHIEVEMENT PACKED BOOL UNLOCKS
-- ============================================================================

M.packed_cosmetics = {
    generic = {
        {from = 110, to = 113},
        {from = 115, to = 115},
        {from = 124, to = 124},
        {from = 129, to = 129},
        {from = 135, to = 137},
        {from = 3593, to = 3599},
        {from = 3604, to = 3605},
        {from = 3608, to = 3609},
        {from = 3616, to = 3616},
        {from = 3750, to = 3750},
        {from = 3765, to = 3769},
        {from = 3770, to = 3781},
        {from = 3783, to = 3802},
        {from = 4247, to = 4269},
        {from = 4300, to = 4327},
        {from = 4333, to = 4335},
        {from = 7467, to = 7495},
        {from = 7515, to = 7528},
        {from = 7551, to = 7551},
        {from = 7595, to = 7601},
        {from = 9362, to = 9385},
        {from = 9426, to = 9440},
        {from = 9443, to = 9443},
        {from = 9461, to = 9481},
        {from = 15381, to = 15382},
        {from = 15388, to = 15423},
        {from = 15425, to = 15439},
        {from = 15447, to = 15474},
        {from = 15491, to = 15499},
        {from = 15552, to = 15560},
        {from = 18099, to = 18099},
        {from = 18116, to = 18118},
        {from = 18121, to = 18125},
        {from = 18134, to = 18137},
        {from = 22124, to = 22132},
        {from = 22137, to = 22139},
        {from = 24963, to = 25000},
        {from = 25002, to = 25002},
        {from = 25005, to = 25006},
        {from = 25008, to = 25009},
        {from = 25018, to = 25099},
        {from = 25101, to = 25109},
        {from = 25111, to = 25134},
        {from = 25136, to = 25179},
        {from = 25181, to = 25237},
        {from = 25244, to = 25400},
        {from = 25405, to = 25405},
        {from = 25407, to = 25511},
        {from = 25516, to = 25516},
        {from = 25520, to = 25521},
    },
    male = {},
    female = {}
}

-- ============================================================================
-- STAT UNLOCKS (ACHIEVEMENTS, MISSION PROGRESS, ETC.)
-- ============================================================================

local function get_stat_unlocks_list()
    return {
        "FIXER_GENERAL_BS", "FIXER_COMPLETED_BS", "FIXER_STORY_BS",
        "GANGOPS_FLOW_MISSION_PROG", "GANGOPS_HEIST_STATUS", "GANGOPS_FLOW_NOTIFICATIONS",
        "FIXER_STORY_STRAND", "FIXER_STORY_COOLDOWN", "FIXER_SC_VEH_RECOVERED",
        "FIXER_SC_VAL_RECOVERED", "FIXER_SC_GANG_TERMINATED", "FIXER_SC_VIP_RESCUED",
        "FIXER_SC_ASSETS_PROTECTED", "FIXER_SC_EQ_DESTROYED", "FIXER_COUNT", "FIXER_EARNINGS",
        "PAYPHONE_BONUS_KILL_METHOD", "AWD_WATCH_YOUR_STEP", "AWD_TOWER_OFFENSE",
        "AWD_READY_FOR_WAR", "AWD_THROUGH_A_LENS", "AWD_SPINNER", "AWD_YOUMEANBOOBYTRAPS",
        "AWD_MASTER_BANDITO", "AWD_SITTING_DUCK", "AWD_CROWDPARTICIPATION", "AWD_KILL_OR_BE_KILLED",
        "AWD_MASSIVE_SHUNT", "AWD_YOURE_OUTTA_HERE", "AWD_WEVE_GOT_ONE", "AWD_TIME_SERVED",
        "AWD_CAREER_WINNER", "AWD_ARENA_WAGEWORKER", "CH_ARC_CAB_CLAW_TROPHY", "CH_ARC_CAB_LOVE_TROPHY",
        "AWD_PREPARATION", "AWD_ASLEEPONJOB", "AWD_DAICASHCRAB", "AWD_BIGBRO", "AWD_SHARPSHOOTER",
        "AWD_RACECHAMP", "AWD_BATSWORD", "AWD_COINPURSE", "AWD_ASTROCHIMP", "AWD_MASTERFUL",
        "SCGW_NUM_WINS_GANG_0", "SCGW_NUM_WINS_GANG_1", "SCGW_NUM_WINS_GANG_2", "SCGW_NUM_WINS_GANG_3",
        "IAP_MA0_MOON_DIST", "AWD_FACES_OF_DEATH", "HEIST_PLANNING_STAGE", "LIFETIME_BKR_SELL_EARNINGS5",
        "VCM_FLOW_PROGRESS", "VCM_STORY_PROGRESS", "MKRIFLE_MK2_KILLS", "MKRIFLE_MK2_DEATHS",
        "MKRIFLE_MK2_SHOTS", "MKRIFLE_MK2_HITS", "MKRIFLE_MK2_HEADSHOTS", "MKRIFLE_MK2_HELDTIME",
        "MKRIFLE_MK2_DB_HELDTIME", "MKRIFLE_MK2_ENEMY_KILLS", "AWD_ODD_JOBS",
        "HIGHEST_SKITTLES", "NUMBER_NEAR_MISS", "LAP_DANCED_BOUGHT", "CARS_EXPLODED",
        "CARS_COPS_EXPLODED", "BIKES_EXPLODED", "BOATS_EXPLODED", "HELIS_EXPLODED",
        "PLANES_EXPLODED", "QUADBIKE_EXPLODED", "BICYCLE_EXPLODED", "SUBMARINE_EXPLODED",
        "DEATHS", "DIED_IN_DROWNING", "DIED_IN_DROWNINGINVEHICLE", "DIED_IN_EXPLOSION",
        "DIED_IN_FALL", "DIED_IN_FIRE", "DIED_IN_ROAD", "NO_PHOTOS_TAKEN", "PROSTITUTES_FREQUENTED",
        "BOUNTSONU", "BOUNTPLACED", "PASS_DB_KILLS", "PASS_DB_PLAYER_KILLS", "PASS_DB_SHOTS",
        "PASS_DB_HITS", "PASS_DB_HITS_PEDS_VEHICLES", "PASS_DB_HEADSHOTS", "TIRES_POPPED_BY_GUNSHOT",
        "NUMBER_CRASHES_CARS", "NUMBER_CRASHES_BIKES", "BAILED_FROM_VEHICLE", "NUMBER_CRASHES_QUADBIKES",
        "NUMBER_STOLEN_COP_VEHICLE", "NUMBER_STOLEN_CARS", "NUMBER_STOLEN_BIKES", "NUMBER_STOLEN_BOATS",
        "NUMBER_STOLEN_HELIS", "NUMBER_STOLEN_PLANES", "NUMBER_STOLEN_QUADBIKES", "NUMBER_STOLEN_BICYCLES",
        "FAVOUTFITBIKETIMECURRENT", "FAVOUTFITBIKETIME1ALLTIME", "FAVOUTFITBIKETYPECURRENT",
        "FAVOUTFITBIKETYPEALLTIME", "MC_CONTRIBUTION_POINTS", "MEMBERSMARKEDFORDEATH", "MCKILLS",
        "MCDEATHS", "RIVALPRESIDENTKILLS", "RIVALCEOANDVIPKILLS", "MELEEKILLS", "CLUBHOUSECONTRACTSCOMPLETE",
        "CLUBHOUSECONTRACTEARNINGS", "CLUBCHALLENGESCOMPLETED", "MEMBERCHALLENGESCOMPLETED", "HITS",
        "MKRIFLE_KILLS", "MKRIFLE_DEATHS", "MKRIFLE_SHOTS", "MKRIFLE_HITS", "MKRIFLE_HEADSHOTS",
        "MKRIFLE_HELDTIME", "MKRIFLE_DB_HELDTIME", "MKRIFLE_ENEMY_KILLS", "BETAMOUNT", "GHKILLS",
        "HORDELVL", "HORDKILLS", "UNIQUECRATES", "BJWINS", "HORDEWINS", "MCMWINS", "GANGHIDWINS",
        "KILLS", "HITS_PEDS_VEHICLES", "SHOTS", "HEADSHOTS", "KILLS_ARMED", "SUCCESSFUL_COUNTERS",
        "KILLS_PLAYERS", "DEATHS_PLAYER", "KILLS_STEALTH", "KILLS_INNOCENTS", "KILLS_ENEMY_GANG_MEMBERS",
        "KILLS_FRIENDLY_GANG_MEMBERS", "KILLS_BY_OTHERS", "BIGGEST_VICTIM_KILLS", "ARCHENEMY_KILLS",
        "CRARMWREST", "CRBASEJUMP", "CRDARTS", "CRDM", "CRGANGHIDE", "CRGOLF", "CRHORDE", "CRMISSION",
        "CRSHOOTRNG", "CRTENNIS", "TOTAL_TIME_CINEMA", "NO_TIMES_CINEMA", "TIME_AS_A_PASSENGER",
        "TIME_AS_A_DRIVER", "TIME_SPENT_FLYING", "TIME_IN_CAR", "LIFETIME_BKR_SELL_UNDERTABC",
        "LIFETIME_BKR_SELL_COMPLETBC", "BKR_PROD_STOP_COUT_S1_0", "BKR_PROD_STOP_COUT_S2_0",
        "BKR_PROD_STOP_COUT_S3_0", "LFETIME_BIKER_BUY_UNDERTA1", "LFETIME_BIKER_BUY_COMPLET1",
        "LFETIME_BIKER_SELL_UNDERTA1", "LFETIME_BIKER_SELL_COMPLET1", "LIFETIME_BKR_SEL_UNDERTABC1",
        "LIFETIME_BKR_SEL_COMPLETBC1", "BKR_PROD_STOP_COUT_S1_1", "BKR_PROD_STOP_COUT_S2_1",
        "BKR_PROD_STOP_COUT_S3_1", "LFETIME_BIKER_BUY_UNDERTA2", "LFETIME_BIKER_BUY_COMPLET2",
        "LFETIME_BIKER_SELL_UNDERTA2", "LFETIME_BIKER_SELL_COMPLET2", "LIFETIME_BKR_SEL_UNDERTABC2",
        "LIFETIME_BKR_SEL_COMPLETBC2", "BKR_PROD_STOP_COUT_S1_2", "BKR_PROD_STOP_COUT_S2_2",
        "BKR_PROD_STOP_COUT_S3_2", "LFETIME_BIKER_BUY_UNDERTA3", "LFETIME_BIKER_BUY_COMPLET3",
        "LFETIME_BIKER_SELL_UNDERTA3", "LFETIME_BIKER_SELL_COMPLET3", "LIFETIME_BKR_SEL_UNDERTABC3",
        "LIFETIME_BKR_SEL_COMPLETBC3", "BKR_PROD_STOP_COUT_S1_3", "BKR_PROD_STOP_COUT_S2_3",
        "BKR_PROD_STOP_COUT_S3_3", "LFETIME_BIKER_BUY_UNDERTA4", "LFETIME_BIKER_BUY_COMPLET4",
        "LFETIME_BIKER_SELL_UNDERTA4", "LFETIME_BIKER_SELL_COMPLET4", "LIFETIME_BKR_SEL_UNDERTABC4",
        "LIFETIME_BKR_SEL_COMPLETBC4", "BKR_PROD_STOP_COUT_S1_4", "BKR_PROD_STOP_COUT_S2_4",
        "BKR_PROD_STOP_COUT_S3_4", "LFETIME_BIKER_BUY_UNDERTA5", "LFETIME_BIKER_BUY_COMPLET5",
        "LIFETIME_BKR_SEL_UNDERTABC5", "LIFETIME_BKR_SEL_COMPLETBC5", "LFETIME_BIKER_SELL_UNDERTA5",
        "LFETIME_BIKER_SELL_COMPLET5", "BUNKER_UNITS_MANUFAC", "LFETIME_HANGAR_BUY_UNDETAK",
        "LFETIME_HANGAR_BUY_COMPLET", "LFETIME_HANGAR_SEL_UNDETAK", "LFETIME_HANGAR_SEL_COMPLET",
        "LFETIME_HANGAR_EARNINGS", "LFETIME_HANGAR_EARN_BONUS", "RIVAL_HANGAR_CRATES_STOLEN",
        "LFETIME_IE_STEAL_STARTED", "LFETIME_IE_EXPORT_STARTED", "LFETIME_IE_EXPORT_COMPLETED",
        "LFETIME_IE_MISSION_EARNINGS", "AT_FLOW_IMPEXP_NUM", "CLUB_POPULARITY", "NIGHTCLUB_VIP_APPEAR",
        "NIGHTCLUB_JOBS_DONE", "NIGHTCLUB_EARNINGS", "HUB_SALES_COMPLETED", "HUB_EARNINGS",
        "DANCE_COMBO_DURATION_MINS", "NIGHTCLUB_PLAYER_APPEAR", "LIFETIME_HUB_GOODS_SOLD",
        "LIFETIME_HUB_GOODS_MADE"
    }
end

M.stat_values = {
    FIXER_GENERAL_BS = -1,
    FIXER_COMPLETED_BS = -1,
    FIXER_STORY_BS = -1,
    GANGOPS_FLOW_MISSION_PROG = 240,
    GANGOPS_HEIST_STATUS = 229378,
    GANGOPS_FLOW_NOTIFICATIONS = 1557,
    FIXER_STORY_STRAND = -1,
    FIXER_STORY_COOLDOWN = -1,
    FIXER_SC_VEH_RECOVERED = 100,
    FIXER_SC_VAL_RECOVERED = 100,
    FIXER_SC_GANG_TERMINATED = 100,
    FIXER_SC_VIP_RESCUED = 100,
    FIXER_SC_ASSETS_PROTECTED = 100,
    FIXER_SC_EQ_DESTROYED = 100,
    FIXER_COUNT = 500,
    FIXER_EARNINGS = 26340756,
    PAYPHONE_BONUS_KILL_METHOD = -1,
    AWD_WATCH_YOUR_STEP = 15,
    AWD_TOWER_OFFENSE = 15,
    AWD_READY_FOR_WAR = 60,
    AWD_THROUGH_A_LENS = 60,
    AWD_SPINNER = 60,
    AWD_YOUMEANBOOBYTRAPS = 15,
    AWD_MASTER_BANDITO = 12,
    AWD_SITTING_DUCK = 60,
    AWD_CROWDPARTICIPATION = 60,
    AWD_KILL_OR_BE_KILLED = 60,
    AWD_MASSIVE_SHUNT = 60,
    AWD_YOURE_OUTTA_HERE = 110,
    AWD_WEVE_GOT_ONE = 52,
    AWD_TIME_SERVED = 110,
    AWD_CAREER_WINNER = 110,
    AWD_ARENA_WAGEWORKER = 1100000,
    CH_ARC_CAB_CLAW_TROPHY = -1,
    CH_ARC_CAB_LOVE_TROPHY = -1,
    AWD_PREPARATION = 40,
    AWD_ASLEEPONJOB = 20,
    AWD_DAICASHCRAB = 100000,
    AWD_BIGBRO = 40,
    AWD_SHARPSHOOTER = 40,
    AWD_RACECHAMP = 40,
    AWD_BATSWORD = 1000000,
    AWD_COINPURSE = 950000,
    AWD_ASTROCHIMP = 3000000,
    AWD_MASTERFUL = 40000,
    SCGW_NUM_WINS_GANG_0 = 50,
    SCGW_NUM_WINS_GANG_1 = 50,
    SCGW_NUM_WINS_GANG_2 = 50,
    SCGW_NUM_WINS_GANG_3 = 50,
    IAP_MA0_MOON_DIST = 2147483647,
    AWD_FACES_OF_DEATH = 50,
    HEIST_PLANNING_STAGE = -1,
    LIFETIME_BKR_SELL_EARNINGS5 = 50000000,
    VCM_FLOW_PROGRESS = -1,
    VCM_STORY_PROGRESS = -1,
    MKRIFLE_MK2_KILLS = 500,
    MKRIFLE_MK2_DEATHS = 100,
    MKRIFLE_MK2_SHOTS = 500,
    MKRIFLE_MK2_HITS = 500,
    MKRIFLE_MK2_HEADSHOTS = 500,
    MKRIFLE_MK2_HELDTIME = 5963259,
    MKRIFLE_MK2_DB_HELDTIME = 5963259,
    MKRIFLE_MK2_ENEMY_KILLS = 500,
    AWD_ODD_JOBS = 52,
    HIGHEST_SKITTLES = 900,
    NUMBER_NEAR_MISS = 1000,
    LAP_DANCED_BOUGHT = 100,
    CARS_EXPLODED = 500,
    CARS_COPS_EXPLODED = 300,
    BIKES_EXPLODED = 100,
    BOATS_EXPLODED = 168,
    HELIS_EXPLODED = 98,
    PLANES_EXPLODED = 138,
    QUADBIKE_EXPLODED = 50,
    BICYCLE_EXPLODED = 48,
    SUBMARINE_EXPLODED = 28,
    DEATHS = 499,
    DIED_IN_DROWNING = 833,
    DIED_IN_DROWNINGINVEHICLE = 833,
    DIED_IN_EXPLOSION = 833,
    DIED_IN_FALL = 833,
    DIED_IN_FIRE = 833,
    DIED_IN_ROAD = 833,
    NO_PHOTOS_TAKEN = 100,
    PROSTITUTES_FREQUENTED = 100,
    BOUNTSONU = 200,
    BOUNTPLACED = 500,
    PASS_DB_KILLS = 300,
    PASS_DB_PLAYER_KILLS = 300,
    PASS_DB_SHOTS = 300,
    PASS_DB_HITS = 300,
    PASS_DB_HITS_PEDS_VEHICLES = 300,
    PASS_DB_HEADSHOTS = 300,
    TIRES_POPPED_BY_GUNSHOT = 500,
    NUMBER_CRASHES_CARS = 300,
    NUMBER_CRASHES_BIKES = 300,
    BAILED_FROM_VEHICLE = 300,
    NUMBER_CRASHES_QUADBIKES = 300,
    NUMBER_STOLEN_COP_VEHICLE = 300,
    NUMBER_STOLEN_CARS = 300,
    NUMBER_STOLEN_BIKES = 300,
    NUMBER_STOLEN_BOATS = 300,
    NUMBER_STOLEN_HELIS = 300,
    NUMBER_STOLEN_PLANES = 300,
    NUMBER_STOLEN_QUADBIKES = 300,
    NUMBER_STOLEN_BICYCLES = 300,
    FAVOUTFITBIKETIMECURRENT = 884483972,
    FAVOUTFITBIKETIME1ALLTIME = 884483972,
    FAVOUTFITBIKETYPECURRENT = 884483972,
    FAVOUTFITBIKETYPEALLTIME = 884483972,
    MC_CONTRIBUTION_POINTS = 1000,
    MEMBERSMARKEDFORDEATH = 700,
    MCKILLS = 500,
    MCDEATHS = 700,
    RIVALPRESIDENTKILLS = 700,
    RIVALCEOANDVIPKILLS = 700,
    MELEEKILLS = 700,
    CLUBHOUSECONTRACTSCOMPLETE = 700,
    CLUBHOUSECONTRACTEARNINGS = 32698547,
    CLUBCHALLENGESCOMPLETED = 700,
    MEMBERCHALLENGESCOMPLETED = 700,
    HITS = 100000,
    MKRIFLE_KILLS = 500,
    MKRIFLE_DEATHS = 100,
    MKRIFLE_SHOTS = 500,
    MKRIFLE_HITS = 500,
    MKRIFLE_HEADSHOTS = 500,
    MKRIFLE_HELDTIME = 5963259,
    MKRIFLE_DB_HELDTIME = 5963259,
    MKRIFLE_ENEMY_KILLS = 500,
    BETAMOUNT = 500,
    GHKILLS = 500,
    HORDELVL = 10,
    HORDKILLS = 500,
    UNIQUECRATES = 500,
    BJWINS = 500,
    HORDEWINS = 500,
    MCMWINS = 500,
    GANGHIDWINS = 500,
    KILLS = 800,
    HITS_PEDS_VEHICLES = 100,
    SHOTS = 1000,
    HEADSHOTS = 100,
    KILLS_ARMED = 650,
    SUCCESSFUL_COUNTERS = 100,
    KILLS_PLAYERS = 3593,
    DEATHS_PLAYER = 1002,
    KILLS_STEALTH = 100,
    KILLS_INNOCENTS = 500,
    KILLS_ENEMY_GANG_MEMBERS = 100,
    KILLS_FRIENDLY_GANG_MEMBERS = 100,
    KILLS_BY_OTHERS = 100,
    BIGGEST_VICTIM_KILLS = 500,
    ARCHENEMY_KILLS = 500,
    CRARMWREST = 500,
    CRBASEJUMP = 500,
    CRDARTS = 500,
    CRDM = 500,
    CRGANGHIDE = 500,
    CRGOLF = 500,
    CRHORDE = 500,
    CRMISSION = 500,
    CRSHOOTRNG = 500,
    CRTENNIS = 500,
    TOTAL_TIME_CINEMA = 2147483647,
    NO_TIMES_CINEMA = 500,
    TIME_AS_A_PASSENGER = 2147483647,
    TIME_AS_A_DRIVER = 2147483647,
    TIME_SPENT_FLYING = 2147483647,
    TIME_IN_CAR = 2147483647,
    LIFETIME_BKR_SELL_UNDERTABC = 500,
    LIFETIME_BKR_SELL_COMPLETBC = 500,
    BKR_PROD_STOP_COUT_S1_0 = 500,
    BKR_PROD_STOP_COUT_S2_0 = 500,
    BKR_PROD_STOP_COUT_S3_0 = 500,
    LFETIME_BIKER_BUY_UNDERTA1 = 500,
    LFETIME_BIKER_BUY_COMPLET1 = 500,
    LFETIME_BIKER_SELL_UNDERTA1 = 500,
    LFETIME_BIKER_SELL_COMPLET1 = 500,
    LIFETIME_BKR_SEL_UNDERTABC1 = 500,
    LIFETIME_BKR_SEL_COMPLETBC1 = 500,
    BKR_PROD_STOP_COUT_S1_1 = 500,
    BKR_PROD_STOP_COUT_S2_1 = 500,
    BKR_PROD_STOP_COUT_S3_1 = 500,
    LFETIME_BIKER_BUY_UNDERTA2 = 500,
    LFETIME_BIKER_BUY_COMPLET2 = 500,
    LFETIME_BIKER_SELL_UNDERTA2 = 500,
    LFETIME_BIKER_SELL_COMPLET2 = 500,
    LIFETIME_BKR_SEL_UNDERTABC2 = 500,
    LIFETIME_BKR_SEL_COMPLETBC2 = 500,
    BKR_PROD_STOP_COUT_S1_2 = 500,
    BKR_PROD_STOP_COUT_S2_2 = 500,
    BKR_PROD_STOP_COUT_S3_2 = 500,
    LFETIME_BIKER_BUY_UNDERTA3 = 500,
    LFETIME_BIKER_BUY_COMPLET3 = 500,
    LFETIME_BIKER_SELL_UNDERTA3 = 500,
    LFETIME_BIKER_SELL_COMPLET3 = 500,
    LIFETIME_BKR_SEL_UNDERTABC3 = 500,
    LIFETIME_BKR_SEL_COMPLETBC3 = 500,
    BKR_PROD_STOP_COUT_S1_3 = 500,
    BKR_PROD_STOP_COUT_S2_3 = 500,
    BKR_PROD_STOP_COUT_S3_3 = 500,
    LFETIME_BIKER_BUY_UNDERTA4 = 500,
    LFETIME_BIKER_BUY_COMPLET4 = 500,
    LFETIME_BIKER_SELL_UNDERTA4 = 500,
    LFETIME_BIKER_SELL_COMPLET4 = 500,
    LIFETIME_BKR_SEL_UNDERTABC4 = 500,
    LIFETIME_BKR_SEL_COMPLETBC4 = 500,
    BKR_PROD_STOP_COUT_S1_4 = 500,
    BKR_PROD_STOP_COUT_S2_4 = 500,
    BKR_PROD_STOP_COUT_S3_4 = 500,
    LFETIME_BIKER_BUY_UNDERTA5 = 500,
    LFETIME_BIKER_BUY_COMPLET5 = 500,
    LIFETIME_BKR_SEL_UNDERTABC5 = 500,
    LIFETIME_BKR_SEL_COMPLETBC5 = 500,
    LFETIME_BIKER_SELL_UNDERTA5 = 500,
    LFETIME_BIKER_SELL_COMPLET5 = 500,
    BUNKER_UNITS_MANUFAC = 500,
    LFETIME_HANGAR_BUY_UNDETAK = 500,
    LFETIME_HANGAR_BUY_COMPLET = 500,
    LFETIME_HANGAR_SEL_UNDETAK = 500,
    LFETIME_HANGAR_SEL_COMPLET = 500,
    LFETIME_HANGAR_EARNINGS = 29654123,
    LFETIME_HANGAR_EARN_BONUS = 15987456,
    RIVAL_HANGAR_CRATES_STOLEN = 500,
    LFETIME_IE_STEAL_STARTED = 500,
    LFETIME_IE_EXPORT_STARTED = 500,
    LFETIME_IE_EXPORT_COMPLETED = 500,
    LFETIME_IE_MISSION_EARNINGS = 59654897,
    AT_FLOW_IMPEXP_NUM = 500,
    CLUB_POPULARITY = 1000,
    NIGHTCLUB_VIP_APPEAR = 300,
    NIGHTCLUB_JOBS_DONE = 500,
    NIGHTCLUB_EARNINGS = 39856412,
    HUB_SALES_COMPLETED = 500,
    HUB_EARNINGS = 29865423,
    DANCE_COMBO_DURATION_MINS = 86400000,
    NIGHTCLUB_PLAYER_APPEAR = 500,
    LIFETIME_HUB_GOODS_SOLD = 500,
    LIFETIME_HUB_GOODS_MADE = 500,
}

-- ============================================================================
-- HELPER FUNCTIONS
-- ============================================================================

local function unlock_packed_range(from, to)
    for i = from, to do
        stats.set_packed_stat_bool(i, true)
    end
end

-- ============================================================================
-- UNLOCK FUNCTIONS
-- ============================================================================

function M.unlock_cosmetics(player_is_male)
    for _, range in ipairs(M.packed_cosmetics.generic) do
        unlock_packed_range(range.from, range.to)
    end

    local gender_ranges = player_is_male and M.packed_cosmetics.male or M.packed_cosmetics.female
    for _, range in ipairs(gender_ranges) do
        unlock_packed_range(range.from, range.to)
    end
end

function M.unlock_achievements(MPX)
    if not MPX then
        log.error("MPX function not provided to unlock_achievements")
        return
    end

    local prefix = MPX()
    local stats_list = get_stat_unlocks_list()

    for _, stat_name in ipairs(stats_list) do
        local value = M.stat_values[stat_name]
        if value then
            stats.set_int(prefix .. stat_name, value)
        end
    end
end

function M.unlock_character_skills(MPX)
    if not MPX then
        log.error("MPX function not provided to unlock_character_skills")
        return
    end

    local prefix = MPX()
    stats.set_int(prefix .. "SCRIPT_INCREASE_DRIV", 100)
    stats.set_int(prefix .. "SCRIPT_INCREASE_FLY", 100)
    stats.set_int(prefix .. "SCRIPT_INCREASE_LUNG", 100)
    stats.set_int(prefix .. "SCRIPT_INCREASE_SHO", 100)
    stats.set_int(prefix .. "SCRIPT_INCREASE_STAM", 100)
    stats.set_int(prefix .. "SCRIPT_INCREASE_STL", 100)
    stats.set_int(prefix .. "SCRIPT_INCREASE_STRN", 100)
end

function M.unlock_gender_change(MPX)
    if not MPX then
        log.error("MPX function not provided to unlock_gender_change")
        return
    end

    stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", 52)
end

-- ============================================================================
-- MASTER UNLOCK FUNCTION
-- ============================================================================

function M.unlock_everything(MPX, player_is_male)
    log.debug("[UNLOCKS] Starting complete unlock sequence...")
    
    M.unlock_cosmetics(player_is_male)
    log.debug("[UNLOCKS] Cosmetics unlocked")
    
    M.unlock_achievements(MPX)
    log.debug("[UNLOCKS] Achievements unlocked")
    
    M.unlock_character_skills(MPX)
    log.debug("[UNLOCKS] Character skills maxed")
    
    log.debug("[UNLOCKS] Complete unlock sequence finished!")
end

-- ============================================================================
-- GUI SETUP FUNCTION
-- ============================================================================

function M.setup_gui(LatestUnlock, MPX, player_is_male, script)
    -- Info text
    LatestUnlock:add_text("All Unlocks Module")
    LatestUnlock:add_separator()
    LatestUnlock:add_text("Click 'Unlock Everything' to:")
    LatestUnlock:add_text("Unlock All cosmetic items and clothing")
    LatestUnlock:add_text("Unlock All achievements and stats")
    LatestUnlock:add_text("Max All character skills (Driving, Flying, etc.)")

    LatestUnlock:add_separator()
    
    -- Main unlock button
    LatestUnlock:add_button("Unlock Everything", function()
        M.unlock_everything(MPX, player_is_male)
        gui.show_message("Unlocks", "All unlocks complete!")
    end)
    
    LatestUnlock:add_separator()
    
    -- Gender change checkbox
    local GeCh = LatestUnlock:add_checkbox("Unlock Gender Change")
    script.register_looped("UnlockGenderChange", function(script_ctx)
        script_ctx:yield()
        if GeCh:is_enabled() then
            M.unlock_gender_change(MPX)
        end
    end)
end

return M
