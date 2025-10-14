SMODS.Atlas ({
    key = "datlas",
    px = 70,
    py = 95,
    path = "datlas.png",
})
SMODS.Back {
    key = 'fantastic',
   
    apply = function (self, back)
    add_joker("j_burnt_joker", nil, true, false)

    end,
    atlas = 'datlas',
     pos = {x = 380, y = 0},
}