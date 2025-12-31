
--[[ this is an example]]
return function(recoverymenu, NightClub) -- recoverymenu is the parent menu for Money Methods, NightClub is the Nightclub money loop tab
if not recoverymenu or not NightClub then -- check for nil menus
    log.error("money_methods: menus are nil")
    return
end

------------------------------------------------------------------------------
--[[ Nightclub TP Function ]]--
------------------------------------------------------------------------------


-- nightclub locations table
local nightclubs = {
    { name = "La Mesa Nightclub",           coords = vec3:new(757.009, -1332.32, 27) },
    { name = "Mission Row Nightclub",       coords = vec3:new(345.7519, -978.8848, 29) },
    { name = "Strawberry Nightclub",        coords = vec3:new(-120.906, -1260.49, 29) },
    { name = "West Vinewood Nightclub",     coords = vec3:new(5.53709, 221.35, 107) },
    { name = "Cypress Flats Nightclub",     coords = vec3:new(871.47, -2099.57, 30) },
    { name = "LSIA Nightclub",              coords = vec3:new(-675.225, -2459.15, 13) },
    { name = "Elysian Island Nightclub",    coords = vec3:new(195.534, -3168.88, 5) },
    { name = "Downtown Vinewood Nightclub", coords = vec3:new(373.05, 252.13, 102) },
    { name = "Del Perro Nightclub",         coords = vec3:new(-1283.38, -649.916, 26) },
    { name = "Vespucci Canals Nightclub",   coords = vec3:new(-1174.85, -1152.3, 5) },
}

-- Function to get Nightclub Index
function GetNightClubIndex()
    return stats.get_int("MPX_NIGHTCLUB_OWNED")
end

function tpnc()
    if not network.is_session_started() then
        return
    end

    local index = GetNightClubIndex()

    if index == -1 then
        gui.show_message("Nightclub TP", "You do not own a nightclub.")
        return
    end

    local info = nightclubs[index]

    if not info then
        gui.show_message("Nightclub TP", "Unknown nightclub index: " .. index)
        return
    end

    gui.show_message("Nightclub TP", "Teleporting to " .. info.name)

    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(
        PLAYER.PLAYER_PED_ID(),
        info.coords.x,
        info.coords.y,
        info.coords.z,
        false, false, false
    )
end


--[[ Nightclub Money Loop ]]

    SafeAmount = 250000  -- Max nightclub safe amount
    SafeCapacity = 23769 -- NIGHTCLUBMAXSAFEVALUE
    IncomeStart = 23746 -- NIGHTCLUBINCOMEUPTOPOP5
    IncomeEnd = 23765 -- NIGHTCLUBINCOMEUPTOPOP100
    NLCl = 206 + 32 + 19 + 1 -- Local index for triggering nightclub payout in am_mp_nightclub
    
    NCRSCB = NightClub:add_checkbox("Enable Nightclub money loop")
    script.register_looped("nightclubremotelooptest", function(script)
        script:yield()
        if NCRSCB:is_enabled() == true then
            -- Calculate safe value global (adjusted for better accuracy)
           SafeValue = 1845250 + self.get_id() + 260 + 364 + 5
            -- Set income globals to high value for max earnings
            for i = IncomeStart, IncomeEnd do
                globals.set_int(262145 + i, SafeAmount)
            end
            -- Set safe capacity
            globals.set_int(262145 + SafeCapacity, SafeAmount)
            -- Max popularity
            stats.set_int("MPX_CLUB_POPULARITY", 1000)
            -- Reset pay time
            stats.set_int("MPX_CLUB_PAY_TIME_LEFT", -1)
            
            
            -- Set safe value and trigger payout
            globals.set_int(SafeValue, SafeAmount)
            locals.set_int("am_mp_nightclub", NLCl, 1)
            
            -- Clear some globals to prevent issues
            globals.set_int(4516902, 0)
            globals.set_int(4516903, 0)
            globals.set_int(4516904, 0)
            
            script:sleep(2500)  -- 2,5 second delay before next loop seems to work fine
        end
    end)
    
    NightClub:add_separator()

    NightClub:add_button("TP to Nightclub", function()
        tpnc()
    end)

    NightClub:add_sameline()

    NightClub:add_button("TP to Nightclub Safe", function()
        tpnc_safe(-1616, -3016, -75)
    end)


function tpnc_safe(x, y, z)
    local playerPed = PLAYER.PLAYER_PED_ID()
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(
        playerPed,
        x, y, z,
        false, false, false
    )
end



end