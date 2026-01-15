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
    text_colour = HEX('000000')
    shop_rate = 0.01
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
        name = "Trading (I)",
        text = {
            "Pick any 1 card/joker;",
            "The next trigger of that card will give #1# {C:blue}fishing tokens{}.",
            "Lasts for only {C:attention}one{} Trigger."
        }
    },
    -- delete all this later, CUz you should be able to attach this to a joker or card.
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
                        play_sound('timpani')
                        card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Consumable {
    set = 'jabong_Modules',
    key = 'trade2',
    atlas = "rsatlas", 
    pos = {x = 0, y = 0},
    cost = 4,
    loc_txt = {
        name = "Trading (II)",
        text = {
            "Pick any 1 card/joker;",
            "The next trigger of that card will give #1# {C:blue}fishing tokens{}.",
            "Lasts for only {C:attention}three{} triggers."
        }
    },
    -- delete all this later, CUz you should be able to attach this to a joker or card.
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
                        play_sound('timpani')
                        card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Consumable {
    set = 'jabong_Modules',
    key = 'trade3',
    atlas = "rsatlas", 
    pos = {x = 0, y = 0},
    cost = 4,
    loc_txt = {
        name = "Trading (III)",
        text = {
            "Pick any 1 card/joker;",
            "Every trigger of that card will give #1# {C:blue}fishing tokens{}.",
        }
    },
    -- delete all this later, CUz you should be able to attach this to a joker or card.
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
                        play_sound('timpani')
                        card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}