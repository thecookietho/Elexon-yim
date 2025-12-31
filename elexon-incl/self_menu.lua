-- self_menu.lua

local function MPX()
    local char = stats.get_int("MPPLY_LAST_MP_CHAR")
    return "MP" .. char .. "_"
end
return function(SelfTab)



    SelfTab:add_button("Refill Inventory & Armour (Legit)", function()
	stats.set_int(MPX() .. "NO_BOUGHT_YUM_SNACKS", 30)
	stats.set_int(MPX() .. "NO_BOUGHT_HEALTH_SNACKS", 15)
	stats.set_int(MPX() .. "NO_BOUGHT_EPIC_SNACKS", 5)
	stats.set_int(MPX() .. "NUMBER_OF_CHAMP_BOUGHT", 5)
	stats.set_int(MPX() .. "NUMBER_OF_ORANGE_BOUGHT", 11)
	stats.set_int(MPX() .. "NUMBER_OF_BOURGE_BOUGHT", 10)
	stats.set_int(MPX() .. "NUMBER_OF_SPRUNK_BOUGHT", 10)
	stats.set_int(MPX() .. "CIGARETTES_BOUGHT", 20)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_1_COUNT", 10)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_2_COUNT", 10)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_3_COUNT", 10)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_4_COUNT", 10)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_5_COUNT", 10)
	stats.set_int(MPX() .. "BREATHING_APPAR_BOUGHT", 20)
end)
SelfTab:add_sameline()

SelfTab:add_button("Refill Inventory & Armour x1000", function()
	stats.set_int(MPX() .. "NO_BOUGHT_YUM_SNACKS", 1000)
	stats.set_int(MPX() .. "NO_BOUGHT_HEALTH_SNACKS", 1000)
	stats.set_int(MPX() .. "NO_BOUGHT_EPIC_SNACKS", 1000)
	stats.set_int(MPX() .. "NUMBER_OF_CHAMP_BOUGHT", 1000)
	stats.set_int(MPX() .. "NUMBER_OF_ORANGE_BOUGHT", 1000)
	stats.set_int(MPX() .. "NUMBER_OF_BOURGE_BOUGHT", 1000)
	stats.set_int(MPX() .. "NUMBER_OF_SPRUNK_BOUGHT", 1000)
	stats.set_int(MPX() .. "CIGARETTES_BOUGHT", 1000)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_1_COUNT", 1000)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_2_COUNT", 1000)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_3_COUNT", 1000)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_4_COUNT", 1000)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_5_COUNT", 1000)
	stats.set_int(MPX() .. "BREATHING_APPAR_BOUGHT", 1000)
end)


SelfTab:add_button("Remove Orbital Cannon Cooldown", function()
	stats.set_int(MPX() .. "ORBITAL_CANNON_COOLDOWN", 0)
end)

SelfTab:add_sameline()

SelfTab:add_button("Refill Nightclub Popularity", function()
	stats.set_int(MPX() .. "CLUB_POPULARITY", 1000)
end)

SelfTab:add_sameline()

ReTrEr = SelfTab:add_checkbox("Remove Transaction Error")
script.register_looped("RemoveTransactionError", function(script)
	if RemoveTransactionError then
		globals.set_int(4538671, 0)
		globals.set_int(4538672, 0)
		globals.set_int(4538673, 0)
	end
end)


SelfTab:add_text("Bad Sport!")

BadSportCombo = 0
SelfTab:add_imgui(function()
	ImGui.PushItemWidth(140)
	BadSportCombo = ImGui.Combo("##BadSport", BadSportCombo, { "Remove", "Add" }, 2)
end)

local function BadSport(State, Overall, Bool)
	script.run_in_fiber(function(script)
		gui.show_message("Bad Sport!", "Awaiting Session Change")
		script:sleep(1000)
		stats.set_int("MPPLY_BADSPORT_MESSAGE", State)
		stats.set_int("MPPLY_BADSPORT_MESSAGE", State)
		stats.set_float("MPPLY_OVERALL_BADSPORT", Overall)
		stats.set_bool("MPPLY_CHAR_IS_BADSPORT", Bool)
		globals.set_int(CSg1, 11)
		globals.set_int(CSg2, 1)
		script:sleep(300)
		globals.set_int(CSg2, 0)
	end)
end

SelfTab:add_sameline()

SelfTab:add_button("Execute", function()
	if BadSportCombo == 0 then
		BadSport(0, 0, false)
	else
		BadSport(1, 3000, true)
	end
end)
end
