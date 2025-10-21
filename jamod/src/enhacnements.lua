SMODS.Enhancement {
    key = 'copper',
    atlas = 'Jatlas', --ILL WORK ON THE PIXEL ART I PROMISE
    pos = { x = 6, y = 1 },
    config = { h_x_mult = 1.5, h_x_chips = 2.5 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_x_mult, card.ability.h_x_mult } }
    end,
}