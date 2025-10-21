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
                SMODS.add_card({ set = 'jabong_maximized'})
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
SMODS.DrawStep {
    key = 'jabong_gundam',
    order = 50,
    func = function(card)
        if card.config.center.key == "c_jabong_gundam" and (card.config.center.discovered or card.bypass_discovery_center) then
            local scale_mod = 0.05 + 0.05 * math.sin(1.8 * G.TIMERS.REAL) +
                0.07 * math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14) *
                (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
            local rotate_mod = 0.1 * math.sin(1.219 * G.TIMERS.REAL) +
                0.07 * math.sin((G.TIMERS.REAL) * math.pi * 5) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

            G.shared_soul.role.draw_major = card
            G.shared_soul:draw_shader('dissolve', 0, nil, nil, card.children.center, scale_mod, rotate_mod, nil,
                0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.6)
            G.shared_soul:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
}