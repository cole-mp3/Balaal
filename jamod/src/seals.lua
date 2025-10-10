local seal_atlas = {

object_type = "Atlas",
	key = "jgseals",
	path = "jabong_seals.png",
    atlas_table = 'ASSET_ATLAS',
	px = 66,
	py = 66,
}
smods.seal {
    key = 'stone_seal',
    pos = { x = 5, y = 4 },
    config = { extra = { chips = 50 } },
    calculate = function(self, card, context)
        return { vars = { card.ability.extra.chips } }
    end,   


}