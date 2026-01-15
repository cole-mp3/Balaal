-- various buff consumeables
-- the **main** source of these are from the fishing shop, but there is a small chance for them to show up
-- the buffs will probably be stickers that look like microchips
SMODS.ConsumableType({
    primary_colour = G.C.EDITION,
    secondary_colour = G.C.WHITE,
    loc_txt = {
        name = "Module",
        collection = 'Modules',
        undiscovered = { 
 			name = 'Undiscovered',
 			text = { 
                'Purchase this in any shop',
                'to discover it.'
         },
 		},
    },
    text_colour = HEX('000000'),
    shop_rate = 0.01,
    collection_rows = { 3, 3 },
    key = 'jabong_Modules', 
    default = 'c_jabong_trade1',
    cards = {
        
    },
})
SMODS.Consumable {
    set = 'jabong_Modules',
    key = 'trade1',
    atlas = "rsatlas", -- the real sprites for this will be lil boosters :]
    pos = {x = 0, y = 0},
    cost = 4,
    loc_txt = {
        name = "Trading Module",
        text = {
            "Pick any 1 card/joker;",
            "The next trigger of that card will give #1# {C:blue}fishing tokens{}.",
            "Lasts for only {C:attention}one{} Trigger."
        }
    },
    -- delete all this later, CUz you should be able to attach this to a joker or card.
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
                conv_card:add_sticker("jabong_tr1s", true)
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
    set = 'jabong_Modules',
    key = 'trade2',
    atlas = "rsatlas", 
    pos = {x = 0, y = 0},
    cost = 4,
    loc_txt = {
        name = "Trading Module (T2)",
        text = {
            "Pick any 1 card/joker;",
            "The next trigger of that card will give #1# {C:blue}fishing tokens{}.",
            "Lasts for only {C:attention}three{} triggers."
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
                conv_card:add_sticker("jabong_tr2s", true)
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
    set = 'jabong_Modules',
    key = 'trade3',
    atlas = "rsatlas", 
    pos = {x = 0, y = 0},
    cost = 4,
    loc_txt = {
        name = "Trading Module (T3)",
        text = {
            "Pick any 1 card/joker;",
            "Every trigger of that card will give #1# {C:blue}fishing tokens{}.",
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
                conv_card:add_sticker("jabong_tr3s", true)
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