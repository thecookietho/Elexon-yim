-- self_menu.lua

local function MPX()
    local char = stats.get_int("MPPLY_LAST_MP_CHAR")
    return "MP" .. char .. "_"
end

return function(SelfTab)
    SelfTab:add_separator()
    SelfTab:add_button("Max Armour & Snacks", function()

        -- Snacks
        local snacks = {
            "NO_BOUGHT_YUM_SNACKS",
            "NO_BOUGHT_HEALTH_SNACKS",
            "NO_BOUGHT_EPIC_SNACKS",
            "NO_BOUGHT_MEGALODON_SNACKS",
            "NO_BOUGHT_PSYCHO_SNACKS"
        }

        for _, snack in ipairs(snacks) do
            stats.set_int(MPX() .. snack, 1000)
        end

        -- Armour
        local armours = {
            "MP_CHAR_ARMOUR_1",
            "MP_CHAR_ARMOUR_2",
            "MP_CHAR_ARMOUR_3",
            "MP_CHAR_ARMOUR_4",
            "MP_CHAR_ARMOUR_5"
        }

        for _, armour in ipairs(armours) do
            stats.set_int(MPX() .. armour, 1000)
        end

        gui.show_message("Self Menu", "Max Snacks & Armour applied")
    end)
end
