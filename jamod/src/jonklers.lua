SMODS.Atlas {
key = "Jatlas",
path = "Jonklers/jatlas.png",
px = 70,
py = 94
}

SMODS.ObjectType ({
key = "halfjokes",
default  = "j_joker",
cards = {},
inject = function(self)
SMODS.ObjectType.inject(self)
end,
})
SMODS.Joker {
    key = "tongs",
    atlas = "Jatlas",
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    discovered = true,
    config = { extra = { mult = 99 }, },
    loc_txt = {
    name = "Spamtongs",
    text = {
        "{C:red,s:1.1}+#99#{} Mult",
    },
},
loc_vars = function(self, info_queue, card)
return { vars = { card.ability.extra.mult } }
end,
calculate = function(self, card, context)
if context.joker_main then
return {
message = "wow cool this works",
mult = card.ability.extra.mult
}
end
end
}
SMODS.Atlas{
key = "vejoke",
px = 70,
py = 94,
path = "vegeta/vegeta.png"
}
SMODS.Joker{
key = "vegeta",
atlas = "vejoke",
pos = { x = 0, y = 0 },
rarity =3,
blueprint_compat = true,
cost = 2,
discovered = true,
config = { extra = { mult = 10, Xmult = 2, suit = "Hearts" }, },
loc_vars = function(self, info_queue, card)
return { vars = { card.ability.extra.xmult, card.ability.extra.mult } }
end,
calculate = function(self, card, context)
if context.individual and context.cardarea == G.play and
context.other_card:is_suit(card.ability.extra.suit) then
return {
mult = card.ability.extra.mult
}
end
if context.joker_main and G.GAME.current_round.hands_left >= 0 then
return {
message = "Smort",
Xmult = card.ability.extra.xmult
}
end
end,

}
SMODS.Joker {
key = "buskin",
atlas = "Jatlas",
pos = { x = 1, y = 0 },
rarity = 2,
pools = {["halfjokes"] = true},
blueprint_compat = true,
cost = 4,
discovered = true,
config = { extra = { odds = 2, repetitions = 1}, },
loc_txt = {
name = "Buskin",
text = {
"{C:green,s:1.1} #1# in #2#{} chance to ",
"{C:attention}Retrigger{} all face cards once."
},
},
loc_vars = function(self, info_queue, card)
local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'vremade_space')
return { vars = { numerator, denominator } }
end,
calculate = function(self, card, context)
if context.repetition and context.cardarea == G.play and context.other_card:is_face() and SMODS.pseudorandom_probability(card, 'jabong_buskin', 1, card.ability.extra.odds) then
return {
message = "ain!",
repetitions = card.ability.extra.repetitions,
sound = 'jabong_damn'
}
end
end
}
SMODS.Joker {
key = "sock",
atlas = "Jatlas",
pos = { x = 1, y = 0 },
rarity = 2,
pools = {["halfjokes"] = true},
blueprint_compat = true,
cost = 4,
discovered = true,
config = { extra = { odds = 2, repetitions = 1 }, },
loc_txt = {
name = "Sock",
text = {
"{C:green,s:1.1} #1# in #2#{} chance to ",
"{C:attention}Retrigger{} all numbered cards once."
},
},
loc_vars = function(self, info_queue, card)
local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'vremade_space')
return { vars = { numerator, denominator } }
end,
calculate = function(self, card, context)
if context.repetition and context.cardarea == G.play and not context.other_card:is_face() and SMODS.pseudorandom_probability(card, 'jabong_sock', 1, card.ability.extra.odds) then
return {
repetitions = card.ability.extra.repetitions,
message = "Ag",
sound = 'jabong_oh'
}
end
end
}
SMODS.Atlas {
    key = 'lildude',
    path = 'Jonklers/weenic.png',
    px = 71,
    py  = 95
}
SMODS.Joker{
    key = "weenic",
    atlas = 'lildude',
    pos = {x = 0, y = 0},
    rarity = 3,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = {chips = 0, chip_mod = 8, xmult = 1, xmult_gain = 0.1 }, },
    loc_txt = {
        name = 'Weenic',
        text = {
            "This card gains {C:blue}+#1#{} Chips for every scored card",
            "with a rank below a 6, and gains {X:red, C:white}X#1#{} Mult per card",
            "scored that has a rank above 6.",
            "{C:deactivated}(Currently{} {C:red}X#1#{} and {C:blue}+#1#{}{C:deactivated}.){} "
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod, card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() <= 6 and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                message_card = card
            }
        end
        if context.individual and context.cardarea == G.play and context.other_card:get_id() >= 6 and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED,
                message_card = card
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                xmult = card.ability.extra.xmult
            }
        end
    end,
}
SMODS.Atlas{
    key = 'bigzamn',
    path = "Jonklers/zam.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "zam",
    atlas = 'bigzamn',
    pos = {x = 0, y = 0},
    rarity = 4,
    blueprint_compat = true,
    cost = 10,
    discovered = true,
    config = { extra = {chips = 0, chip_mod = 150, xmult = 1, xmult_gain = 2, dollars = 10 }, },
    loc_txt = {
        name = 'Big Zam',
        text = {
            "This card gains {C:blue}+#1#{} Chips and {X:red, C:white}X#1#{} Mult for every scored card.",
            "Played cards give {C:money}$10{} when  scored.",
            "{C:deactivated}(Currently{} {C:red}X#1#{} and {C:blue}+#1#{}{C:deactivated}.){} "
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod, card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.ENHANCEMENT,
                dollars = card.ability.extra.dollars,
                message_card = card
                
            }
            
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                xmult = card.ability.extra.xmult
            }
        end
    end,
}
SMODS.Joker{
    key = "vexcube",
    atlas = "Jatlas",
    pos = {x = 3, y = 1},
    rarity = 1,
    blueprint_compat = false,
    cost = 1,
    discovered = true,
    loc_txt = {
        Name = "Vex Cube",
        text = {
            "{C:deactivated}Does Nothing.{}"
        }
    }
}
SMODS.Joker {
    key = "Oracle",
    atlas = 'Jatlas',
    pos = {x = 2, y = 1},
    rarity = 3,
    blueprint_compat = true,
    cost = 10,
    discovered = true,
    loc_txt = {
        name = "Oracle",
        text = {
            "Creates 2 {C:attention}Vex Cube{} jokers on blind selection.",
            "This card gains {X:red,C:white}X#1#{} mult per vex cube sold.",
            "{C:deactivated}Currently{}{X:red,C:white}X#1#{}{C:deactivated}.{}",
        }
    },
    config = { extra = {creates = 2, xmult = 1, xmult_gain = 1 }, },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain, card.ability.extra.creates } }
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
                            key = "j_jabong_vexcube",
                            edition = negative 
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
        if context.selling_card and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.ENHANCEMENT,
                message_card = card
                
            }
        end
        if context.joker_main then
        xmult = card.ability.extra.xmult
        end
    end,
   
}
SMODS.Atlas {
    key = "sccre",
    path = "Jonklers/scre.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "screaming",
    atlas = 'sccre',
    pos = {x = 2, y = 1},
    rarity = 4,
    blueprint_compat = false,
    cost = 4,
    discovered = true,
    loc_txt = {
        name = "*screaming*",
        text = {
            "All cards are considered 2s.",
            "{C:deactivated}It wouldve been aces but funny.{}"
        }
    }
}
local scree_ref = Card.get_id
		override_screaming = false
		function Card:get_id()
			local id = scree_ref(self)
			if id == nil then
				id = 2
			end
			if next(find_joker("j_jabong_screaming")) and not override_screaming then
				if id >= nil  then
					id = 2
			end
        end
    end
		