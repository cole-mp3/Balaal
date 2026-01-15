local dok = love.draw
function love.draw()
    dok()
    function loadem(fn)
        local full_path = (jamod.path 
        .. "customimages/" .. fn)
        local file_data = assert(NFS.newFileData(full_path),("a"))
        local tempimagedata = assert(love.image.newImageData(file_data),("e"))
        --print ("LTFNI: Successfully loaded " .. fn)
        return (assert(love.graphics.newImage(tempimagedata),("sadsadas")))
        
    end
     local _xscale = love.graphics.getWidth()/1920
    local _yscale = love.graphics.getHeight()/1080

  --if G.quidward and (G.quidward > 0) then
    --    if jamod.squig == nil then jamod.squig = loadem("Squid.jpg") end
      --  love.graphics.setColor(1, 1, 1, 1) 
        --love.graphics.draw(jamod.squig, 0*_xscale*3, 0*_yscale*3,0,_xscale*3*2,_yscale*3*2)
    --end
end



local upd = Game.update
function Game:update(dt)
    upd(self, dt)

    -- tick based events
    if jamod.ticks == nil then jamod.ticks = 0 end
    if jamod.dtcounter == nil then jamod.dtcounter = 0 end
    jamod.dtcounter = jamod.dtcounter+dt
    jamod.dt = dt

    while jamod.dtcounter >= 0.010 do
        jamod.ticks = jamod.ticks + 1
        jamod.dtcounter = jamod.dtcounter - 0.010
        if G.quidward and G.quidward > 0 then G.quidward = G.quidward - 1 
        end

    end
end
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
        name = "The Bob",
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
            "increase this blind's requirements",
            "by a whopping 75% if an",
            "enhanced card is in your played hand."
        },
    },
    
    calculate = function(self, blind, context)
        if not blind.disabled then
                    if context.before then
                    local found = false
                        for _,v in ipairs(G.hand.cards) do
                         if next(SMODS.get_enhancements(v)) then found = true end
                                end
                            if found then
                          G.GAME.blind.chips = math.floor(G.GAME.blind.chips + G.GAME.blind.chips * 0.75)
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
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
SMODS.Blind {
    key = 'odder',
    dollars = 7,
    mult = 2,
    pos = { x = 0, y = 28 },
    boss = {min = 5,},
    boss_colour = HEX("f7e948"),
    loc_txt = {
        name = "The Good(?)",
        text = {
            "Scored cards with Even ranks",
            "do not trigger any effects" 
        },
    },
    defeat = function(self)
        if not G.GAME.blind.disabled then

        end
    end
}
SMODS.Blind {
    key = 'evener',
    dollars = 7,
    mult = 2,
    pos = { x = 0, y = 28 },
    boss = { min = 3},
    boss_colour = HEX("f7e948"),
    loc_txt = {
        name = "The Bad(?)",
        text = {
            "Scored cards with odd ranks",
            "do not trigger jokers." 
        },
    },
    defeat = function(self)
        if not G.GAME.blind.disabled then
            
        end
    end
}
SMODS.Blind {
    key = 'thefuck',
    dollars = 7,
    mult = 2,
    pos = { x = 0, y = 28 },
    boss = { showdown = true,},
    boss_colour = HEX("f7e948"),
    loc_txt = {
        name = "The Ugly",
        text = {
            "Scored cards with ANY MODIFICATION",
            "do not trigger any effects." 
        },
    },
    defeat = function(self)
        if not G.GAME.blind.disabled then
            
        end
    end
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
                definition = create_UIBox_custom_video1("spop","you go little man"),
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