SMODS.Sound({
    vol = 0.6,
    pitch = 0.7,
    key = "sawanomusic",
    path = "vigilante.ogg",
    select_music_track = function()
         if jokerExists("j_jabong_everyman") or if jokerExists("j_jabong_banshee") then
          return true end
    end,
  })
 --I DO want to put the above in game, but i have to mmake a config and credits tab first
 --cuz its prolly copyrighted and I dont want problems.
 --this would play when you get a maximized joker(I have to figure that out so for now only everyman can) 
 -- and theres no custom music(unless anyone wants to make music for it)
--  A: ^why not do the warning screen for copyrighted songs like Cryptid does?
--       ^ No, cuz just a screen won't do. you'd need a disable option. so config comes first.
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
    default_weight = 0.00,
    badge_colour = HEX('00008B'),
    loc_txt = {
        name = "MAXIMIZED"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
SMODS.Joker {
  key = "everyman",
  --this card's getting its own atlas just gimme a sec
  atlas = "Jatlas",
    pos = { x = 1, y = 0 },
    blueprint_compat = true,
     cost = 50,
    discovered = true,
    rarity = "jabong_Max",
    loc_txt = {
      name = "EVERYMAN",
      text = {
        "Applies an {C:attention}All Seal{} to",
        "All played cards. Retriggers cards with any seal.",
        "Also turns all cards Negative."
      }
    },
    config = { extra = {repetitions = 1}},
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
SMODS.Joker {
  key = 'banshee',
  atlas = "Jatlas",
    pos = { x = 1, y = 1 },
    blueprint_compat = true,
     cost = 50,
    discovered = true,
    rarity = "jabong_Max",
    config = {extra = {Emult = 1, Emult_mod = 1}},
    loc_vars = function(self, info_queue, card)
      return {vars = card.ability.extra.Emult, card.ability.extra.Emult_mod}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then

            card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_mod

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                message_card = card
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.Emult
            }
        end
    end,
}