
local function MPX()
    local char = stats.get_int("MPPLY_LAST_MP_CHAR")
    return "MP" .. char .. "_"
end

return function(recoverymenu)
    if not recoverymenu then
        log.error("recoverymenu is nil in casino_menu.lua")
        return
    end

-- casino chips buy limit
CCBL0 = FMg + 26534
CCBL1 = FMg + 26535
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local cslots = "casino_slots"
slots_random_results_table = 1370
prize_wheel_win_state = 300 
prize_wheel_prize = 14
prize_wheel_prize_state = 45

CasinoServicesMenu:add_button("TP to Casino", function()
        tp_casino(925, 46.5, 81)
    end)


function tp_casino(x, y, z)
    local playerPed = PLAYER.PLAYER_PED_ID()
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(
        playerPed,
        x, y, z,
        false, false, false
    )
end

CasinoServicesMenu:add_text("Casino Chips")
chipsVal = 1800
CasinoServicesMenu:add_imgui(function()
	chipsVal, used = ImGui.SliderInt("Casino Chips Buy Limit", chipsVal, 1800, 2147483647)
	if used then
		globals.set_int(CCBL0, chipsVal)
		globals.set_int(CCBL1, chipsVal)
	end
end)

CasinoServicesMenu:add_button("Bypass Casino Cooldown", function()
	stats.set_int("MPPLY_CASINO_CHIPS_WON_GD", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_WONTIM", 0)
	stats.set_int("MPPLY_CASINO_GMBLNG_GD", 0)
	stats.set_int("MPPLY_CASINO_BAN_TIME", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_PURTIM", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_PUR_GD", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_SOLD", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_SELTIM", 0)
end)

CasinoServicesMenu:add_separator()

CasinoServicesMenu:add_text("Slots")
CasinoServicesMenu:add_separator()
CasinoServicesMenu:add_text("After rigging more twan twice, you might get kicked from the slot machines.")
CasinoServicesMenu:add_text("To fix this, Use the \"Bypass Casino Cooldown\" function.(at your own risk)")
CasinoServicesMenu:add_separator()

CasinoServicesMenu:add_button("Rig Slot Machines", function()
	for i = 3, 196 do
		if i ~= 67 and i ~= 132 then
			locals.set_int(cslots, slots_random_results_table + i, 6)
		end
	end
end)
CasinoServicesMenu:add_sameline()

CasinoServicesMenu:add_button("Lose Slot Machines", function()
	for i = 3, 196 do
		if i ~= 67 and i ~= 132 then
			locals.set_int(cslots, slots_random_results_table + i, 0)
		end
	end
end)


end