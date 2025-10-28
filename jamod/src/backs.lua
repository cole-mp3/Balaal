SMODS.Atlas {
    key = "datlas",
    path = "deccs/datlas.png",
    px = 71,
    py = 95
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
     apply = function()
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    G.playing_cards[i]:set_ability(G.P_CENTERS.m_jabong_slamo)
                end
                return true
            end
        }))
    end
    
}
