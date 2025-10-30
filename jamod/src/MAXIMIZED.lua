-- alias i will fucking kill you

--the below is commented cuz im not sure if it works or not an i refuse to gamble
--[[
SMODS.Sound ({
    vol = 0.6,
    pitch = 0.7,
    key = "womp",
    path = "music_vigilante.ogg",
    if G.jokers then
        if next(SMODS.find_card("j_jabong_gundx")) then
            select_music_track(self) 
                return (150)
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
SMODS.Joker {
  key = 'soulbottle',
  atlas = 'sccre',
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
   
    config = { extra = { xmult_gain = 5, xmult = 5 } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain,
        }
    }
    end,
    calculate = function(self, card, context) 
        if context.joker_main then
            return {
               
                xmult = card.ability.extra.xmult,
            }
        end
        if SMODS.last_hand_oneshot then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
             message = "Upgrade!"
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
