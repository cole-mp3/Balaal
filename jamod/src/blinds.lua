SMODS.Blind {
    key = "spoop",
    dollars = 5,
    mult = 2,
    pos = { x = 0, y = 0 },
    boss = { min = 1 },
    boss_colour = HEX("f7e948"),
    loc_txt = {
        name = "Spoop",
        text = {
            "sea Aweed."
        },
    },
    defeat = function(self)
        if not G.GAME.blind.disabled then
            G.FUNCS.overlay_menu{
                 -- h o n s e
                definition = create_UIBox_custom_video1("spop","please watch to the end. its funny"),
                config = {no_esc = true}
            }
        end
    end
}
--G.GAME.blind.config.blind.boss_colour