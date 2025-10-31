SMODS.Atlas {
    key = 'coplas',
    path = 'coppere.png',
    px = 71,
    py = 95
}
SMODS.Enhancement {
    key = "ruband",
    atlas = "coplas", --p l a c e h o l d e r
    config = {repetitions = 2, xmult = 2.1}
    loc_vars = function(self, info_queue, card)             -- ⌄i fixed it but why on earth was this also xmult
        return { vars = { card.ability.repetitions, card.ability.xmult } }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            return{
                repetitions = card.ability.repetitions
                xmult = card.ability.xmult
            }
        end
    end,
}
SMODS.Enhancement {
    key = 'copper',
    atlas = 'coplas', --there its done
    pos = { x = 0, y = 0 },
    config = { h_x_mult = 1.5, h_x_chips = 2.5 },
    loc_vars = function(self, info_queue, card)             -- ⌄i fixed it but why on earth was this also xmult
        return { vars = { card.ability.h_x_mult, card.ability.h_x_chips } }
    end,
}
SMODS.Atlas {
    key = "purp",
    path = "urpul.png",
    px = 71,
    py = 95
}
SMODS.Enhancement {
    key = "ourple",
    atlas = "purp",
    pos = { x = 0, y = 0 },
    config = { h_x_mult = 1.5, Emult = 2 },
    loc_vars = function(self, info_queue, card)             
        return { vars = { card.ability.h_x_mult, card.ability.Emult } }
    end,
     calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return{
                emult = card.ability.Emult
            }
        end
    end,
}

SMODS.Enhancement {
    key = 'slamo',
    atlas = 'datlas', -- i can just use the deck sprite here
    pos = { x = 0, y = 0 },
    no_rank = true,
    any_suit = true,
    replace_base_card = true,
    loc_txt = {
        name = "Slamo",
        -- slamo
        text = {
            "{C:attention}NO +CHIPS.{}",
            "{X:blue,C:white}X#1#{} chips if played.",
            "{X:red,C:white}X#1#{} mult if held in hand, but {X:blue,C:white}X0.5{} chips if held in hand."
        }
    },
    config = { h_x_mult = 3, h_x_chips = 0.5, x_chips = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_x_mult, card.ability.h_x_mult, card.ability.x_chips } }
    end,
}
