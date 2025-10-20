--[[SMODS.Sound({
    vol = 0.6,
    pitch = 0.7,
    key = "sawanomusic",
    path = "vigilante.ogg",
}) ]]--
 --I DO want to put the above in game, but i have to mmake a config and credits tab first
 --cuz its prolly copyrighted and I dont want problems.
SMODS.ObjectType ({
    key = "maximized",
    default  = "j_jabong_everyman",
    cards ={},
    inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
  }
  )
  SMODS.Rarity {
    key = "Max",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.01,
    badge_colour = HEX('00008B'),
    loc_txt = {
        name = "MAXIMIZED"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
SMODS.Joker {
  key = "everyman"
  --this card's getting its own atlas just gimme a sec
  atlas = "Jatlas",
    pos = { x = 1, y = 0 },
    blueprint_compat = true,
     cost = 4,
    discovered = true,
    rarity = "jabong_Max",
    loc_txt = {
      name = "EVERYMAN"
      text = {
        "Applies an {C:attention}All Seal{} to"
        "All played cards. Retriggers cards with any seal."
        "Also turns all cards Negative."
      }
    }
    config = { extra = {repetitions = 1}}
    loc_vars = function(self, info_queue, card)
      return {vars = self.config.extra.repetitions}
    end,
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
            context.other_card:set_seal("jabong_canofall",true,true)
            context.other_card:set_edition("e_negative",true,true)              
    end
    if context.repetition and context.cardarea == G.play then
     repetitions = card.ability.extra.repetitions    
    end

  end,
}