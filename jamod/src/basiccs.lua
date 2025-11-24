-- Basic consumables
SMODS.Atlas{
    key = "him",
    path = "crads/balel.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'newtype',
    path = 'crads/gundam.png',
    px = 71,
    py = 95
    -- is that fucking amuro ray
}
SMODS.Atlas {
    key = "tung", --dont you fucking say it
    path = "crads/tungs.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "waltuh", --*walter white ascii art goes here*
    path = "crads/chem.png",
    px = 71,
    py = 95
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
                  check_for_unlock({ type = "ach_awaken" })
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
--[[
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
    ]]--
SMODS.Consumable {
 set = 'jabong_Material',
 key = 'slamize',
 hidden = true,
 soul_set = 'Tarot',
 can_repeat_soul = true,
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
SMODS.Consumable {
    set = 'jabong_Material',
    key = "soapment",
    atlas = "him", 
    pos = {x = 0, y = 0},
    cost = 4, 
    loc_txt = {
        name = "Balaalment",
        text = {
            "Creates a {s:1.1,C:attention,E:1}Balaal{} joker.",
           
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_balament_comment', set = 'Other' }
    end,
     use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'balaaljonklers' })
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
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
    atlas = "ment", 
    pos = {x = 0, y = 0},
    cost = 8, 
    loc_txt = {
        name = "-ment",
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
        collection = 'fish',
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
            "{f:jabong_emomomo}🐟{}"
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
            "help me"
        }
    }
}
SMODS.Atlas {
    key = "boot",
    path = "boostlas.png",
    px = 71,
    py = 95
}
SMODS.Booster {
    key = "matbooster",
    atlas = "boot",
    pos = {x = 0 , y = 0},
    loc_txt = {
        name = "Material Pack",
        description = {
            "Choose one of up to 3 {C:attention}Material{} cards."
        },
        group_name = "Material Pack"
    },
     draw_hand = true,
    config = {extra = 3, choose = 1},
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
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
                "ar2"
            }
        else
            _card = {
                set = "jabong_Material",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "ar2"
            }
        end
        return _card
    end,
}
SMODS.Booster {
    key = "matbooster2",
    atlas = "boot",
    pos = {x = 1 , y = 0},
    loc_txt = {
        name = "Mega Material Pack",
        description = {
            "Choose #2# of up to #1# {C:attention}Material{} cards."
        },
        group_name = "Material Pack"
    },
     draw_hand = true,
    config = {extra = 5, choose = 2},
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
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
                "ar2"
            }
        else
            _card = {
                set = "jabong_Material",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "ar2"
            }
        end
        return _card
    end,
}

SMODS.Booster {
    key = "balapack",
    weight = 0.6,
    kind = 'Buffoon', 
    cost = 4,
   atlas = "boot",
    pos = {x = 2 , y = 0},
    config = { extra = 2, choose = 1 },
     loc_txt = {
        name = "Balaal Pack",
        description = {
            "Choose #2# of up to #1# {C:attention}Balaal{} jokers."
        },
        group_name = "Balaal Pack"
    },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.BUFFOON_PACK)
    end,
    create_card = function(self, card, i)
        return { set = "balaaljonklers", area = G.pack_cards, skip_materialize = true, soulable = true, }
    end,
}
SMODS.Booster {
    key = "balapack2",
    weight = 0.6,
    kind = 'Buffoon', 
    cost = 4,
   atlas = "boot",
    pos = {x = 3 , y = 0},
    config = { extra = 4, choose = 2 },
     loc_txt = {
        name = "Mega Balaal Pack",
        description = {
            "Choose #2# of up to #1# {C:attention}Balaal{} jokers."
        },
        group_name = "Balaal Pack"
    },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end. Remove this if your booster doesn't have artwork variants like vanilla
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.BUFFOON_PACK)
    end,
    create_card = function(self, card, i)
        return { set = "balaaljonklers", area = G.pack_cards, skip_materialize = true, soulable = true, }
    end,
}
SMODS.Atlas {
    key = "zeout",
    path = "crads/zout.png",
    px = 71,
    py = 95
}
SMODS.Consumable {
    set = "Tarot",
    key = "zout",
    atlas = "zeout",
    pos = {x = 0, y = 0},
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
SMODS.Consumable {
    set = 'jabong_Material',
    key = "tungstenqube",
    atlas = "tung",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = "Tungsten Cube",
        text = {
            "Turns #1# Selected {C:attention}Metal Enhanced{} card",
            "Into an {C:attention}Alloy{} Card.",
            "{C:inactive}But i cant code so it just turns 1 selected card for now{}",
            "{C:inactive}and yes i know tungsten is a fucking element{}"
        }
    },
     config = { max_highlighted = 2, mod_conv = 'm_jabong_alloy'},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv  } } }
    end,
}
SMODS.Consumable {
    set = 'jabong_Material',
    key = "NaCl",
    atlas = "waltuh",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = "Chemical Synthesis",
        text = {
            "Destroys {C:attention}ALL{} of your consumables, and",
            "Creates a {C:attention}Spectral{} card per one destroyed.",
        }
    },
    config = { extra = { mats = 1 } },
    loc_vars = function(self, info_queue, card)
          info_queue[#info_queue + 1] = { key = 'hc_walter_comment', set = 'Other' }
          if G.consumeables then
            local tally = 0
        for _, consumeable in ipairs(G.consumeables.cards) do
                
                     tally = tally + 1

            end
          end
        return { vars = { card.ability.extra.mats, } }
    end,
     use = function(self, card, area, copier)
        local tally = 0
        for _, consumeable in ipairs(G.consumeables.cards) do
                
                     tally = tally + 1

            end
      for i = 1, math.min(card.ability.extra.mats, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        while tally > 0 do
                            tally = tally - 1
                            play_sound('timpani')
                        SMODS.add_card({ set = 'Spectral', edition = "e_negative" })
                        card:juice_up(0.3, 0.5)
                        end
                        
                    end
                    return true
                end
            }))
        end
        delay(0.6)
        SMODS.destroy_cards(G.consumeables.cards)
    end,
     can_use = function(self, card)
        return (G.consumeables and #G.consumeables.cards <= G.consumeables.config.card_limit and not G.consumeables and #G.consumeables.cards == 0) or
            (card.area == G.consumeables)
    end
}

SMODS.Consumable {
    set = 'Spectral',
    key = "math",
     hidden = true,
 soul_set = 'jabong_Material',
 can_repeat_soul = true,
    atlas = "rsatlas",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = "Arithmetic",
        text = {
            "Gives {C:attention}1{} selected card the",
            "{C:red}Addition{} {X:tarot,C:white,E:1}Operator{}",
        }
    },
     config = { extra = { }, max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_math_comment', set = 'Other' }
        return { vars = { card.ability.max_highlighted} }
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
                conv_card:add_sticker("jabong_operad", true)
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
SMODS.Consumable {
    set = 'Spectral',
    key = "math2",
     hidden = true,
 soul_set = 'jabong_Material',
 can_repeat_soul = true,
    atlas = "rsatlas",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = "Arithmetic II",
        text = {
            "Gives {C:attention}1{} selected card the",
            "{C:blue}Multiplication{} {X:tarot,C:white,E:1}Operator{}",
            "{C:inactive}i love this one in specific{}"
        }
    },
     config = { extra = { }, max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_math_comment', set = 'Other' }
        return { vars = { card.ability.max_highlighted} }
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
                conv_card:add_sticker("jabong_opermul", true)
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
SMODS.Consumable {
    set = 'Spectral',
    key = "math3",
     hidden = true,
 soul_set = 'jabong_Material',
 can_repeat_soul = true,
    atlas = "rsatlas",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = "Arithmetic III",
        text = {
            "Gives {C:attention}1{} selected card the",
            "{C:green}Subtraction{} {X:tarot,C:white,E:1}Operator{}",
            "{C:inactive}subtract deez-{}"
        }
    },
     config = { extra = { }, max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_math_comment', set = 'Other' }
        return { vars = { card.ability.max_highlighted} }
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
                conv_card:add_sticker("jabong_opersub", true)
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
SMODS.Consumable {
    set = 'Spectral',
    key = "math4",
     hidden = true,
 soul_set = 'jabong_Material',
 can_repeat_soul = true,
    atlas = "rsatlas",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = "Arithmetic IV",
        text = {
            "Gives {C:attention}1{} selected card the",
            "{C:green}Squaring{} {X:tarot,C:white,E:1}Operator{}",
            "{C:inactive}swaws{}"
        }
    },
     config = { extra = { }, max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_math_comment', set = 'Other' }
        return { vars = { card.ability.max_highlighted} }
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
                conv_card:add_sticker("jabong_opersquare", true)
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

-- vouchers(I dont wanna make another lua file)
SMODS.Atlas {
    key = 'vouch',
    path = 'voucers.png',
    -- ^remind me to come back to this and redo this ugly ass voucher
    px = 60,
    py=90
}

SMODS.Voucher {
    key = 'Mindscape',
    atlas = 'vouch',
    pos = {x = 0, y = 0},
   
    loc_txt = {
        name = "mindscape",
        text = {
            "{C:attention}MAXIMIZED{} jokers can appear in the shop."
        }
    },
    config = { extra = { rate = 0.03 } },
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
            "{C:attention}Fishing{} consumables can appear in the shop.",
            "Creates {C:attention}fisherman{} joker when redeemed."
        }
    },
    config = { extra = { rate = 0.02 } },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.add_card { 
                    key = "j_jabong_fisherman",
                    edition = 'e_negative', eternal = true, }
                    check_for_unlock({ type = "ach_fishing" })

                return true
            end
        }))
    end
}



