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
            "sea Aweed.",
            "(credit to vo memes)"
        },
    },
    defeat = function(self)
        if not G.GAME.blind.disabled then
            G.FUNCS.overlay_menu{
                 -- *laughing* 
                 -- C O M E D Y .
                definition = create_UIBox_custom_video1("spop","please watch to the end. its funny"),
                config = {no_esc = true}
            }
        end
    end
}
SMODS.Blind {
    key = 'witness'
    dollars = 7,
    mult = 2,
    pos = { x = 0, y = 28 },
    boss = { showdown = true,},
    boss_colour = HEX("f7e948"),
    loc_txt = {
        name = "The Witness",
        text = {
            "I have yet to code this in,",
            "So it does nothing*."
        },
    },
    defeat = function(self)
        if not G.GAME.blind.disabled then
            G.FUNCS.overlay_menu{
                 -- placeholder.exe
                definition = create_UIBox_custom_video1("ogre","you go little man"),
                config = {no_esc = true}
            }
        end
    end
}

-- a few references for contexts/other shit:
-- -----------------------------------------
--G.GAME.blind.config.blind.boss_colour