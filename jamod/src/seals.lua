SMODS.Atlas {
    key = "satlas",
    path = "satlas.png",
    px = 142,
    py = 150
}
SMODS.Seal {
    key = 'stone_seal',
    name = 'Stone Seal',
     badge_colour = HEX("1d4fd7"),
      loc_txt = {
        -- Badge name (displayed on card description when seal is applied)
        label = 'Stone Seal',
        -- Tooltip description
        name = 'Stone Seal',
        text = {
            '{C:chips}+#30#{} Chips',
        }
    },
    config = { extra = { chips = 50 } },
    loc_vars = function(self, info_queue)
         return { vars = { self.ability.extra.chips } }
    end,
    atlas = "satlas",
    pos = {x=0, y=0},
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                chips = self.ability.extra.chips
            }
        end
    end,


}

