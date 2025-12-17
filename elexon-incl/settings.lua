
--[[ this is an example]]
return function(SettingsMenu) -- settingsmenu is the parent menu for Settings
    if not SettingsMenu then
        log.error("SettingsMenu is nil in rp")
        return
    end

    
----------------------------------------------------------------------
------[[ Settings Section ]]------------------------------------------
----------------------------------------------------------------------
local function open_url(url)
    if chronix and chronix.open_url then
        -- Chronix
        chronix.open_url(url)
    elseif gui and gui.open_url then
        -- YimMenu
        gui.open_url(url)
    else
        log.debug("No supported open_url API found")
    end
end




SettingsMenu:add_text("Info for Testers:")
SettingsMenu:add_separator()
SettingsMenu:add_text("If bugs or issues occur either open a issue report on GitHub")
SettingsMenu:add_separator()
SettingsMenu:add_text("https://github.com/YimMenu-Lua/Elexon")
SettingsMenu:add_separator()
SettingsMenu:add_text("Or Join the Elexon Discord server to Report an issue and stay up to date on updates, news and future projects;)")
SettingsMenu:add_separator()
SettingsMenu:add_text("https://discord.gg/ZT5GbNtZZb")



----------------------------------------------------------------------
------[[ Credits Section (implemented into settings tab) ]]-----------
----------------------------------------------------------------------

ilovecredits = SettingsMenu:add_tab("Credits <3")

    TCC = ilovecredits:add_tab("TCT - TheCookieTho")
    TCC:add_text("Elexon Main Developer, Script Writer & Tester")
    TCC:add_text("Reach out to me on Discord @njdergeilomat")

    Rrocas = ilovecredits:add_tab("Rrocas")
    Rrocas:add_text("Elexons first Tester")
    

    SpecialThanks = ilovecredits:add_tab("Special Thanks To:")
    SpecialThanks:add_separator()
    SpecialThanks:add_text("INTRXDUCE - For script base(UTHENSIA)")
    SpecialThanks:add_separator()
    SpecialThanks:add_text("For script base(UTHENSIA)")
    SpecialThanks:add_separator()
    SpecialThanks:add_text("ShinyWasabi")
    SpecialThanks:add_separator()
    SpecialThanks:add_text("For Claiming Vehicle as PV script")
    SpecialThanks:add_separator()
    SpecialThanks:add_text("YimMura & YimMenu Collaborators")
    SpecialThanks:add_separator()
    SpecialThanks:add_text("For YimMenu API")
    SpecialThanks:add_separator()
    SpecialThanks:add_text("All internet people helping with testing & ideas <3")

end