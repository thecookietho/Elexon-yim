--[[ Report Checker & Editor ]]

return function(parent)
    if not parent then
        log.error("Report editor parent menu is nil")
        return
    end

    local function add_editable_report(label, stat_key)
        local current = stats.get_int(stat_key)
        parent:add_text(label .. ": " .. current)

        local input = parent:add_input_int("New " .. label)
        input:set_value(current)

        parent:add_button("Edit " .. label, function()
            stats.set_int(stat_key, input:get_value())
            gui.show_message("Edited", label .. " set to " .. input:get_value())
        end)
    end

    add_editable_report("GRIEFING", "MPPLY_GRIEFING")
    add_editable_report("EXPLOITING", "MPPLY_EXPLOITS")
    add_editable_report("ABUSING BUGS", "MPPLY_GAME_EXPLOITS")
    add_editable_report("ANNOYING PEOPLE IN TEXT", "MPPLY_TC_ANNOYINGME")
    add_editable_report("HATE SPEECH IN TEXT", "MPPLY_TC_HATE")
    add_editable_report("ANNOYING PEOPLE IN VOICE", "MPPLY_VC_ANNOYINGME")
    add_editable_report("HATE SPEECH IN VOICE", "MPPLY_VC_HATE")
    add_editable_report("OFFENSIVE LANGUAGE", "MPPLY_OFFENSIVE_LANGUAGE")
    add_editable_report("OFFENSIVE TAGPLATE", "MPPLY_OFFENSIVE_TAGPLATE")
    add_editable_report("OFFENSIVE CONTENT", "MPPLY_OFFENSIVE_UGC")
    add_editable_report("BAD CREW NAME", "MPPLY_BAD_CREW_NAME")
    add_editable_report("BAD CREW MOTTO", "MPPLY_BAD_CREW_MOTTO")
    add_editable_report("BAD CREW STATUS", "MPPLY_BAD_CREW_STATUS")
    add_editable_report("BAD CREW EMBLEM", "MPPLY_BAD_CREW_EMBLEM")

    parent:add_separator()
    parent:add_text("COMMENDS:")
    parent:add_separator()

    add_editable_report("FRIENDLY", "MPPLY_FRIENDLY")
    add_editable_report("HELPFUL", "MPPLY_HELPFUL")
end
