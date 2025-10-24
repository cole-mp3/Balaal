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
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play then
                return {
                    chips = self.config.extra.chips
                }
            end
            return {}
    end,


}
-- all seal is getting a recode.