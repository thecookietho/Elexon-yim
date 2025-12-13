--- KD Editor section


    KDS = ScriptMainMenu:add_tab("KD Editor")

    TypeKd = KDS:add_tab("Custom KD")
    TypeKd:add_text("Set your KD to:")
    
    KdValue = TypeKd:add_input_float("Set your KD")
    
    TypeKd:add_button("Set KD", function()
        local kd = KdValue:get_value()
    
        
        if kd > 0 then
            
            local kills = 1000000 
            local deaths = math.floor(kills / kd)
    
            
            stats.set_int("MPPLY_KILLS_PLAYERS", kills)
            stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
    
            gui.show_message(
                "KD update",
                "Your KD is now set to " .. kd ..
            )
    
        elseif kd == 0 then
            
            local kills = 0
            local deaths = 1000000  
    
            stats.set_int("MPPLY_KILLS_PLAYERS", kills)
            stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
    
            gui.show_message(
                "KD update",
                "Your KD is now set to " .. kd ..
            )
    
        else
            
            local kills = 1000000  
            local deaths = math.floor(kills / kd)  
    
            
            if deaths < 0 then
                deaths = math.abs(deaths)
                kills = math.abs(kills)
            end
    
            stats.set_int("MPPLY_KILLS_PLAYERS", kills)
            stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
            gui.show_message(
                "KD update",
                "Your KD is now set to " .. kd ..
            )

        end

        if kd ~= 0 then
            
            local deaths = 1000000  
            local kills = math.floor(kd * deaths)  
    
            stats.set_int("MPPLY_KILLS_PLAYERS", kills)
            stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
    
         end
    end)

    KillDeathEdit = KDS:add_tab("KILLS/DEATHS EDITOR")  
    
    KillValue = KillDeathEdit:add_input_int("Kills")
    DeathValue = KillDeathEdit:add_input_int("Deaths")
    
    KillDeathEdit:add_button("Set Kills & Deaths", function()
        local kills = KillValue:get_value()
        local deaths = DeathValue:get_value()
        
        stats.set_int("MPPLY_KILLS_PLAYERS", kills)
        stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
        gui.show_message(
                "KD Editor",
                "Your KD is now set to " .. kills .. "/" .. deaths .. 
    )
    end)
    
    FrozenKD = KDS:add_tab("Frozen K/D Editor")
    FrozenKD:add_text("Set your frozen K/D to:")

FrozenKD:add_button("FROZEN CUSTOM K/D", function()
    local kd = KdValue:get_value()
    local base = 100000 -- increase for more "freeze"

    local kills
    local deaths

    if kd == 0 then
        kills = 0
        deaths = base
    else
        kills = math.floor(kd * base)
        deaths = base
    end

    stats.set_int("MPPLY_KILLS_PLAYERS", kills)
    stats.set_int("MPPLY_DEATHS_PLAYER", deaths)

    gui.show_message(
        "KD Change",
        string.format(
            "Frozen \nKD: %.2f\nKills: %d\nDeaths: %d",
            kd,
            kills,
            deaths
        )
    )
end)
