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
SMODS.Seal {
    key = 'canofall'
    badge_colour = HEX("8B0000")
    config = {extra = {repetitions = 2, chips = 50, xmult = 1.5, mult = 20, xchips = 2.5,  }},
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.chips, self.config.extra.xmult, self.config.extra.mult
    self.config.extra.xmult, self.config.extra.xchips, self.config.extra.repetitions } }
    end,
    atlas = "alls",
    pos = {x=0, y=0},
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or if context.repetition and context.cardarea then
                return {
                    chips = self.config.extra.chips
                    mult = self.config.extra.mult
                    xmult = self.config.extra.xmult
                    xchips = self.config.extra.xchips
                }
                if context.repetition then
                    repetitions = card.ability.extra.repetitions
                end
            end
            return {}
    end,

}

