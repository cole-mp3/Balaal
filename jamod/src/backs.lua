SMODS.Atlas ({
    key = "datlas",
    px = 70,
    py = 95,
    path = "datlas.png",
})
SMODS.Back {
    key = 'fantastic', 
    apply = function (self, back)
        SMODS.add_card{ -- For a random one
        set = "Joker", 
    }
    end,
    atlas = 'datlas',
     pos = {x = 380, y = 0},
}
SMODS.Back {
    key = 'slamo', 
     atlas = 'datlas',
     pos = {x = 1, y = 1},
    config = { dollars = 20, hands = -1, discards = -1 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.dollars, self.config.hands, self.config.discards } }
    end,
    apply = function (self, back)
        G.GAME.win_ante = 9
        SMODS.add_card{ key = "c_fool" }
        SMODS.add_card{ key = "c_fool" }
        SMODS.add_card{ key = "c_soul" }
    end,

   
}