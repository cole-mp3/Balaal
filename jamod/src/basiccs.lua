-- Basic consumables
SMODS.Atlas {
    key = 'newtype',
    path = 'crads/gundam.png',
    px = 71,
    py = 95
    -- is that fucking amuro ray
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
    set = 'jabong_Material',
    key = 'RandS',
    config = {
        -- How many cards can be selected.
        max_highlighted = 1,
        -- the key of the seal to change to
        extra = 'stone_seal',
    },
     loc_vars = function(self, info_queue, card)
        -- Handle creating a tooltip with seal args.
        info_queue[#info_queue+1] = G.P_SEALS[(card.ability or self.config).extra]
        -- Description vars
        return {vars = {(card.ability or self.config).max_highlighted}}
    end,
    loc_txt = {
        name = 'Rock And Stone',
        text = {
            "Select {C:attention}#1#{} card to",
            "apply {C:attention}Stone Seal{} to."
        }
    },
    cost = 4,
    atlas = "rsatlas",
    pos = {x=0, y=0},
    use = function(self, card, area, copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('jabong_damn')
                card:juice_up(0.3, 0.5)
                return true end }))
            
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.hand.highlighted[i]:set_seal(card.ability.extra, nil, true)
                return true end }))
            
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end
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
        -- How many cards can be selected.
        max_highlighted = 1,
    },
     loc_vars = function(self, info_queue, card)
        -- Description vars
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
                play_sound('jabong_damn')
                card:juice_up(0.3, 0.5)
                -- i still have to code this in so uhhh
                G.FUNCS.overlay_menu{
                 -- h o n s e
                definition = create_UIBox_custom_video1("horsef","sample text"),
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
 atlas = "rsatlas", --again, placeholder here
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
                SSMODS.add_card {
                            set = 'Joker',
                            rarity = 'jabong_Max',
                        }
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
}
SMODS.Consumable {
 set = 'jabong_Material',
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

-- vouchers(I dont wanna make another lua file)
SMODS.Atlas {
    key = 'vouch',
    path = 'voucers.png',
    px = 69,
    py=90
}

SMODS.Voucher {
    key = 'mindscape',
    atlas = 'vouch',
    pos = {x = 1, y = 0},
   
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
                -- convinced the  below doesnt work i have to test that
                G.GAME.jabong_maximized_rate = card.ability.extra.rate
                return true
            end
        }))
    end
}

