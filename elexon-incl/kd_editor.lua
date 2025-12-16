return function(parent)
    if not parent then
        log.error("KD Editor parent menu is nil")
        return
    end
    -- ===============================
    -- Helper
    -- ===============================
    local function show_kd_message(title, kd, kills, deaths, frozen)
        gui.show_message(
            title,
            string.format(
                "%sKD: %.2f\nKills: %d\nDeaths: %d",
                frozen and "(Frozen)\n" or "",
                kd,
                kills,
                deaths
            )
        )
    end

    -- ======================================================
    -- CUSTOM KD
    -- ======================================================
    parent:add_text("Custom K/D")
    parent:add_separator()

    local custom_kd_input = parent:add_input_float("KD Value")

    parent:add_button("Set Custom KD", function()
        local kd = custom_kd_input:get_value()
        local base = 100000

        local kills, deaths
        if kd <= 0 then
            kills = 0
            deaths = base
        else
            kills = math.floor(kd * base)
            deaths = base
        end

        stats.set_int("MPPLY_KILLS_PLAYERS", kills)
        stats.set_int("MPPLY_DEATHS_PLAYER", deaths)

        show_kd_message("KD Changed", kd, kills, deaths, false)
    end)

    parent:add_separator()

    -- ======================================================
    -- KILLS / DEATHS
    -- ======================================================
    parent:add_text("Kills / Deaths Editor")
    parent:add_separator()

    local kills_input  = parent:add_input_int("Kills")
    local deaths_input = parent:add_input_int("Deaths")

    parent:add_button("Set Kills & Deaths", function()
        local kills  = kills_input:get_value()
        local deaths = math.max(deaths_input:get_value(), 1)

        local kd = kills / deaths

        stats.set_int("MPPLY_KILLS_PLAYERS", kills)
        stats.set_int("MPPLY_DEATHS_PLAYER", deaths)

        show_kd_message("KD Changed", kd, kills, deaths, false)
    end)

    parent:add_separator()

    -- ======================================================
    -- FROZEN KD
    -- ======================================================
    parent:add_text("Frozen K/D")
    parent:add_separator()

    local frozen_kd_input = parent:add_input_float("Frozen KD")

    parent:add_button("Set Frozen KD", function()
        local kd = frozen_kd_input:get_value()
        local base = 100000

        local kills, deaths
        if kd <= 0 then
            kills = 0
            deaths = base
        else
            kills = math.floor(kd * base)
            deaths = base
        end

        stats.set_int("MPPLY_KILLS_PLAYERS", kills)
        stats.set_int("MPPLY_DEATHS_PLAYER", deaths)

        show_kd_message("Frozen KD Set", kd, kills, deaths, true)
    end)
end
