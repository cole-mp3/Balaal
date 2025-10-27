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
    config = { extra = { xmult = 4, } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
        }
    }
    end,
   calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.hands_left == 0  then
        return {
            message = "gn particless :)",
            xmult = card.ability.extra.xmult,
            eemult = 20,
        }
    end
    if context.joker_main and not G.GAME.current_round.hands_left == 0 then
        return {
            message = "Still Charged!",
            xmult = card.ability.extra.xmult,
        }
    end
end 

        
}

SMODS.ObjectType ({
    key = "jabong_mobilesuit",
    default = "j_ice_cream",
    cards = {
        j_jabong_drei = true,
      
    },
})