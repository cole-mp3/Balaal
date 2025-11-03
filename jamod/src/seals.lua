SMODS.Atlas ({
    key = "satlas",
    path = "Seels/satlas.png",
    px = 142,
    py = 150
})
SMODS.Atlas ({
    key = "alls",
    path = "Seels/allseal.png",
    px = 71,
    py = 95
})
SMODS.Seal {
    key = 'stone_seal',
     badge_colour = HEX("1d4fd7"),
    config = { extra = { chips = 50 } },
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.chips } }
    end,
    atlas = "satlas",
    pos = {x=0, y=0},
    loc_txt = {
                name = "Stone Seal",
                text = {
                    "{C:blue}#50#{} extra chips,",
                    "Considered a {C:attention}Stone Card{}."
                },
    },
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                return {
                    chips = self.config.extra.chips
                }
            end
    end,


}
SMODS.Atlas{
    key = "statefa",
    path = "Seels/sfatlas.png",
    px = 71,
    py = 95
}
SMODS.Seal {
    key = 'stateseal',
     badge_colour = HEX("1d4fd7"),
    config = { extra = { Xmult = 1.5 } },
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.Xmult } }
    end,
    atlas = "statefa",
    pos = {x=0, y=0},
    loc_txt = {
                name = "Statefarm Seal",
                text = {
                    "{C:blue}X#1#{} Mult.",
                },
    },
     calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                return {
                    x_mult = self.config.extra.Xmult
                }
            end
    end,
}
-- all seal is getting a recode.
-- just uhh
-- not now
-- gotta add everyman first