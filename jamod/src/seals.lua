SMODS.atlas {
    key = "satlas",
    px = 66,
    py = 66,
    path = { 
        ['default'] = 'sealatlas.png',
        atlas_table = 'ASSET_ATLAS',
    
    }
}
SMODS.seal {
    key = 'stone_seal',
    atlas = 'satlas',
    pos = { x = 5, y = 4 },
    config = { extra = { chips = 50 } },
    calculate = function(self, card, context)
        return { vars = { card.ability.extra.chips } }
    end,


}