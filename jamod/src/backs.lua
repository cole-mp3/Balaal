SMODS.Atlas {
    key = "datlas",
    path = "deccs/datlas.png",
    px = 73,
    py = 95
}
SMODS.Back {
    key = 'fantastic',
    atlas = 'datlas',
     pos = {x = 3, y = 0},
    apply = function (self, back)
        SMODS.add_card{ -- For a random one
        set = "Joker", 
    }
    end,
    
}


SMODS.Back {
    key = 'slamo', 
     atlas = 'datlas',
     pos = {x = 0, y = 0},
    config = { dollars = 20, hands = -1, discards = -1, consumables = {'c_soul','c_soul'} },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.dollars, self.config.hands, self.config.discards, 
    localize { type = 'name_text', key = self.config.consumables[1], set = 'Spectral' }
 } }
    end,
    
}