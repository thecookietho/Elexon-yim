return function(StatsMenu)
    if not StatsMenu then
        log.error("StatsMenu is nil in rp")
        return
    end

local currentlevel = stats.get_int(MPX() .. "CHAR_RANK_FM")
local currentrp = stats.get_int(MPX() .. "CHAR_XP_FM")
local currentcrewlevel = stats.get_int("MPPLY_CURRENT_CREW_RANK")
parent = StatsMenu


local rp = {
    0, 800, 2100, 3800, 6100, 9500, 12500, 16000, 19800, 24000,
    28500, 33400, 38700, 44200, 50200, 56400, 63000, 69900, 77100, 84700,
    92500, 100700, 109200, 118000, 127100, 136500, 146200, 156200, 166500, 177100,
    188000, 199200, 210700, 222400, 234500, 246800, 259400, 272300, 285500, 299000,
    312700, 326800, 341000, 355600, 370500, 385600, 401000, 416600, 432600, 448800,
    465200, 482000, 499000, 516300, 533800, 551600, 569600, 588000, 606500, 625400,
    644500, 663800, 683400, 703300, 723400, 743800, 764500, 785400, 806500, 827900,
    849600, 871500, 893600, 916000, 938700, 961600, 984700, 1008100, 1031800, 1055700,
    1079800, 1104200, 1128800, 1153700, 1178800, 1204200, 1229800, 1255600, 1281700, 1308100,
    1334600, 1361400, 1388500, 1415800, 1443300, 1471100, 1499100, 1527300
}

local function getRP(level)
	if level < #rp then
		return rp[level]
	else
		return math.floor(25 * (level ^ 2) + 23575 * level - 1023150)
	end
end



parent:add_text("Your current Rank is " .. currentlevel)

parent:add_separator()

local rpLevel = parent:add_input_int("Rank")

parent:add_button("Set Rank", function()
	local rankValue = rpLevel:get_value()

	if rankValue <= 0 or rankValue > 8000 then
		gui.show_message(
			"ERROR",
			"Your RP level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000)."
		)
	else
		stats.set_int(MPX() .. "CHAR_SET_RP_GIFT_ADMIN", getRP(rankValue))
		stats.set_int("MPPLY_GLOBALXP", getRP(rankValue))
		globals.set_int(CSg1, 11)
		globals.set_int(CSg2, 1)
		globals.set_int(CSg2, 0)
		gui.show_message(
			"Rank Correction",
			"Your Rank was set to " .. rankValue .. ", Click change session For Your New Rank."
		)
	end
end)
parent:add_separator()

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

parent:add_text("Your Current Crew Rank is " .. currentcrewlevel)

parent:add_separator()

local rpLevel = parent:add_input_int("Rank")

parent:add_button("Set Crew Rank", function()
	local rankValue = rpLevel:get_value()

	if rankValue <= 0 or rankValue > 8000 then
		gui.show_message(
			"ERROR",
			"Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000)."
		)
	else
		stats.set_int("MPPLY_CREW_LOCAL_XP_0", getRP(rankValue))
        stats.set_int("MPPLY_CREW_LOCAL_XP_1", getRP(rankValue))
        stats.set_int("MPPLY_CREW_LOCAL_XP_2", getRP(rankValue))
        stats.set_int("MPPLY_CREW_LOCAL_XP_3", getRP(rankValue))
        stats.set_int("MPPLY_CREW_LOCAL_XP_4", getRP(rankValue))
		gui.show_message("Crew Rank Setter", "Your Crew Rank was set to " .. rankValue .. ", .")
	end
end)

end