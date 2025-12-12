--[[ KD Editor section


    KDS = ScriptMainMenu:add_tab("K/D EDITOR")

    TypeKd = KDS:add_tab("CUSTOM K/D")
    TypeKd:add_text("SET YOUR K/D TO:")
    
    KdValue = TypeKd:add_input_float("SET YOUR K/D")
    
    TypeKd:add_button("SET K/D", function()
        local kd = KdValue:get_value()
    
        -- K/D'nin sıfırdan büyük, sıfır veya sıfırdan küçük olabileceğini göz önünde bulunduruyoruz
        if kd > 0 then
            -- Sabit bir Kills değeri belirliyoruz (örneğin 1000)
            local kills = 1000000  -- Sabit bir Kills sayısı belirliyoruz, istediğiniz değeri değiştirebilirsiniz
            -- Deaths hesaplama (Kills / K/D)
            local deaths = math.floor(kills / kd)
    
            -- Kills ve Deaths değerlerini ayarlıyoruz
            stats.set_int("MPPLY_KILLS_PLAYERS", kills)
            stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
    
            gui.show_message(
                "K/D UPDATE",
                "YOUR K/D IS NOW " .. kd .. " . CHECK YOUR STATS TO BE SURE!"
            )
    
        elseif kd == 0 then
            -- K/D = 0 olduğunda, Kills = 0 ve Deaths > 0 kabul ediyoruz
            local kills = 0
            local deaths = 1000000  -- Sabit bir Deaths değeri belirliyoruz, örneğin 1000
    
            stats.set_int("MPPLY_KILLS_PLAYERS", kills)
            stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
    
            gui.show_message(
                "K/D UPDATE",
                "YOUR K/D IS NOW " .. kd .. " . CHECK YOUR STATS TO BE SURE!"
            )
    
        else
            -- Negatif K/D durumunda, hesaplama yapıyoruz
            local kills = 1000000  -- Sabit bir Kills değeri belirliyoruz
            local deaths = math.floor(kills / kd)  -- Deaths hesaplama
    
            -- Negatif K/D durumunda Kills ve Deaths'in pozitif olduğunu sağlıyoruz
            if deaths < 0 then
                deaths = math.abs(deaths)
                kills = math.abs(kills)
            end
    
            stats.set_int("MPPLY_KILLS_PLAYERS", kills)
            stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
            gui.show_message(
                "K/D UPDATE",
                "YOUR K/D IS NOW " .. kd .. " . CHECK YOUR STATS TO BE SURE!"
            )

        end

        if kd ~= 0 then
            -- Varsayılan bir Deaths değeri belirliyoruz (örneğin 10,000)
            local deaths = 1000000  -- Burada sabit bir sayı ile çalışıyoruz, daha esnek hale getirebilirsiniz
            local kills = math.floor(kd * deaths)  -- Kills hesaplanıyor
    
            stats.set_int("MPPLY_KILLS_PLAYERS", kills)
            stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
    
         end
    end)

    KillDeathEdit = KDS:add_tab("KILLS/DEATHS EDITOR")  
    
    KillValue = KillDeathEdit:add_input_int("SET YOUR KILLS")
    DeathValue = KillDeathEdit:add_input_int("SET YOUR DEATHS")
    
    KillDeathEdit:add_button("SET KILLS AND DEATHS", function()
        local kills = KillValue:get_value()
        local deaths = DeathValue:get_value()
        
        stats.set_int("MPPLY_KILLS_PLAYERS", kills)
        stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
        gui.show_message(
                "KILLS/DEATHS EDITOR",
                "YOUR KILLS/DEATHS IS NOW SET TO " .. kills .. "/" .. deaths .. ", CHECK YOUR STATS TO BE SURE!"
    )
    end)
    
OneKd = KDS:add_tab("ONE CLICK K/Ds")

PLUS = OneKd:add_tab("PLUS K/D")

PLUS:add_text("SET YOUR K/D TO:")

    PLUS:add_button("FROZEN 1 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 100000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 100000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 1.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 10 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 100000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 10000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 10.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 25 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 250000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 10000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 25.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 50 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 500000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 10000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 50.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 69 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 690000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 10000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 69.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 100 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 100000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 100.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 250 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 250000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 250.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 500 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 500000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 500.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 619 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 619000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 619.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 666 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 666000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 666.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 700 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 700000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 700.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 800 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 800000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 800.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 900 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 900000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 900.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 1000 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 100000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 100000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 1000.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 3131 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 313100000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 100000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 3131.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    PLUS:add_button("FROZEN 6969 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", 696900000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 100000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO 6969.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

-----------------------------------------------------------

MINUS = OneKd:add_tab("MINUS K/D")

MINUS:add_text("SET YOUR K/D TO:")

    MINUS:add_button("FROZEN -1 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -100000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 100000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -1.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    MINUS:add_button("FROZEN -10 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -100000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 10000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -10.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    MINUS:add_button("FROZEN -25 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -250000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 10000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -25.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    MINUS:add_button("FROZEN -50 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -500000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 10000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -50.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    MINUS:add_button("FROZEN -69 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -690000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 10000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -69.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    MINUS:add_button("FROZEN -100 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -100000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -100.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    MINUS:add_button("FROZEN -250 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -250000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -250.00, CHECK YOUR STATS TO BE SURE!"
)
    end)

    MINUS:add_button("FROZEN -500 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -500000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -500.00, CHECK YOUR STATS TO BE SURE"
)
    end)

    MINUS:add_button("FROZEN -619 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -619000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -619.00, CHECK YOUR STATS TO BE SURE"
)
    end)

    MINUS:add_button("FROZEN -666 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -666000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -666.00, CHECK YOUR STATS TO BE SURE"
)
    end)

    MINUS:add_button("FROZEN -700 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -700000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -700.00, CHECK YOUR STATS TO BE SURE"
)
    end)

    MINUS:add_button("FROZEN -800 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -800000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -800.00, CHECK YOUR STATS TO BE SURE"
)
    end)

    MINUS:add_button("FROZEN -900 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -900000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 1000000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -900.00, CHECK YOUR STATS TO BE SURE"
)
    end)

    MINUS:add_button("FROZEN -1000 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -100000000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 100000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -1000.00, CHECK YOUR STATS TO BE SURE"
)
    end)

    MINUS:add_button("FROZEN -3131 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -313100000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 100000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -3131.00, CHECK YOUR STATS TO BE SURE"
)
    end)

    MINUS:add_button("FROZEN -6969 K/D", function()
        stats.set_int("MPPLY_KILLS_PLAYERS", -696900000)
        stats.set_int("MPPLY_DEATHS_PLAYER", 100000)
        gui.show_message(
			"K/D CHANGE",
			"YOUR K/D IS NOW SET TO -6969.00, CHECK YOUR STATS TO BE SURE"
)
    end) --]]