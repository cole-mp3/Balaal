
-- update: what is happening

SMODS.Edition {
    key = 'radiant',
    shader = false, --someone please make thhis
    config = { chips = 50, Mult = 20, Xmult = 2.5 },
    in_shop = true,
    weight = 20,
    extra_cost = 2,
    loc_txt = {
        name = "Radiant",
        label = "Radiant",
        text = {
            "{C:blue}+#1#{} Chips and {C:red}+#2#{} Mult,",
            "As well as {X:red,C:white}X#3#{} Mult.",
            "{C:inactive}i know it sucks, but i just really wanted to have an edition{}",
            "{C:inactive}                                              -jabon gratis{}",
        }
    },
    sound = { sound = "foil1", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.Chips, card.edition.Mult, card.edition.Xmult } }
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = card.edition.Chips,
                mult = card.edition.Mult,
                x_mult = card.edition.Xmult
            }
        end
    end
}
SMODS.Atlas {
    key = 'azte',
    path = "Jonklers/azte.png",
    px = 142,
    py = 190
}
SMODS.Atlas {
    key = "tatlas",
    path = "tatlas.png",
    px = 32,
    py = 32
}
SMODS.Tag {
    key = "luchatag",
    atlas = "tatlas",
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = "Luchador Tag",
        text = {
            "Creates {C:attention}Luchador{}.",
            "{C:inactive}(Must have room){}"
        }
    },
    apply = function(self, tag, context)
         if context.type == 'new_blind_choice' then
             tag:yep('+', G.C.GREEN, function()
            SMODS.add_card {
            key = "j_luchador", 
            edition = "e_negative"                      
                         }
            tag.triggered = true
            return true
        end)
    end
    end
}
SMODS.Tag {
    key = "flashbang",
    atlas = "tatlas",
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = "Radiance tag",
        text = {
            "The next {C:attention}base edition{} shop joker",
            "is turned {C:attention}Radiant{}"
        }
    },
   loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_jabong_radiant
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_jabong_radiant", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end
}

SMODS.Tag {
    key = "jonktag",
    atlas = "tatlas",
    pos = { x = 1, y = 1 },
    loc_txt = {
        name = "Idiotic Tag",
        text = {
            "The next shop has a",
            "Free {C:attention}Balaal Joker{}."
        }
    },
    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local card = SMODS.create_card {
                set = "balaaljonklers"
            }
            create_shop_card_ui(card, 'Joker', context.area)
            card.states.visible = false
            tag:yep('+', G.C.GREEN, function()
                card:start_materialize()
                card.ability.couponed = true
                card:set_cost()
                return true
            end)
            tag.triggered = true
            return card
        end
    end
} --theres one mmore after this but ive scrapped it
-- i think i know how this works
--update: i did
SMODS.Font {
  key = "Ariana", 
  path = "ArianaVioleta-dz2K.ttf"
}
SMODS.Font {
    key = "japan",
    path = "Firstgundam-8aVg.ttf"
}
SMODS.Font {
    key = "goog",
    path = "GoogleSansFlex-VariableFont_GRAD,ROND,opsz,slnt,wdth,wght.ttf"
}
SMODS.Font {
    key = "ascii",
    path = "NotoSansSymbols2-Regular.ttf"
}
SMODS.Font {
    key = "wawa",
    path = "Angels.ttf"
}
SMODS.Font {
    key = "emomomo",
    path = "NotoEmoji-Regular.ttf"
}
SMODS.Font {
    key = "fire",
    path = "SupporterpersonaluseRegular-EazBz.otf"
}
SMODS.Font {
    key = "gundamit",
    path = "SerpentineRegular.ttf"
}
SMODS.Font {
    key = "turn",
    path = "NotoSans-Regular.ttf"
}
SMODS.Gradient {
    key = 'maxient',
    colours = {G.C.MONEY, G.C.RED},
    cycle = 2
}
SMODS.Atlas {
    key = "sticklas",
    path = "sticklas.png",
    px = 71, 
    py = 95
}
SMODS.Sticker {
    key = "operad",
    badge_colour = HEX 'fda200',
    loc_txt = {
                name = "Addition",
                text = {
                    "Adds the {C:blue}+chips{} value of the",
                    "current played hand whne scored."
                },
                label = "Addition"
    },
   atlas = "sticklas",
    pos = { x = 0, y = 0 },
    rate = 0,
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,
     calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play or context.joker_main then
                local current_hand_chips = hand_chips
                return {
                    chips = hand_chips
                }
            end
    end,

}
SMODS.Sticker {
    key = "opermul",
    badge_colour = HEX 'fda200',
    loc_txt = {
                name = "Multiplication",
                text = {
                    "Multiplies the Mult value of the played hand ",
                    "by the {C:blue}+chips{} value of the",
                    "current played hand when scored."
                },
                label = "Multiplication"
    },
   atlas = "sticklas",
    pos = { x = 0, y = 1 },
    rate = 0,
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,
     config = {extra = {Xmult = 2}},
 loc_vars = function(self, info_queue, card)            
    end,
   
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                local current_hand_chips = hand_chips
                local bluemult = hand_chips * hand_chips
                return {
                    mult = bluemult,
                    message =  "+"..bluemult.." Mult",
                    colour = G.C.BLUE
                }
            end
    end,

}
SMODS.Sticker {
    key = "opersub",
    badge_colour = HEX 'fda200',
    loc_txt = {
                name = "Subtraction",
                text = {
                    "subtracts 15% of the played hand's chips,",
                    "and adds them to mult.",
                },
                label = "Subtraction"
    },
   atlas = "sticklas",
    pos = { x = 0, y = 3 },
    rate = 0,
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,
     config = {extra = {Xmult = 2}},
 loc_vars = function(self, info_queue, card)            
    end,
   
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                local current_hand_chips = hand_chips * 0.15
                return {
                    chips = 0 - current_hand_chips,
                    mult = current_hand_chips,
                    message =  "+"..current_hand_chips.." Mult",
                    colour = G.C.BLUE
                }
            end
    end,

}
SMODS.Sticker {
    key = "opersquare",
    badge_colour = HEX 'fda200',
    loc_txt = {
                name = "Squaring",
                text = {
                    "squares 15% of the played hand's chips,",
                },
                label = "Squaring"
    },
   atlas = "sticklas",
    pos = { x = 0, y = 4 },
    rate = 0,
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,
     config = {extra = {Xmult = 2}},
 loc_vars = function(self, info_queue, card)            
    end,
   
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                local current_hand_chips = hand_chips * 0.15
                return {
                    chips = current_hand_chips * current_hand_chips,
                    message =  "+"..current_hand_chips.."",
                    colour = G.C.BLUE
                }
            end
    end,

}
--[[
SMODS.Sticker {
    key = "joel",
    badge_colour = HEX 'fda200',
    loc_txt = {
                name ="Best Value!",
                text = {
                    "The card this is applied to loses $#1#",
                    "in sell value at the end of the round",
                    "and adds it to your funds.",
                    "(CAN GO NEGATIVE)"
                },
                label = "Addition"
    },
   atlas = "sticklas",
   sets = {
    Joker = true
   },
    pos = { x = 0, y = 0 },
    rate = 0,
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,
     calculate = function(self, card, context)
            if  then
                local current_hand_chips = hand_chips
                return {
                    chips = hand_chips
                }
            end
    end,

}
]]--
SMODS.Sticker {
    key = "tr1s",
    badge_colour = HEX 'fda200',
    loc_txt = {
                name = "Trading I",
                text = {
                    "+#1# {C:blue}Port Tokens{} on initial trigger.",
                },
                label = "Active Module (T1)"
    },
   atlas = "sticklas",
    pos = { x = 0, y = 4 },
    rate = 0,
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,
     config = {extra = {Xmult = 2}},
 loc_vars = function(self, info_queue, card)            
    end,
   
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                local current_hand_chips = hand_chips * 0.15
                return {
                    mult = current_hand_chips
                    message =  "+"..current_hand_chips.."",
                    colour = G.C.BLUE
                }
            end
    end,

}
SMODS.Sticker {
    key = "tr2s",
    badge_colour = HEX 'fda200',
    loc_txt = {
                name = "Trading II",
                text = {
                    "+#1# {C:blue}Port Tokens{} for {C:attention}#2#{} triggers.",
                },
                label = "Active Module (T2)"
    },
   atlas = "sticklas",
    pos = { x = 0, y = 4 },
    rate = 0,
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,
     config = {extra = {Xmult = 2, triggers = 2}},
 loc_vars = function(self, info_queue, card)            
    end,
   
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                local current_hand_chips = hand_chips * 0.15
                return {
                    mult = current_hand_chips
                    message =  "+"..current_hand_chips.."",
                    colour = G.C.BLUE
                }
            end
    end,

}
SMODS.Sticker {
    key = "tr3s",
    badge_colour = HEX 'fda200',
    loc_txt = {
                name = "Trading III",
                text = {
                    "+#1# {C:blue}Port Tokens{} Per trigger.",
                },
                label = "Active Module (T3)"
    },
   atlas = "sticklas",
    pos = { x = 0, y = 4 },
    rate = 0,
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,
     config = {extra = {Xmult = 2, triggers = 2}},
 loc_vars = function(self, info_queue, card)            
    end,
   
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                local current_hand_chips = hand_chips * 0.15
                return {
                    mult = current_hand_chips
                    message =  "+"..current_hand_chips.."",
                    colour = G.C.BLUE
                }
            end
    end,

}
SMODS.Language {
    key = "hodor",
    label = "Hodor",
    font = 1
}
-- thanks yahimod for this
