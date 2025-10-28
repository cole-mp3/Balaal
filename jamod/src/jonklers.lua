-- THIS IS THE PLACEHOLDER ATLAS!!!!!!!!!!!!!!!!!!!!
SMODS.Atlas {
key = "Jatlas",
path = "Jonklers/jatlas.png",
px = 70,
py = 94
}
SMODS.Atlas {
    key = "hatlas",
    path = "Jonklers/hatlas.png",
    px = 71,
    py = 95
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
atlas = "hatlas",
pos = { x = 1, y = 1 },
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
}
end
end
}
SMODS.Joker {
key = "sock",
atlas = "Jatlas",
pos = { x = 0, y = 1 },
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
    config = { extra = {chips = 0, xmult = 1, chip_mod = 8,  xmult_gain = 0.1 }, },
    loc_txt = {
        name = 'Weenic',
        text = {
            "This card gains {C:blue}+8{} Chips for every scored card",
            "with a rank below a 6, and gains {X:red,C:white}X0.1{} Mult per card",
            "scored that has a rank above 6.",
            "{C:deactivated}(Currently{} {C:blue}X#1#{} and {C:red}+#1#{}{C:deactivated}.){} "
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
    key = "zam", -- DAMN!!!!!!1!!
    atlas = 'bigzamn',
    pos = {x = 0, y = 0},
    rarity = 4,
    blueprint_compat = true,
    cost = 10,
    discovered = true,
    config = { extra = {chip_mod = 150, xmult_gain = 2, chips = 0, xmult = 1,  dollars = 10 }, },
    loc_txt = {
        name = 'Big Zam',
        text = {
            "This card gains {C:blue}+#1#{} Chips and {X:red,C:white}X#1#{} Mult for every scored card.",
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
    --im losing my mind the more  i make this mod'
    -- is this a curse?
}
-- alias hurry up and make the damn sprite bro its not that hard
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
    },
    in_pool = function(self, args)
    return false
end,
}
SMODS.Joker {
    key = "Oracle",
    atlas = 'Orcl',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
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
                            edition = 'e_negative' 
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
SMODS.Atlas {
    key = "Orcl",
    path = "Jonklers/Oracle.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "teamfort",
    path = "Jonklers/intel.png",
    px = 71,
    py = 95
}
SMODS.Joker {
  key = 'intelligence',
atlas = 'teamfort',
pos = {x = 0, y = 0},
rarity = 4,
blueprint_compat = true,
cost = 20, 
discovered = true,
config = { extra = {xmult = 100,}, },
loc_vars = function(self, info_queue, card)
return { vars = { card.ability.extra.xmult } }
end,
calculate = function(self, card, context)
    if context.joker_main then
        return {
            message = "Briefcase!",
            xmult = card.ability.extra.xmult,
            emult = 100,
        }
    end

end

}

SMODS.Atlas {
    key = 'rocks',
    path = "Jonklers/rockbs.png",
    px = 71,
    py = 95
}
--doesnt work
SMODS.Joker {
    key = "rockandbuskin",
    unlocked = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'rocks',
    pos = { x = 0, y = 0 },
    config = { extra = { repetitions = 1 } },
    calculate = function(self, card, context)
  
        if context.repetition and context.cardarea == G.play then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end,
}

-- welspring
SMODS.Joker {
    key = "Wellspring",
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = "Wellspring",
        text = {
            "{C:attention}All{} numbered cards in your scoring hand ",
            "are made gay-I mean {X:edtition,C:black}Polychrome{}."
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local numbers = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if not scored_card:is_face() then
                    numbers = numbers + 1
                    scored_card:set_ability('e_polychrome', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if numbers > 0 then
                return {
                    message = "C H R O M E"
                    colour = G.C.MONEY
                }
            end
        end
    end
}
