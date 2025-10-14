SMODS.ConsumableType({
    key = 'jabong_Material', -- The prefix is not added automatically so it's recommended to add it yourself
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
            "apply {C:attention}Stoe Seal{} to."
        }
    },
    cost = 4,
    atlas = "rsatlas",
    pos = {x=0, y=0},
    use = function(self, card, area, copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('damn')
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
    px = 142,
    py = 150,
    path = "rsatlas.png",
})
