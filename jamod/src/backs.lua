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
SMODS.Back {
    key = "xboxlive",
    atlas = 'datlas',
    loc_txt = {
        name = "XBOX LIVE!!!!!!",
        text = {
            "Start the run with a {C:attention}MAXIMIZED{} Joker."
        }
    },
     pos = {x = 2, y = 0},
     apply = function()
        G.E_MANAGER:add_event(Event({
            func = function()
               SMODS.add_card {set = 'Joker', rarity = "jabong_Max"}
                return true
            end
        }))
    end
}
SMODS.Atlas {
    key = "spanish",
    path = "deccs/lucha.png",
    px = 71,
    py = 95
}
--[[
SMODS.Back {
    key = "luchalibre",
    loc_txt = {
        name = "lucha Lucha libre",
        text = {
            "Creates a {C:attention}Luchador Tag{} after defeating a blind.",
            "{C:inactive}basically its bad anaglyph deck{}"
        }
    },
    atlas = "spanish",
    pos = { x = 0, y = 0 },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { localize { type = 'name_text', key = 'jabong_tag_luchatag', set = 'Tag' } } }
    end,
    calculate = function(self, back, context)
        if context.end_of_round and context.main_eval and context.beat_boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    add_tag(Tag('jabong_tag_luchatag'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
        end
    end,
}]]
