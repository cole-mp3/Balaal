SMODS.Atlas {
key = "Jatlas",
path = "Jonklers/jatlas.png",
    px = 70,
    py = 94
    
}
SMODS.Joker {
     key = "toker ",
     atlas = "Jatlas",
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    discovered = true,
    config = { extra = { mult = 99 }, },
    loc_txt = {
        name = "Test Joker",
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
    config = { extra = { mult = 10, xmult = 2, suit = 'hearts',suit2 = 'spades' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
     if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) or context.other_card:is_suit(card.ability.extra.suit2) then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,

}