-- THIS IS THE PLACEHOLDER ATLAS!!!!!!!!!!!!!!!!!!!!
SMODS.Atlas {
key = "Jatlas",
path = "Jonklers/jatlas.png",
px = 70,
py = 94
}
SMODS.Atlas {
    key = "hatlas",
    path = "Jonklers/hatlas.png",
    px = 71,
    py = 95
}
SMODS.ObjectType ({
key = "halfjokes",
default  = "j_joker",
cards = {},
inject = function(self)
SMODS.ObjectType.inject(self)
end,
})
SMODS.Joker {
    key = "tongs",
    atlas = "Jatlas",
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    discovered = true,
    config = { extra = { mult = 99 }, },
    loc_txt = {
    name = "Spamtongs",
    text = {
        "{C:red,s:1.1}+#99#{} Mult",
    },
},
loc_vars = function(self, info_queue, card)
return { vars = { card.ability.extra.mult } }
end,
calculate = function(self, card, context)
if context.joker_main then
return {
message = "wow cool this works",
mult = card.ability.extra.mult
}
end
end
}
SMODS.Atlas{
key = "vejoke",
px = 70,
py = 94,
path = "vegeta/vegeta.png"
}
SMODS.Joker{
key = "vegeta",
atlas = "vejoke",
pos = { x = 0, y = 0 },
rarity =3,
blueprint_compat = true,
cost = 2,
discovered = true,
config = { extra = { mult = 10, Xmult = 2, suit = "Hearts" }, },
loc_vars = function(self, info_queue, card)
return { vars = { card.ability.extra.xmult, card.ability.extra.mult } }
end,
calculate = function(self, card, context)
if context.individual and context.cardarea == G.play and
context.other_card:is_suit(card.ability.extra.suit) then
return {
mult = card.ability.extra.mult
}
end
if context.joker_main and G.GAME.current_round.hands_left >= 0 then
return {
message = "Smort",
Xmult = card.ability.extra.xmult
}
end
end,

}
SMODS.Joker {
key = "buskin",
atlas = "hatlas",
pos = { x = 1, y = 1 },
rarity = 2,
pools = {["halfjokes"] = true},
blueprint_compat = true,
cost = 4,
discovered = true,
config = { extra = { odds = 2, repetitions = 1}, },
loc_txt = {
name = "Buskin",
text = {
"{C:green,s:1.1} #1# in #2#{} chance to ",
"{C:attention}Retrigger{} all face cards once."
},
},
loc_vars = function(self, info_queue, card)
local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'jabong_buskin')
return { vars = { numerator, denominator } }
end,
calculate = function(self, card, context)
if context.repetition and context.cardarea == G.play and context.other_card:is_face() and SMODS.pseudorandom_probability(card, 'jabong_buskin', 1, card.ability.extra.odds) then
return {
message = "ain!",
repetitions = card.ability.extra.repetitions,
}
end
end
}
SMODS.Joker {
key = "sock",
atlas = "hatlas",
pos = { x = 0, y = 1 },
rarity = 2,
pools = {["halfjokes"] = true},
blueprint_compat = true,
cost = 4,
discovered = true,
config = { extra = { odds = 2, repetitions = 1 }, },
loc_txt = {
name = "Sock",
text = {
"{C:green,s:1.1} #1# in #2#{} chance to ",
"{C:attention}Retrigger{} all numbered cards once."
},
},
loc_vars = function(self, info_queue, card)
local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'jabong_sock')
return { vars = { numerator, denominator } }
end,
calculate = function(self, card, context)
if context.repetition and context.cardarea == G.play and not context.other_card:is_face() and SMODS.pseudorandom_probability(card, 'jabong_sock', 1, card.ability.extra.odds) then
return {
repetitions = card.ability.extra.repetitions,
message = "Ag",
}
end
end
}
SMODS.Atlas {
    key = 'lildude',
    path = 'Jonklers/weenic.png',
    px = 71,
    py  = 95
}
SMODS.Joker{
    key = "weenic",
    atlas = 'lildude',
    pos = {x = 0, y = 0},
    rarity = 3,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = {chips = 0, xmult = 1, chip_mod = 8,  xmult_gain = 0.1 }, },
    loc_txt = {
        name = 'Weenic',
        text = {
            "This card gains {C:blue}+8{} Chips for every scored card",
            "with a rank below a 6, and gains {X:red,C:white}X0.1{} Mult per card",
            "scored that has a rank above 6.",
            "{C:inactive}(Currently{} {C:blue}X#1#{} and {C:red}+#1#{}{C:inactive}.){} "
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod, card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() <= 6 and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                message_card = card
            }
        end
        if context.individual and context.cardarea == G.play and context.other_card:get_id() >= 6 and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED,
                message_card = card
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                xmult = card.ability.extra.xmult
            }
        end
    end,
}
SMODS.Atlas{
    key = 'bigzamn',
    path = "Jonklers/zam.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "zam", -- DAMN!!!!!!1!!
    atlas = 'bigzamn',
    pos = {x = 0, y = 0},
    rarity = 4,
    blueprint_compat = true,
    cost = 10,
    discovered = true,
    config = { extra = {chip_mod = 150, xmult_gain = 2, chips = 0, xmult = 1,  dollars = 10 }, },
    loc_txt = {
        name = 'Big Zam',
        text = {
            "This card gains {C:blue}+#1#{} Chips and {X:red,C:white}X#1#{} Mult for every scored card.",
            "Played cards give {C:money}$10{} when  scored.",
            "{C:inactive}(Currently{} {C:red}X#1#{} and {C:blue}+#1#{}{C:inactive}.){} "
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod, card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.ENHANCEMENT,
                dollars = card.ability.extra.dollars,
                message_card = card
                
            }
            
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                xmult = card.ability.extra.xmult
            }
        end
    end,
    --im losing my mind the more  i make this mod'
    -- is this a curse?
}
--nvm
SMODS.Atlas {
    key = "thingy",
    path = "Jonklers/vexcube.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "vexcube",
    atlas = "thingy",
    pos = {x = 0, y = 0},
    rarity = 1,
    blueprint_compat = false,
    cost = 1,
    discovered = true,
    loc_txt = {
        Name = "Vex Cube",
        text = {
            "{C:inactive}Does Nothing.{}"
        }
    },
    in_pool = function(self, args)
    return false
end,
}
SMODS.Joker {
    key = "Oracle",
    atlas = 'Orcl',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    rarity = 3,
    blueprint_compat = true,
    cost = 10,
    discovered = true,
    loc_txt = {
        name = "Oracle",
        text = {
            "Creates 2 {C:attention}Vex Cube{} jokers on blind selection.",
            "This card gains {X:red,C:white}X#1#{} mult per vex cube sold.",
            "{C:inactive}Currently{}{X:red,C:white}X#1#{}{C:incative}.{}",
        }
    },
    config = { extra = {creates = 2, xmult = 1, xmult_gain = 1 }, },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain, card.ability.extra.creates } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local jokers_to_create = math.min(card.ability.extra.creates,
                G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            key = "j_jabong_vexcube",
                            edition = 'e_negative' 
                        }
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
        if context.selling_card and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.ENHANCEMENT,
                message_card = card
                
            }
        end
        if context.joker_main then
            xmult = card.ability.extra.xmult
        end
    end,
   
}
SMODS.Atlas {
    key = "sccre",
    path = "Jonklers/scre.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "Orcl",
    path = "Jonklers/Oracle.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "teamfort",
    path = "Jonklers/intel.png",
    px = 71,
    py = 95
}
SMODS.Joker {
  key = 'intelligence',
atlas = 'teamfort',
pos = {x = 0, y = 0},
rarity = 4,
blueprint_compat = true,
cost = 20, 
discovered = true,
config = { extra = {xmult = 100,}, },
loc_vars = function(self, info_queue, card)
return { vars = { card.ability.extra.xmult } }
end,
calculate = function(self, card, context)
    if context.joker_main then
        return {
            message = "Briefcase!",
            xmult = card.ability.extra.xmult,
            emult = 100,
        }
    end

end

}

SMODS.Atlas {
    key = 'rocks',
    path = "Jonklers/rockbs.png",
    px = 71,
    py = 95
}
--doesnt work
SMODS.Joker {
    key = "rockandbuskin",
    unlocked = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'rocks',
    pos = { x = 0, y = 0 },
    config = { extra = { repetitions = 1 } },
    calculate = function(self, card, context)
  
        if context.repetition and context.cardarea == G.play then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end,
}
SMODS.Joker{
    -- im so sorry my man but this was too funny
    key = 'cross',
    loc_txt= {
        name = 'Another week boys, and another TWAB',
    
        text = { 
        "Played cards gain {C:red}+#1#{} mult",
        "every time they are scored."
        }

    },
    atlas = 'azte',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    config = { extra = {  
        --made in jokerofgre for refrence
        addedmult = 1,
            perma_mult = 0
        } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.addedmult, card.ability.extra.perma_mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                card.ability.extra.addedmult
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
            }
        end
    end
}
SMODS.Joker {
    key = "photo",
    atlas = "hatlas",
    pos = {x = 2, y = 0},
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    loc_txt = {
        name = "photo",
        text = {
            "All played face cards give {X:red,C:white}X#1#{} mult."
        },
    },
    config = {extra = {xmult = 1.3}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
}
SMODS.Joker {
    key = "graph",
    atlas = "hatlas",
    pos = {x = 3, y = 0},
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    loc_txt = {
        name = "Graph",
        text = {
            "All played non-face cards give {X:blue,C:white}X#1#{} chips."
        },
    },
    config = {extra = {xmult = 1.3}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.other_card:is_face() then
                return {
                    xmult = card.ability.extra.xchips
                }
            end
        end
}
SMODS.Joker {
    key = "longasfname",
    atlas = "sccre",
    pos = {x = 0, y = 0},
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    loc_txt = {
        name = "Joker that's been Soaked, Crumpled, ripped, folded on one corner and kissed with coral number 4 blue lip gloss.",
        text = {
            "This card earns {X:money,C:white}$#1#{} every time a face card is destroyed.",
            "{C;inactive}Currently{}{X:money,C:white}$#1#{}{C:inactive}.{}"
        },
    },
    config = { extra = { dollars = 1, increase = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.increase, card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local face_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards > 0 then
                -- See note about SMODS Scaling Manipulation on the wiki
                card.ability.extra.dollars = card.ability.extra.dollars + face_cards * card.ability.extra.increase
                return { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } } }
            end
        end
        if context.end_of_round then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end,
}
SMODS.Atlas {
    key = 'gomer',
    path = 'Jonklers/purple.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "homer",
    atlas = 'gomer',
    pos = {x = 0, y = 0},
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    loc_txt = {
        name = "Purple Homer",
        text = {
            "{C:negative}purple{}"
        },
    },
    pos = { x = 0, y = 13 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_jabong_ourple
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local numbr = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if  not scored_card:is_face() then
                    numbr = numbr + 1 
                    scored_card:set_ability('m_jabong_ourple', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if numbr > 0 then
                return {
                    message = "purple",
                    colour = G.C.TAROT
                }
            end
        end
    end
}
SMODS.Joker {
    key = 'woker',
    atlas = "sccre",
    pos = { x = 0 , y = 0},
    loc_txt = {
        name = "WOKEr",
        text = {
            "All cards gain a random {C:attention}enhancement, Seal, and edition.{}"
        },
    },
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
             local crads = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                      crads = crads + 1 
                      -- jank ass code made in jokerforge cuz im very sure ill fuck it up if i manual this shit
                local enhancement_pool = {}
             for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                if enhancement.key ~= 'm_stone' then
                    enhancement_pool[#enhancement_pool + 1] = enhancement
                end
            end
            local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
            context.other_card:set_ability(random_enhancement)
            local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
            if random_seal then
                context.other_card:set_seal(random_seal, true)
            end
            local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
            if random_edition then
                context.other_card:set_edition(random_edition, true)
            end
        end
        if crads > 0 then
                return {
                    message = "randomized!",
                    colour = G.C.TAROT
                }
            end
        end
    end
}
SMODS.Joker {
    key = "idiot",
    atlas = "sccre",
    pos = { x = 0, y = 0},
    loc_txt = {
        name = "Stupid Ass Joker",
        text = {
            "This card gains {C:blue}+#1#{} chips per card scored.",
            "{C:inacive}Currently{}{C:blue}+#1#{}{C:incative}. WHY DID I MAKE THIS{}"
        },
    },
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
     config = { extra = { chip_mod = 0.5, chips = 0  }, },
     loc_vars = function(self, info_queue, card)
        return {  { vars = { card.ability.extra.chip_mod, card.ability.extra.chips } }}
     end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    card.ability.extra.chips == card.ability.extra.chips + card.ability.extra.chip_mod,
                    message = "ae",
                    colour = G.C.BLUE
                }
            end
            if context.joker_main then
                return{
                    chips = card.ability.extra.chips
                }
            end
        end
}
SMODS.Joker {
    key = "benson",
    atlas = "sccre",
    pos = { x = 0, y = 0},
    loc_txt = {
        name = "Regular gumball machine with no anger issues",
        text = {
            "{C:green}#1# in #1#{} chance to {C:attention}disable{} the boss blind.",
            "Should this fail, {X:red,C:white}X#1#{} mult."
        },
    },
    rarity = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { odds = 4, xmult = 100  }, },
    loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'jabong_benson')
    return { vars = { numerator, denominator, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
if context.setting_blind and not context.blueprint and context.blind.boss and SMODS.pseudorandom_probability(card, 'jabong_benson', 1, card.ability.extra.odds) then
return {
     G.E_MANAGER:add_event(Event({
                func = function()
                    -- yay im finally learning how to use G.E_MANAGER!!!!!
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.blind:disable()
                            play_sound('')
                            delay(0.4)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
                    return true
                end
            })),
            -- apparently this stops crazy shit from happening.
        } 
        end
        return nil, true --if this dont work get rid of it it surely wont cause any bugs
    end,
    add_to_deck = function(self, card, from_debuff)
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.GAME.blind:disable()
            play_sound('timpani')
         SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
        end
    end
}
if context.joker_main and not G.GAME.blind.disabled then
 return{
    xmult = card.ability.extra.xmult
 }
end
SMODS.Rarity {
    key = "Feesh",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.00,
    badge_colour = HEX('ADD8E6'),
    loc_txt = {
        name = "Fishing"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
SMODS.Joker {
    key = 'fisherman',
  atlas = 'gojo',
  pos = {x = 0, y = 0},
  rarity = 'jabong_Max',
  blueprint_compat = true,
  cost = 10,
  discovered = true,
  loc_txt = {
    name = "Fisherman"
    text = {
        "{C:attention}On blind Selection:{}",
        "Go fish. {C:deactivated}({}{C:green}#1# in #1#{}{C:deactivated} chance of a catch{})"
    },
  },
  config = { extra = { odds = 2, creates = 1}, },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'jabong_fisherman')
    return { vars = { numerator, denominator, card.ability.extra.creates } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind and SMODS.pseudorandom_probability(card, 'jabong_fisherman', 1, card.ability.extra.odds) then
    SMODS.add_card {
              set = "jabong_fish",
               edition = 'e_negative' 
         }
        return {
                message = "caught!",
                colour = G.C.BLUE,
            }
    else
        return{
            play_sound('jabong_womp'),
            message = "Nope!",
            colour = G.C.TAROT,
        }
        
    end
  end
}
