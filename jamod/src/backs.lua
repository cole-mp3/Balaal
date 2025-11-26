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
    config = { dollars = 20, hands = -1, discards = -1, consumables = {'c_fool'} },
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
SMODS.Back {
    key = "xboxlive",
    atlas = 'datlas',
     pos = {x = 2, y = 0},
     apply = function()
        G.E_MANAGER:add_event(Event({
            func = function()
               SMODS.add_card {set = 'Joker', rarity = "jabong_Max"}
                return true
            end
        }))
    end,
     locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_red'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_jabong_slamo' }
        end

        return { vars = { other_name } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_jabong_slamo') and true
    end
}
SMODS.Atlas {
    key = "spanish",
    path = "deccs/lucha.png",
    px = 71,
    py = 95
}


