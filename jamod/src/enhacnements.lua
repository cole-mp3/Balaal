SMODS.Atlas {
    key = 'coplas',
    path = 'coppere.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "rublas",
    path = "rubber.png",
    px = 71,
    py = 95
}
SMODS.Enhancement {
    key = "ruband",
    atlas = "rublas", 
    config = {repetitions = 2, xmult = 2.1},
    loc_vars = function(self, info_queue, card)            
        return { vars = { card.ability.repetitions, card.ability.xmult } }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            return{
                repetitions = card.ability.repetitions,
                xmult = card.ability.xmult
            }
        end
    end,
}
SMODS.Enhancement {
    key = "alloy",
    atlas = "rublas", 
    config = {h_x_mult = 1.5, bonus = 50, h_dollars = 3, h_x_chips = 2.5  },
    loc_vars = function(self, info_queue, card)            
        info_queue[#info_queue + 1] = { key = 'hc_metals_comment', set = 'Other' }
        return { 

            vars = {
                card.ability.h_x_mult,
                card.ability.bonus, 
                card.ability.h_dollars,
                card.ability.h_x_chips

            } 
        }
    end,
    loc_txt = {
        name = "Alloy card",
        text = {
            "Treated as {C:inactive}(and has the effects of){}",
            "All {C:attention}Metal Enhanced{} Cards."
        }
    },
    calculate = function(self, card, context)
        if context.check_enhancement then
    return {
        m_gold = true,
        m_steel = true,
        m_jabong_copper = true
    }
end
    end
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
            "{X:blue,C:white}X#3#{} chips if played.",
            "{X:red,C:white}X#1#{} mult if held in hand, but subequently {X:blue,C:white}X#2#{} chips."
        }
    },
    config = { h_x_mult = 3, h_x_chips = 0.5, x_chips = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_x_mult, card.ability.h_x_mult, card.ability.x_chips } }
    end,
}
SMODS.Enhancement:take_ownership('bonus', 
    {
 --aeiou
    },
    true 
)
