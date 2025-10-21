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
    config = { extra = { mult = 10, xmult = 2, suit = "hearts" }, },
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
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return {
                message = "Smort",
                xmult = card.ability.extra.xmult
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
                message = "Ag"
            }
        end
    end
}