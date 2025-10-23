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
               local mult = tonumber(card.ability.extra.mult) or 0
               return { vars = { mult } }
    end,
    calculate = function(self, card, context)
                if context.joker_main then
                    local mult = tonumber(card.ability.extra.mult) or 0
                    return {
                         message = "wow cool this works",
                        mult = mult
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
               local xmult = tonumber(card.ability.extra.Xmult) or 0
               local mult = tonumber(card.ability.extra.mult) or 0
               return { vars = { xmult, mult } }
    end,
    calculate = function(self, card, context)
             if context.individual and context.cardarea == G.play and
                    context.other_card:is_suit(card.ability.extra.suit) then
                    local mult = tonumber(card.ability.extra.mult) or 0
                    return {
                        mult = mult
                    }
                end
                if context.joker_main and G.GAME.current_round.hands_left >= 0 then
                    local Xmult = tonumber(card.ability.extra.Xmult) or 0
                    return {
                        message = "Smort",
                        Xmult = Xmult
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
               local odds = tonumber(card.ability.extra.odds) or 0
               local numerator, denominator = SMODS.get_probability_vars(card, 1, odds, 'vremade_space')
               numerator = tonumber(numerator) or 0
               denominator = tonumber(denominator) or 1
               return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
                if context.repetition and context.cardarea == G.play and context.other_card:is_face() and SMODS.pseudorandom_probability(card, 'jabong_buskin', 1, tonumber(card.ability.extra.odds) or 0) then
                    local repetitions = tonumber(card.ability.extra.repetitions) or 0
                    return {
                        message = "ain!",
                        repetitions = repetitions,
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
               local odds = tonumber(card.ability.extra.odds) or 0
               local numerator, denominator = SMODS.get_probability_vars(card, 1, odds, 'vremade_space')
               numerator = tonumber(numerator) or 0
               denominator = tonumber(denominator) or 1
               return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
                if context.repetition and context.cardarea == G.play and not context.other_card:is_face() and SMODS.pseudorandom_probability(card, 'jabong_sock', 1, tonumber(card.ability.extra.odds) or 0) then
                    local repetitions = tonumber(card.ability.extra.repetitions) or 0
                    return {
                        repetitions = repetitions,
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
            "with a rank below a 6, and gains {X:red,C:white}X#1#{} Mult per card",
            "scored that has a rank above 6.",
            "{C:deactivated}(Currently{} {C:red}X#1#{} and {C:blue}+#1#{}{C:deactivated}.){} "
        },
    },
    loc_vars = function(self, info_queue, card)
               local chips = tonumber(card.ability.extra.chips) or 0
               local chip_mod = tonumber(card.ability.extra.chip_mod) or 0
               local xmult = tonumber(card.ability.extra.xmult) or 0
               local xmult_gain = tonumber(card.ability.extra.xmult_gain) or 0
               return { vars = { chips, chip_mod, xmult, xmult_gain } }
    end,
    calculate = function(self, card, context)
                if context.individual and context.cardarea == G.play and context.other_card:get_id() <= 6 and not context.blueprint then
                    card.ability.extra.chips = (tonumber(card.ability.extra.chips) or 0) + (tonumber(card.ability.extra.chip_mod) or 0)
                    card.ability.extra.chips = tonumber(card.ability.extra.chips) or 0
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS,
                        message_card = card
                    }
                end
                if context.individual and context.cardarea == G.play and context.other_card:get_id() >= 6 and not context.blueprint then
                    card.ability.extra.xmult = (tonumber(card.ability.extra.xmult) or 0) + (tonumber(card.ability.extra.xmult_gain) or 0)
                    card.ability.extra.xmult = tonumber(card.ability.extra.xmult) or 0
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.RED,
                        message_card = card
                    }
                end
                if context.joker_main then
                    local chips = tonumber(card.ability.extra.chips) or 0
                    local xmult = tonumber(card.ability.extra.xmult) or 0
                    return {
                        chips = chips,
                        xmult = xmult
                    }
                end
    end,
}