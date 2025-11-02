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
    loc_txt = {
        name = "Material Card",
        collection = 'Material Cards',
        undiscovered = { 
 			name = 'hi',
 			text = { 'find me :)' },
 		},
    },
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
                G.FUNCS.overlay_menu{
                 --go ,my dancing ogre
                definition = create_UIBox_custom_video1("horsef","yea"),
                config = {no_esc = true}
            }
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
                 check_for_unlock { type = 'ach_awaken' }
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
                SMODS.add_card({ set = 'mobilesuit'})
                 check_for_unlock { type = 'ach_gund' }
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
        name = "Rubberband Ball",
        text = {
            "Turns one card into {S:1.1,C:attention,E:1}A rubberband card{},",
           
        }
    },
    config = { max_highlighted = 1, mod_conv = 'm_jabong_ruband' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
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
    atlas = "ment", 
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

SMODS.ConsumableType({
    primary_colour = G.C.SET.Tarot,
    secondary_colour = G.C.SECONDARY_SET.Tarot,
    key = 'jabong_fish', 
    loc_txt = {
        name = "Fish",
        collection = 'Fish',
        undiscovered = { 
 			name = 'hi',
 			text = { 'collect my pages :)' },
 		},
    },
    default = 'c_jabong_bass',
    cards = {
        
    },
})
SMODS.Consumable {
    set = 'jabong_fish',
    key = "bass",
    atlas = "ment", --yes i fucking lied abt placeholders
    pos = {x = 0, y = 0},
    cost = 8, 
    loc_txt = {
        name = "Bass",
        text = {
            "glub"
        }
    }
}
SMODS.Consumable {
    set = 'jabong_fish',
    key = "trout",
    pos = {x = 0, y = 0},
    cost = 8, 
    loc_txt = {
        name = "trout",
        text = {
            "glub"
        }
    }
}
SMODS.Consumable {
    set = 'jabong_fish',
    key = "tuna",
    atlas = "sccre", --yes i fucking lied abt placeholders
    pos = {x = 0, y = 0},
    cost = 8, 
    loc_txt = {
        name = "tuna",
        text = {
            "glub"
        }
    }
}
 
SMODS.Booster {
    key = "matbooster",
    atlas = "purp",
    loc_txt = {
        name = "Material Pack",
        description = {
            "Choose one of up to 3 {C:attetnion}Material{} cards."
        },
        group_name = "Material_Pack"
    },
     draw_hand = true,
    group_key = "k_Material_Pack",
    config = {extra = 3, choose = 1},
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.TAROT_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _card
        if G.GAME.used_vouchers.v_omen_globe and pseudorandom('omen_globe') > 0.8 then
            _card = {
                set = "Spectral",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "vremade_ar2"
            }
        else
            _card = {
                set = "jabong_Material",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "vremade_ar2"
            }
        end
        return _card
    end,
}
SMODS.Consumable {
    set = "Tarot",
    key = "zout",
    pos = {x = 2, y = 0},
    cost = 8, 
    loc_txt = {
        name = "Zero-out",
        text = {
            "Set up to {C:attention}#1#{} card's {C:attention}rank{}",
            "to {C:edtiton}Zero{}."
        }
    },
     config = { max_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    SMODS.change_base(G.hand.highlighted[i], nil, 'jabong_Zero')
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
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
SMODS.Voucher {
    key = 'fishingtime',
    atlas = 'vouch',
    pos = {x = 1, y = 0},
   
    loc_txt = {
        name = "Fishing...?",
        text = {
            "{C:attention}Fishing{} jokers and consumables can appear in the shop.",
            "Creates {C:attention}fisherman{} joker when redeemed."
        }
    },
    config = { extra = { rate = 4 } },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                -- just like the last one, let's see if it works :)
                SMODS.add_card { 
                    key = "j_jabong_fisherman",
                    edition = 'e_negative' }
                    check_for_unlock { type = 'ach_fishing' }
                G.GAME.jabong_Feesh_rate = card.ability.extra.rate
                return true
            end
        }))
    end
}


