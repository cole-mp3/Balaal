-- alias i will fucking kill you

--the below is commented cuz im not sure if it works or not an i refuse to gamble
--[[
SMODS.Sound ({
    vol = 0.6,
    pitch = 1,
    key = "music_vigilante",
    path = "music_vigilante.ogg",
    select_music_track = function()
    if G.jokers then
        if next(SMODS.find_card("j_jabong_gundx")) then
                return true
        end
    end
end
})
    ]]
SMODS.Rarity {
    key = "Max",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.00,
    badge_colour = HEX('00008B'),
    loc_txt = {
        name = "MAXIMIZED"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
SMODS.Atlas{
  key = 'gojo',
  path = "Jonklers/gojo.png",
  px = 142,
  py = 190
}
SMODS.Joker {
  key = 'gojoker',
  atlas = 'gojo',
  pos = {x = 0, y = 0},
  rarity = 'jabong_Max',
  loc_txt ={
    name = "Gojoker",
    text = {
        "{C:inactive}idk lol.{}",
        "{C:inactive}also the pixel art is based off of a render{}",
        "{C:inacitve}from i think the jjk game im not sure.{}"
    },
  },
  blueprint_compat = true,
  cost = 4,
  discovered = true,
  config = { extra = { mult = 10 }, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
    return {
    message = "I cant think of an effect",
    mult = card.ability.extra.mult,
    emult = 10,
  }
    end
  end
}
SMODS.Atlas {
    key = "soulb",
    path = "Jonklers/soulb.png",
    px = 71,
    py = 95
}
SMODS.Joker {
  key = 'soulbottle',
  atlas = 'soulb',
  pos = {x = 0, y = 0},
  rarity = 'jabong_Max',
  blueprint_compat = true,
  cost = 25,
  discovered = true,
  config = { extra = {creates = 2}, },
    loc_vars = function(self, info_queue, card)
    return { vars = {  card.ability.extra.creates } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local jokers_to_create = math.min(card.ability.extra.creates,
                G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            set = 'Joker', legendary = true,
                            edition = "e_negative" 
                        }
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
        if context.joker_main then
            message = "no effect, stupid!"
        end
        

    end,
 
}
local smods_showman_ref = SMODS.showman
    function SMODS.showman(card_key)
    if next(SMODS.find_card('j_jabong_soulbottle')) then
        return true
    end
    return smods_showman_ref(card_key)
    end
SMODS.Atlas {
    key = "throne",
    path = "Jonklers/drei.png",
    px = 142,
    py = 190
}
SMODS.Joker {
    key = "drei",
    atlas = 'throne',
    pos = {x = 0, y = 0},
    rarity = 'jabong_Max',
    blueprint_compat = true,
    cost = 25,
    discovered = true,
    -- stolen code cuz im an idiot and cant code YAY
    config = { extra = { Xmult = 4, every = 3, loyalty_remaining = 3 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_ms_comment', set = 'Other' }
        return {

            vars = {
                card.ability.extra.Xmult,
                card.ability.extra.every + 1,
                localize { type = 'variable', key = (card.ability.extra.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { card.ability.extra.loyalty_remaining } }
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.loyalty_remaining = (card.ability.extra.every - 1 - (G.GAME.hands_played - card.ability.hands_played_at_create)) %
                (card.ability.extra.every + 1)
            if not context.blueprint then
                if card.ability.extra.loyalty_remaining == 0 then
                    local eval = function(card) return card.ability.extra.loyalty_remaining == 0 and not G.RESET_JIGGLES end
                    juice_card_until(card, eval, true)
                end
            end
            if card.ability.extra.loyalty_remaining == card.ability.extra.every then
                return {
                    xmult = card.ability.extra.Xmult,
                    eemult = 20,
                    message = "Dispersed!"
                }
            else
                return{
                    xmult = card.ability.extra.Xmult
                }
                    
            end
        end
        
    end
}
SMODS.Atlas {
    key = "gund",
    path = "Jonklers/oomfie.png",
    px = 142,
    py = 190 
}
-- space oomfie
SMODS.Joker {
    key = "Aerial",
    atlas = 'gund',
    pos = {x = 0, y = 0},
    rarity = 'jabong_Max',
    blueprint_compat = true,
    cost = 15,
    discovered = true,
   
    config = { extra = { Emult_mod = 5, Emult = 5 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_ms_comment', set = 'Other' }
        return {
            vars = {
                card.ability.extra.Emult,
                card.ability.extra.Emult_mod,
        }
    }
    end,
    calculate = function(self, card, context) 
        if context.joker_main then
            return {
               
                emult = card.ability.extra.Emult,
            }
        end
        if SMODS.last_hand_oneshot and context.end_of_round and context.main_eval and context.game_over == false then
            card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_mod
           return{ message = "Upgrade!", colour = G.C.RED}
           
        end
    end
}
-- gundam X
SMODS.Atlas {
    key = "doublex",
    path = "Jonklers/x.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "gundx",
    atlas = 'doublex',
    pos = {x = 0, y = 0},
    rarity = 'jabong_Max',
    blueprint_compat = true,
    cost = 15,
    discovered = true,
   
    config = { extra = { xchips_gain = 2, xchips = 2 } },

    loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = { key = 'hc_ms_comment', set = 'Other' }
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.xchips_gain,
        }
    }
    end,
    calculate = function(self, card, context) 
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
           card.ability.extra.xchips = card.ability.extra.xchips * card.ability.extra.xchips_gain
            return {
              
             message = "Upgrade!"
            }
        end
        if context.joker_main then
            return {
               
                xchips = card.ability.extra.xchips,
            }
        end
        
    end
}
SMODS.Joker {
    key = "thegober",
    atlas = "sccre",
    pos = { x = 0, y = 0},
     rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    loc_txt = {
        name = "{C:chips,s:1.1}Astro{} (from the {C:dark_edition}balatro discord{})",
        text = {
            "Every scored card/joker gives {C:red}+#1#{} Mult"
        }
    },
    config = {extra = {mult = 60}},
    loc_vars = function (self, info_queue, card)
        return {
            card.ability.extra.mult
        }
    end,
    calculate = function (self, card, context)
         if context.other_joker then
            return {
                mult = card.ability.extra.mult,
                message_card = context.other_joker
            }
        end
        if context.individual and context.cardarea == G.play then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end
}
-- for the hangar card
SMODS.ObjectType ({
    key = "mobilesuit",
    default = "j_ice_cream",
    cards = {

        j_jabong_drei = true,
        j_jabong_Aerial = true,
        j_jabong_gundx = true,
    },
})
SMODS.Joker {
    key = "charisafuckingsimp",
    atlas = "sccre",
    rarity = 'jabong_Max',
    pos = { x = 0, y = 0 },                        --⌄ using Emult as the variable for simplicity and cuz im not sure abt EEmult adn EEmult_mod
    config = {extra = {repetitions = 1, creates = 2, Emult = 1.02, Emult_mod = 0.01}}
    loc_vars = function(self, info_queue, card)
        return {
            colours = {
                    HEX("9acd32"), -- color text (hopefully) formatted as {V:1}
                },
        card.ability.extra.repetitions
        card.ability.extra.creates
        card.ability.extra.Emult
        card.ability.extra.Emult_mod
            }
    end,
        
    loc_txt = {
        name = "{s:1.1,C:green,E:2}BEYOND THE TIME{} {B:1,C:white,s:0.8}(Axis Shock){}",
        text = {
            "Creates {C:attention}#2#{} consumables on blind selection.",
            "All Jokers are retriggered {C:attention}#1#{} time",
            "and give {X:inactive,C:white}^^#3#{} mult.",
            "Increases by {X:inactive,C:white}^^#4#{} per consumable used."
        }
    },
        
    calculate = function(self, card, context)
        if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.consumables.config.card_limit - (#G.consumeables.cards + G.GAME.consumeable_buffer))
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + cards_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, cards_to_create do
                        SMODS.add_card {
                            set = 'Consumeables', 
                            edition = "e_negative" 
                        }
                        G.GAME.consumeable_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = "Consumables!",
                colour = G.C.BLUE,
            }
        end
        if context.using_consumeable and not context.blueprint then
            card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_mod
            return {
                message = "Upgraded!"
            }
        end
        if context.other_joker then
            return {
                eemult = card.ability.extra.Emult,
                message_card = context.other_joker
            }
        end
        if context.retrigger_joker_check then
            return { repetitions = card.ability.extra.repetitions }
        end
    end

    
}
