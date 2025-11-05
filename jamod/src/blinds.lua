SMODS.Atlas {
    key = 'blatlas',
    path = "blatlas.png",
    px = 34,
    py = 34,
    atlas_table = 'ANIMATION_ATLAS',
    frames = 1
}
SMODS.Blind {
    key = "spoop",
    dollars = 5,
    mult = 2,
    atlas = "blatlas",
    pos = { y = 0 },
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
     key = "arbys",
    dollars = 5,
    mult = 2,
    atlas = "blatlas",
    pos = { y = 1 },
    boss = { min = 4 },
    boss_colour = HEX("d91920"),
    loc_txt = {
        name = "Arby's",
        text = {
            "Every enchanced card scored will",
            "increase this blind's requirements."
        },
    },
    
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.press_play then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        for i = 1, #G.play.cards do
                            local has_enhancement = next(SMODS.get_enhancements(card))
                            if not has_enhancement == nil then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.play.cards[i]:juice_up()
                                    return true
                                end,
                            }))
                            G.GAME.blind.chips = math.floor(G.GAME.blind.chips + G.GAME.blind.chips * 0.25)
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            delay(0.23)
                        end
                        return true
                    end
                }))
                blind.triggered = true 
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = (function()
                        SMODS.juice_up_blind()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.06 * G.SETTINGS.GAMESPEED,
                            blockable = false,
                            blocking = false,
                            func = function()
                                play_sound('tarot2', 0.76, 0.4)
                                return true
                            end
                        }))
                        play_sound('tarot2', 1, 0.4)
                        return true
                    end)
                }))
                delay(0.4)
            end
        end
    end
 end,
   
}
--[[TO DO FOR THIS BLIND:
    - Make cool hand
    - have hand be gimmick
    - gimmick is: hand doesnt score unless you have a card of a randomly chosen suit in your hand.
        changes every 30 seconds.
    -PICKS FROM YOUR DECK (im looking a you ancient joker)
]]
--[[SMODS.Blind {
    key = 'witness',
    dollars = 7,
    mult = 2,
    pos = { x = 0, y = 28 },
    boss = { showdown = true,},
    boss_colour = HEX("f7e948"),
    loc_txt = {
        name = "The Witness",
        text = {
            "Hand will not score unless you have",
            "a card with the suit #1# " --the #1# is used for the suit variable
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
}]]--
-- TO DO FOR THIS BLIND:
-- Make a UIBox similar to cryptid's old version pointer
-- Make it ask a question when a hand is played.
-- If youre wrong, reduces levels of ALL HANDS by 1.
-- and a special interaction on a very specific question.
--[[
SMODS.Blind {
    key = 'quizzer',
    dollars = 3,
    mult = 3,
    pos = { x = 0, y = 1 },
    boss = { min = 2,},
    boss_colour = HEX("f7e948"),
    loc_txt = {
        name = "The Quiz",
        text = {
            " 'ill code this in later.' ",
            "           -jabon gratis"

        },
    },

}
    ]]--
    
-- a few references for contexts/other shit:
-- -----------------------------------------
--G.GAME.blind.config.blind.boss_colour