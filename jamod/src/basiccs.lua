-- Basic consumables
SMODS.Atlas {
    key = 'newtype',
    path = 'crads/gundam.png',
    px = 71,
    py = 95
    -- is that fucking amuro ray
}
SMODS.Atlas {
    key = 'copperizing',
    path = 'crads/coper.png',
    px = 71,
    py = 95
}
SMODS.ConsumableType({
    primary_colour = G.C.SET.Tarot,
    secondary_colour = G.C.SECONDARY_SET.Tarot,
    key = 'jabong_Material', 
    default = 'c_jabong_RandS',
    cards = {
        
    },
})
SMODS.Sound({
    vol = 0.6,
    pitch = 0.7,
    key = "damn",
    path = "damn.ogg",
})
SMODS.Sound({
    vol = 0.6,
    pitch = 0.7,
    key = "womp",
    path = "womp.ogg",
})
SMODS.Sound({
    vol = 0.6,
    pitch = 0.7,
    key = "lepipe",
    path = "pipe.ogg",
})
SMODS.Sound({
    vol = 0.6,
    pitch = 0.7,
    key = "oh",
    path = "oh.ogg",
})
SMODS.Sound ({
    vol = 0.6,
    pitch = 0.7,
    key = "whatdoicallthis",
    path = "nts.ogg"
})

SMODS.Consumable {
    key = 'rockstone',
    set = 'jabong_Material',
    atlas = "rsatlas",
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = "Rock And Stone",
        text = {
            "Adds a {C:attention}Stone Seal{} to one selected card."
        },
    },
    config = { extra = { seal = 'jabong_stone_seal' }, max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('jabong_damn')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_seal(card.ability.extra.seal, nil, true)
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
}
SMODS.Atlas ({
    key = "rsatlas",
    path = "crads/rsatlas.png",
    px = 71,
    py = 95
    
})
SMODS.Atlas ({
    key = "hyperen",
    px = 71,
    py = 95,
    path = "crads/hyperize.png",
})
SMODS.Consumable {
    set = 'Spectral',
    key = 'hyperize',
    config = {
    
        max_highlighted = 1,
    },
     loc_vars = function(self, info_queue, card)
       
        return {vars = {(card.ability or self.config).max_highlighted}}
    end,
    loc_txt = {
        name = 'Hyperize',
        text = {
            "Select {C:attention}#1#{} card to",
            "{C:attention}Hyper Enhance{}.",
            "MUST HAVE AN ENHANCEMENT.",
            "{C:inactive}does nothing yet :( {}"
        }
    },
    cost = 6,
    atlas = "hyperen",
    pos = {x=0, y=0},
    use = function(self, card, area, copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('jabong_womp')
                card:juice_up(0.3, 0.5)
                -- i still have to code this in so uhhh
               
                return true end }))
            
       


            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end
}
SMODS.Consumable {
 set = 'jabong_Material',
 key = 'coppering',
 atlas = "copperizing", 
 pos = {x = 0, y = 0},
 cost = 4,
 loc_txt = {
    name = "Copper Age",
    text = {
        "Select {C:attention}1{} card to turn into",
        "A Copper Card."
    }
 },
config = { max_highlighted = 1, mod_conv = 'm_jabong_copper' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}
SMODS.Consumable {
    set = 'Spectral',
    key = 'gundam',
    atlas = 'newtype',
    --  *newtype shenanigans intensify*
    pos = {x = 0,y = 0},
    soul_pos = {x = 1, y = 0},
    loc_txt = {
        name = 'Awakening',
        text = {
            "Creates 1 {C:attention}MAXIMIZED{} joker."
        }
    },
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('jabong_whatdoicallthis')
                SMODS.add_card({ set = 'Joker', rarity = "jabong_Max"})
                
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,
}
SMODS.Consumable {
    set = 'Spectral',
    key = 'mssummon',
    atlas = 'newtype',
    pos = {x = 0,y = 0},
    soul_pos = {x = 1, y = 0},
    loc_txt = {
        name = 'Hangar',
        text = {
            "Creates 1 {C:attention}Mobile Suit{} "
        }
    },
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('jabong_lepipe')
                SMODS.add_card({ set = 'jabong_mobilesuit'})
                
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,
}
SMODS.Consumable {
 set = 'Tarot',
 key = 'slamize',
 atlas = "rsatlas", --again, again placeholder here
 pos = {x = 0, y = 0},
 cost = 4,
 loc_txt = {
    name = "slamize",
    text = {
        "Select {C:attention}1{} card to turn into",
        "A slamo."
    },
    
},
config = { max_highlighted = 1, mod_conv = 'm_jabong_slamo' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}

SMODS.Consumable {
    set = 'jabong_Material',
    key = 'twine',
    atlas = "rsatlas", --Im adding too much shit for my own good this si just using MORE PLACEHOLDER
    pos = {x = 0, y = 0},
    cost = 4,
    loc_txt = {
        name = "Twine",
        text = {
            "Creates {C:attention}2{} random Material cards.",
        }
    },
     config = { extra = { mats = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mats } }
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.mats, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'jabong_Material' })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) or
            (card.area == G.consumeables)
    end
}
SMODS.Atlas {
    key = 'lamo',
    path = 'crads/band.png',
    px = 71,
    py = 95
}
SMODS.Consumable {
    set = 'jabong_Material',
    key = "rubberbanding",
    atlas = "lamo", 
    pos = {x = 0, y = 0},
    cost = 4, 
    loc_txt = {
        name = "Rubber Making",
        text = {
            "Because I have yet to code in this {S:1.1,C:attention,E:1}fucking enhancement{},",
            "Doubles money, max of {C:attention}#1#{} dollars.",
           
        }
    },
    config = { extra = { max = 500 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(math.max(0, math.min(G.GAME.dollars, card.ability.extra.max)), true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas {
    key = 'ment',
    path = 'crads/ment.png',
    px = 71,
    py = 95
}
SMODS.Consumable {
    set = 'Tarot',
    key = "notjudgement",
    atlas = "ment", --last placeholder i swear
    pos = {x = 0, y = 0},
    cost = 8, 
    loc_txt = {
        name = "ment",
        text = {
            "Creates a {C:attention}Half-Type{} joker. "
        }
    },
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('jabong_oh')
                SMODS.add_card({ set = 'halfjokes'})
                
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,
}
-- vouchers(I dont wanna make another lua file)
SMODS.Atlas {
    key = 'vouch',
    path = 'voucers.png',
    -- ^remind me to come back to this and redo this ugly ass voucher
    px = 60,
    py=90
}

SMODS.Voucher {
    key = 'mindscape',
    atlas = 'vouch',
    pos = {x = 0, y = 0},
   
    loc_txt = {
        name = "mindscape",
        text = {
            "{C:attention}MAXIMIZED{} jokers acn appear in the shop."
        }
    },
    config = { extra = { rate = 4 } },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                --[[ Update: I still cant prove it works but good news is it didnt crash the  
                game when i used it (unlike everything ELSE in this spaghetti code monster)
                soo uhh i guess it did]]--
                G.GAME.jabong_maximized_rate = card.ability.extra.rate
                return true
            end
        }))
    end
}


