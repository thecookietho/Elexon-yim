--Required Scripts--

FMC = "fm_mission_controller"
FMMCL = "fmmc_launcher"
FMC2020 = "fm_mission_controller_2020"
HIP = "heist_island_planning"

--Globals & Locals & Variables--

FMg = 262145 -- free mode global ("CASH_MULTIPLIER") //correct
CSg1    = 1575038 						-- change session (type) 1 					// Guide:   NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false);
CSg2    = 1574589 						-- change session (switch) 2 				// Guide:   MP_POST_MATCH_TRANSITION_SCENE
CSg3    = 1574589 + 2 					-- change session (quit) 3 					// Guide:   MP_POST_MATCH_TRANSITION_SCENE

-- Apartment Heist
ACg1 = 1931323 + 1 + 1 -- global apartment player 1 cut global ("fmmc_launcher")
ACg2 = 1931323 + 1 + 2 -- global apartment player 2 cut global ("fmmc_launcher")
ACg3 = 1931323 + 1 + 3 -- global apartment player 3 cut global ("fmmc_launcher")
ACg4 = 1931323 + 1 + 4 -- global apartment player 4 cut global ("fmmc_launcher")
ACg5 = 1933291 + 3008 + 1 -- local apartment player 1 cut global ("fmmc_launcher")
AUAJg1 = FMg + 9101 -- apartment unlock all jobs global 1 ("ROOT_ID_HASH_THE_FLECCA_JOB")
AUAJg2 = FMg + 9106 -- apartment unlock all jobs global 2 ("ROOT_ID_HASH_THE_PRISON_BREAK")
AUAJg3 = FMg + 9113 -- apartment unlock all jobs global 3 ("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")
AUAJg4 = FMg + 9119 -- apartment unlock all jobs global 4 ("ROOT_ID_HASH_SERIES_A_FUNDING")
AUAJg5 = FMg + 9125 -- apartment unlock all jobs global 5 ("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")
AIFl3 = 19787 -- apartment instant finish local 1
AIFl4 = 19787 + 2686 -- apartment instant finish local 2
AIFl5 = 28407 + 1 -- apartment instant finish local 3
AIFl6 = 31663 + 1 + 68
AFHl = 11818 + 24 -- apartment fleeca hack local
AFDl = 10107 + 11 -- apartment fleeca drill local
AHSo = 19789  -- Apartment heist skip checkpoint

-- Diamond Casino Heist
DCRBl = 208 -- diamond casino reload board local
DCCg1 = 1967717 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global ("gb_casino_heist_planning")
DCCg2 = 1967717 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global ("gb_casino_heist_planning")
DCCg3 = 1967717 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global ("gb_casino_heist_planning")
DCCg4 = 1967717 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global ("gb_casino_heist_planning")
DCCl = FMg + 28313 -- ("CH_LESTER_CUT")
DCCh = FMg + 28349 - 1 --("2027377935")
DCCd = FMg + 28344 - 1 --("88090906")
DCCgun = FMg + 28339 - 1 --("74718927")
DCFHl = 53127 -- diamond casino fingerprint hack local
DCKHl = 54193 -- diamond casino keypad hack local
DCDVDl1 = 10107 + 7 -- diamond casino drill vault door local 1 --("DLC_HEIST_MINIGAME_FLEECA_DRILLING_SCENE") in ("fm_mission_controller")
DCDVDl2 = 10107 + 37 -- diamond casino drill vault door local 2 --("fm_mission_controller")
DCXf1 = 19787
DCXf2 = 19787 + 1062
DCXf3 = 19787 + 1740 + 1
DCXf4 = 19787 + 2686
DCXf5 = 28407 + 1
DCXf6 = 31663 + 1 + 68

-- Cayo Perico Heist
CPRSl = 1566 -- cayo perico reload screen local
CPCg1 = 1974520 + 831 + 56 + 1 -- cayo perico player 1 cut global --("heist_island_planning")
CPCg2 = 1974520 + 831 + 56 + 2 -- cayo perico player 2 cut global --("heist_island_planning")
CPCg3 = 1974520 + 831 + 56 + 3 -- cayo perico player 3 cut global --("heist_island_planning")
CPCg4 = 1974520 + 831 + 56 + 4 -- cayo perico player 4 cut global --("heist_island_planning")
CPFHl = 25058 -- cayo perico fingerprint hack local ("heist") in ("fm_mission_controller_2020")
CPPCCl = 31123 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds") in ("fm_mission_controller_2020")
CPSTCl = 29883 -- cayo perico drainage pipe cut local ("IntroFinished") in ("fm_mission_controller_2020")
CPXf1 = 54353 -- cayo perico instant finish local 1
CPXf2 = 54353 + 1776 + 1 -- cayo perico instant finish local 2

-- Doomsday Heist
DDSHl = 1294 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1963610 + 812 + 50 + 1 -- doomsday player 1 cut global --("gb_gang_ops_planning")
DCg2 = 1963610 + 812 + 50 + 2 -- doomsday player 2 cut global --("gb_gang_ops_planning")
DCg3 = 1963610 + 812 + 50 + 3 -- doomsday player 3 cut global --("gb_gang_ops_planning")
DCg4 = 1963610 + 812 + 50 + 4 -- doomsday player 4 cut global --("gb_gang_ops_planning")

IHPB = 54353 --Instant Heist Passed Local Base (Casino And CayoPerico)
IHPL = 54353 + 1776 + 1 --Instant Heist Passed Locals (Casino And CayoPerico)

NLCl = 204 + 32 + 1 --("nightclub_office_cutscene") in ("am_mp_nightclub")

SNOW = FMg + 4413
halloweatherAddress = FMg + 32157

--BV = Ballastic Value----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BV = FMg + 20024

--CCBL = Casino Chips Buy Limit-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CCBL0 = FMg + 26534
CCBL1 = FMg + 26535

--BAS=Bag Size------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BAS1 = FMg + 29210

--PSV=Panther Statue-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PSV = FMg + 29462

--PDIAMOND=Pink Diamond---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PDIAMOND = FMg + 29460

--BB=Bearer Bonds---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BB = FMg + 29459

--RN=Ruby Necklace--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RN = FMg + 29458

--TEQUILA=Tequila---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TEQUILA = FMg + 29457

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
