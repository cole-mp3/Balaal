-- alias i will fucking kill you
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
    config = { extra = { xmult = 4,every = 5, loyalty_remaining = 6 } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                -- in order to balance it and beccause i cant think of any other way to do this.
                -- Thanks to THE GOAT n' for
                card.ability.extra.every + 1,
                localize { type = 'variable', key = (card.ability.extra.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { card.ability.extra.loyalty_remaining } }
        }
    }
    end,
   calculate = function(self, card, context)
    if context.setting_blind  then
        card.ability.extra.loyalty_remaining = card.ability.extra.loyalty_remaining - 1
        message = "Charging..." 
        if card.ability.extra.loyalty_remaining = 0 then
            return {
                message = "ready!",
                colour = G.C.RED,
            }
        end
    end    
    if context.joker_main and card.ability.extra.loyalty_remaining == 0 then
        return {
            message = "Particles Dispersed!",
            xmult = card.ability.extra.xmult,
            eemult = 20,
            card.ability.extra.loyalty_remaining = 5
        }
    end
    if context.joker_main and card.ability.extra.loyalty_remaining == card.ability.extra.every then
        return {
            message = "(still) Charging...",
            xmult = card.ability.extra.xmult,
        }
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
   
    config = { extra = { xmult_gain = 50, xmult = 5 } },
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
-- for the hangar card
SMODS.ObjectType ({
    key = "mobilesuit",
    default = "j_ice_cream",
    cards = {
        j_jabong_drei = true,
        j_jabong_Aerial = true,
    },
})