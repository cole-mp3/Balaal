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
  rarity = 3,
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