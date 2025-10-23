SMODS.Atlas {
    key = "datlas",
    path = "deccs/datlas.png",
    px = 72,
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
-- Ensure G is defined or required before usage
if not G then
    G = require("game_globals") -- Replace "game_globals" with the actual module name if different
end

SMODS.Back {
    key = 'slamo', 
     atlas = 'datlas',
     pos = {x = 0, y = 0},
    config = { dollars = 20, hands = -1, discards = -1 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.dollars, self.config.hands, self.config.discards } }
    end,
    apply = function (self, back)
        G.GAME.win_ante = 9
        SMODS.add_card{ key = "c_soul" }
        SMODS.add_card{ key = "c_soul" }
    end,

   
}