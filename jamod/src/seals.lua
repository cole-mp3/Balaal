SMODS.Atlas ({
    key = "satlas",
    path = "Seels/satlas.png",
    px = 142,
    py = 150
})
SMODS.Atlas ({
    key = "alls",
    path = "Seels/allseal.png",
    px = 71,
    py = 95
})
SMODS.Seal {
    key = 'stone_seal',
     badge_colour = HEX("1d4fd7"),
    config = { extra = { chips = 50 } },
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.chips } }
    end,
    atlas = "satlas",
    pos = {x=0, y=0},
    loc_txt = {
                name = "Stone Seal",
                text = {
                    "{C:blue}+#1#{} extra chips,",
                    "Considered a {C:attention}Stone Card{}."
                },
                label = "Stone Seal"
    },
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                return {
                    chips = self.config.extra.chips
                }
            end
    end,


}
SMODS.Atlas{
    key = "statefa",
    path = "Seels/sfatlas.png",
    px = 35,
    py = 48
}
SMODS.Seal {
    key = 'stateseal',
     badge_colour = HEX("1d4fd7"),
    config = { extra = { Xmult = 1.5 } },
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.Xmult } }
    end,
    atlas = "statefa",
    pos = {x=0, y=0},
    loc_txt = {
                name = "Statefarm Seal",
                text = {
                    "{C:blue}X#1#{} Mult.",
                    "{C:inactive}pleasedontsuemepleasedontsuemePLEASE{}"
                },
                label = "Statefarm Seal"
    },
     calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                return {
                    x_mult = self.config.extra.Xmult
                }
            end
    end,
}
SMODS.Seal {
    key = 'butterlfy', --turn a, gundam
     badge_colour = HEX("00ffff"),
    config = { extra = { Emult = 1.23, dollars = 25} },
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.Emult, self.config.extra.dollars } }
    end,
    atlas = "satlas",
    pos = {x=0, y=0},
    loc_txt = {
                name = "{f:jabong_turn}Ɐ{} Seal",
                text = {
                    "{X:incative,C:white}^^#1#{} Mult,",
                    "{C:money}+$#2#{}"
                },
                label = "Turn A"
    },
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                return {
                    eemult = self.config.extra.Emult,
                    dollars = self.config.extra.dollars
                }
            end
    end,


}
SMODS.Seal {
    key = 'Bassp', 
     badge_colour = HEX("00ffff"),
    loc_vars = function(self, info_queue)
    end,
    atlas = "satlas",
    pos = {x=0, y=0},
    loc_txt = {
                name = "Bass Pro Seal",
                text = {
                   "Creates a {C:attention}Fish{} when initially scored."
                },
                label = "Bass Pro Seal"
    },
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play then
                  SMODS.add_card {
                            set = 'jabong_fish', 
                            edition = "e_negative" 
                        }
            end
    end,


}
--yes every instance fo bluemult is different
-- :3



-- all seal is getting a recode.
-- just uhh
-- not now
-- gotta add everyman first