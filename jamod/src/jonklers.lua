-- THIS IS THE PLACEHOLDER ATLAS!!!!!!!!!!!!!!!!!!!!
SMODS.Atlas {
key = "Jatlas",
path = "Jonklers/jatlas.png",
px = 70,
py = 94
}
SMODS.Sound {
    key = "getr",
    path = "music_jimbum.ogg",
     vol = 0.6,
    pitch = 0.7,
    
}
SMODS.Sound {
    key = "boop",
    path = "boop.ogg",
     vol = 0.6,
    pitch = 0.7
}
SMODS.Sound {
    key = "urpe",
    path = "purple.ogg",
     vol = 0.6,
    pitch = 0.7
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
    
    loc_txt = {
    name = "Spamtongs",
    text = {
        "{C:red,s:1.1}+#99#{} Mult",
    },
},
config = { extra = { mult = 99 }, },
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
    info_queue[#info_queue + 1] = { key = 'hc_vegeta_comment', set = 'Other' }
return { vars = { card.ability.extra.Xmult, card.ability.extra.mult } }
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
x_mult = card.ability.extra.Xmult
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
    info_queue[#info_queue + 1] = { key = 'hc_half_comment', set = 'Other' }
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
    info_queue[#info_queue + 1] = { key = 'hc_half_comment', set = 'Other' }
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
    config = { extra = {chips = 0, Xmult = 1, chip_mod = 8,  Xmult_gain = 0.1 }, },
    loc_txt = {
        name = '{E:1,s:0.9}Weenic{}',
        text = {
            "This card gains {C:blue}+#3#{} Chips for every scored card",
            "with a rank below a 6, and gains {X:red,C:white}X#4#{} Mult per card",
            "scored that has a rank above 6.",
            "{C:inactive}(Currently{} {C:blue}+#1#{} and {X:red,C:white}X#2#{}{C:inactive}.){} "
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod, card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
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
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED,
                message_card = card
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                x_mult = card.ability.extra.Xmult
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
    key = "dam", -- DAMN!!!!!!1!!
    atlas = 'bigzamn',
    pos = {x = 0, y = 0},
    rarity = 4,
    blueprint_compat = true,
    cost = 10,
    discovered = true,
    config = { extra = {chip_mod = 150, Xmult_gain = 1.5, chips = 1, Xmult = 1,  dollars = 10 }, },
    loc_txt = {
        name = 'bala{C:chips}DAMN!!!!!!{}',
        text = {
            "This card gains {C:blue}+#2#{} Chips and {X:red,C:white}X#4#{} Mult for every scored card.",
            "Played cards give {C:money}$10{} when scored.",
            "{C:inactive}(Currently{} {X:red,C:white}X#3#{} and {C:blue}+#1#{}{C:inactive}.){} "
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod, card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain

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
                x_mult = card.ability.extra.Xmult
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
SMODS.Joker{ --this joker quite literally does nothing
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
            "This card gains {X:red,C:white}X#1#{} Mult per {C:Attention}Vex Cube{} sold.",
            "{C:inactive}Currently{}{X:red,C:white}X#1#{}{C:incative}.{}",
        }
    },
    config = { extra = {creates = 2, Xmult = 1, Xmult_gain = 1 }, },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain, card.ability.extra.creates } }
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
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.ENHANCEMENT,
                message_card = card
                
            }
        end
        if context.joker_main then
            return{
                x_mult = card.ability.extra.Xmult
            }
            
        end
    end,
   
}
SMODS.Atlas {
    key = "sccre",--since jatlas fucks my code for some reason, i use this as a placeholder
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
return { vars = { card.ability.extra.Xmult } }
end,
calculate = function(self, card, context)
    if context.joker_main then
        return {
            message = "Briefcase!",
            x_mult = card.ability.extra.Xmult,
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
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_slander_comment', set = 'Other' }
    end,
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
        --made in jokerforge for refrence
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
    pos = {x = 3, y = 0},
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pools = {["halfjokes"] = true},
    loc_txt = {
        name = "Photo",
        text = {
            "All played face cards give {X:red,C:white}X#1#{} Mult."
        },
    },
    config = {extra = {Xmult = 1.3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_half_comment', set = 'Other' }
        return {vars = {card.ability.extra.Xmult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
                return {
                    x_mult = card.ability.extra.Xmult
                }
            end
        end
}
SMODS.Joker {
    key = "graph",
    atlas = "hatlas",
    pos = {x = 2, y = 0},
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pools = {["halfjokes"] = true},
    loc_txt = {
        name = "{E:1}Graph{}",
        text = {
            "All played non-face cards give {X:blue,C:white}X#1#{} chips."
        },
    },
    config = {extra = {xmult = 1.3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_half_comment', set = 'Other' }
        return {vars = {card.ability.extra.xchips}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.other_card:is_face() then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
        end
}
SMODS.Joker {
    key = "longasfname",
    atlas = "sccre",
    pos = {x = 0, y = 0},
    rarity = 'jabong_Max',
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    loc_txt = {
        name = "JTBCUTSSITLAKWCBN2SGL", 
        text = {
            "This card earns {X:money,C:white}$#1#{}. ",
            "Increases by {C:attention}#1#{} every time a face card is destroyed.",
            "{C;inactive}Currently{}{X:money,C:white}$#1#{}{C:inactive}.{}"
        },
    },
    config = { extra = { dollars = 1, increase = 5 } },
    loc_vars = function(self, info_queue, card)
        
        info_queue[#info_queue + 1] = { key = 'hc_longass_comment', set = 'Other' }
        return { vars = { card.ability.extra.increase, card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local face_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards > 0 then
        
                card.ability.extra.dollars = card.ability.extra.dollars + face_cards * card.ability.extra.increase
                return { message = "Upgraded!"}
            end
        end
        if context.end_of_round and context.main_eval and context.game_over == false then -- The game_over check is optional but recommended
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
                            play_sound( 'jabong_urpe')
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
SMODS.Atlas{
    key = "woke",
    path = "Jonklers/wokr.png",
    px = 71, 
    py = 95
}
SMODS.Joker {
    key = 'woker',
    atlas = "woke",
    pos = { x = 0 , y = 0},
    loc_txt = {
        name = "WOKEr!!!11!",
        text = {
            "All cards gain a random {C:attention}enhancement, Seal, and edition.{}"
        },
    },
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
           play_sound( 'jabong_womp')
    end
end
}
SMODS.Atlas{
    key = "ipod",
    path = "Jonklers/dingus.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "screaming",
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
     config = { extra = { chip_gain = 1, chips = 0  }, },
     loc_vars = function(self, info_queue, card)
        return {  { vars = { card.ability.extra.chip_gain, card.ability.extra.chips } }}
     end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    card.ability.extra.chips == card.ability.extra.chips + card.ability.extra.chip_gain,
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
SMODS.Atlas{
    key = "guball",
    path = "Jonklers/benson.png",
    px = 71,
    py = 95,
}
SMODS.Joker {
    key = "benson",
    atlas = "guball",
    pos = { x = 0, y = 0},
    loc_txt = {
        name = "Regular gumball machine with no anger issues",
        text = {
            "{C:attention}Disables{} the boss blind when it's selected.",
            "Should you not be in a disableable blind, {X:red,C:white}X#1#{} mult."
        },
    },
    rarity = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { odds = 4, Xmult = 100  }, },
    loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'jabong_benson')
    return { vars = { numerator, denominator, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
            if context.joker_main and not G.GAME.blind.disabled then
 return{
    x_mult = card.ability.extra.Xmult,
    message = "MORDECAI AND RIGBY"
 }
end
if context.setting_blind and not context.blueprint and context.blind.boss then
return {
     G.E_MANAGER:add_event(Event({
                func = function()
                    -- yay im finally learning how to use G.E_MANAGER!!!!!
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.blind:disable()
                            play_sound('timpani')
                            delay(0.4)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
                    return true
                end
            })),
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
SMODS.Atlas {
    key = "thehoooo",
    path = "Jonklers/fisher.png",
    px = 142,
    py = 190
}
SMODS.Joker {
    key = 'fisherman',
  atlas = 'thehoooo',
  pos = {x = 0, y = 0},
  rarity = 'jabong_Max',
  blueprint_compat = true,
  cost = 10,
  discovered = true,
  loc_txt = {
    name = "Fisherman",
    text = {
        "{C:attention}During the scoring step:{}",
        "Go fish. {C:deactivated}({}{C:green}#1# in #2#{}{C:deactivated} chance of a catch{})"
    },
  },
  config = { extra = { odds = 2, creates = 1}, },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'jabong_fisherman')
    return { vars = { numerator, denominator, card.ability.extra.creates } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and SMODS.pseudorandom_probability(card, 'jabong_fisherman', 1, card.ability.extra.odds) then
    SMODS.add_card {
              set = "jabong_fish",
               edition = 'e_negative' 
         }
        return {
                message = "caught!",
                colour = G.C.BLUE,
            }
        elseif context.joker_main  then
        return{
            play_sound('jabong_womp'),
            message = "Nope!",
            colour = G.C.TAROT,
        }
        
    end
  end
}
SMODS.Atlas {
    key = "redit",
    path = "Jonklers/credinbuffoon.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "balatroreddit",
    atlas = "redit",
    pos = { x = 0, y = 0},
    loc_txt = {
        name = "Credit card in the Buffoon Pack",
        text  = {
          "Opening a {C:attention}Booster Pack{} will create",
          "A {C:negative}Negative{} Credit card.",
          "{C:inactive}Blueprint ante 1 shop{}"  
        },
    },
    rarity = 2,
    blueprint_compat = true,
    cost = 10,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_credit_card
    end,
    calculate = function(self, card, context)
        if context.open_booster and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        SMODS.add_card {
                            key = 'j_credit_card',
                            edition = 'e_negative'
                        }
                        G.GAME.joker_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = "credit card",
                    colour = G.C.PURPLE,
                }
            end

    end,
}
SMODS.Joker {
    key = "basspro", --alias go do this one
    atlas = "sccre",
    pos = { x = 0, y = 0},
    rarity = "jabong_Feesh",
    blueprint_compat = true,
    cost = 10,
    discovered = true,
    loc_txt = {
        name = "Bass Pro Joker",
        text = {
            'Every {C:attention}fish{} you have gives {X:red,C:white}X#1#{} mult.'
        },
    },
     config = { extra = { Xmult = 1.5 } },
     loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.other_consumeable and context.other_consumeable.ability.set == 'jabong_fish' then
            return {
                x_mult = card.ability.extra.Xmult,
                message_card = context.other_consumeable
            }
        end
    end,
  

}
SMODS.Joker{
    key = "dingus",
    atlas = "ipod",
    pos = { x = 0, y = 0},
    loc_txt = {
        name = "Stupid Dingus",
        text = {
            "This card gains {C:red}+#1#{} Mult and {C:blue}-#2#{} chips",
            "Per {C:attention}non-scoring{} card played."
        },
    },
    config = {extra = { mult_gain = 5, chip_gain = 2, mult = 1, chips = 0, }},
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.mult_gain, 
            card.ability.extra.chip_gain, 
            card.ability.extra.mult,
            card.ability.extra.chips
    }}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == "unscored" then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_gain
            return{
                message = "Upgraded!",
                colour = G.C.RED
            }
        end
    if context.joker_main then
        return{
            mult = card.ability.extra.mult,
            chips = card.ability.extra.chips
        }
    end
    end

}
SMODS.Atlas {
    key = 'lyth',
    path = "Jonklers/60.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "lytherorefrence",
    atlas = "lyth",
    pos = { x = 0, y = 0},
    loc_txt = {
        name = "60 on a Public street",
        text = {
            "If played hand contains a {C:attention}6{} and a {C:attention}0{},",
            "Creates #4# random {C:dark_edition}negative{} Spectral Cards."
        },
    },
    rarity = 2,
    blueprint_compat = true,
    cost = 10,
    discovered = true,
    config = {extra = { creates = 4 }},
    calculate = function(self, card, context)
		if context.joker_main then
            local six = false
            local andz = false


            for i = 1, #context.scoring_hand do
				if context.full_hand[i]:get_id() == 6 then
                    six = true
                end
                if context.full_hand[i]:get_id() == SMODS.Ranks['jabong_Zero'].id then
                    andz = true
                end
            end

            if six == true and andz == true then   
                 local cards_to_create = math.min(card.ability.extra.creates,
                G.jokers.config.card_limit - (#G.consumeables.cards + G.GAME.consumeable_buffer))
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + cards_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, cards_to_create do
                        SMODS.add_card {
                            set = 'Spectral', 
                            edition = "e_negative" 
                        }
                        G.GAME.consumeable_buffer = 0
                    end
                    return true
                end
            }))
           
			return {
				message = "60 ON A PUBLIC STREET?????"
			}
            end
		end
        if context.cardarea == G.play and context.individual and context.other_card then
            local rank = context.other_card:get_id()
			if rank == 6 then
				return {
                    message = '6!',
                }
			end
            if rank == SMODS.Ranks['jabong_Zero'].id then
				return {
                    message = '0!',
                }
			end
		end

    end,

}
SMODS.Joker {
    key = "thebrontjame",
    atlas = "sccre",
    pos = {x = 0 , y = 0},
    rarity = 3,
    blueprint_compat = true,
    cost = 6,
    discovered = true,
    loc_txt = {
        name = "High school Basketball player",
        text = {
            "{X:inactive,C:white}^#1#{} chips.",
            "This card instead does {C:negative,E:1,s:1.4}fucking nothing{} if played hand has a seal.",
            "{C:inactive}why did I ever think of making this{}"
        }
    },
    config = {extra = {Echips = 5}},
    loc_vars = function(self, info_queue, card)
        return {card.ability.extra.Echips}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if card.seal == nil then
                return{
                    echips = card.ability.extra.Echips
                }
            elseif not card.seal == nil then
                return {
                    message = "Nope!",
                }
            end
        end
    end
}
SMODS.Joker {
    key = "jimbyramid",
    atlas = "sccre",
    pos = { x = 0 , y = 0},
    rarity = 3,
    blueprint_compat = true,
    cost = 5,
    discovered = true,
    config = {extra = {Xmult_gain = 0.5, Xmult = 1}},
    loc_vars = function(self, info_queue, card)
          info_queue[#info_queue + 1] = { key = 'hc_slander_comment', set = 'Other' }
        return {card.ability.extra.Xmult_gain, card.ability.extra.Xmult}
    end,
    loc_txt = {
        name = "Jimbonium",
        text = {
            "This card gains {X:red,C:white}X#1#{} Mult per",
            "hand played with a level {C:attention}less than or equal to 1{}.",
            "{C:inactive}Currently{} {X:red,C:white}X#1#{}{C:inactive}.{}"
        },
    },
    calculate = function(self, card, context)
    
        if context.before then
            local passed = false
                for k, v in pairs(G.GAME.hands) do
                    if SMODS.is_poker_hand_visible(k) and v.level > G.GAME.hands[context.scoring_name].level then
                    passed = true
                    end
                end
        if passed then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            return{
                message = "Upgraded!",
                colour = G.C.RED
            }
        end
    end
    if context.individual and context.cardarea == G.play then
            return{
                x_mult = card.ability.extra.xmult
            }
        end
end,



}
SMODS.Joker {
    key = "nill",
    loc_txt = {
        name = "Nil Joker",
        text = {
            "Every played {C:attention}0{} gives",
            "{C:red}+#1#{} Mult."
        }
    },
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    atlas = "sccre",
    pos = { x = 0, y = 0 },
    config = { extra = { Mult = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == SMODS.Ranks['jabong_Zero'].id then
            return {
                mult = card.ability.extra.Mult
            }
        end
        
end,
    
}
SMODS.Atlas {
    key = "mrbalala",
    path = "Jonklers/quatro.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "espanol",
    loc_txt = {
        name = "balatro bala{C:attention,s:1.1,E:1}Cuatro{}",
        text = {
            "{C:inactive}(get it? cuz balatro balaTREZ?){}",
            "Este comodin obtiene un multiplicador de {X:inactive,C:white}^#1#{}, compuesto,",
            "por cada carta puntuada.",
            "(actualmente {X:incative,C:white}^#2#){}"
        }
    },
    config = {extra = {Emult_mod = 2, Emult = 2}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Emult_mod, card.ability.extra.Emult } }
    end,
    blueprint_compat = true,
    rarity = "jabong_Max",
    cost = 25,
    atlas = "mrbalala",
    pos = { x = 0, y = 0 },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            card.ability.extra.Emult = card.ability.extra.Emult * card.ability.extra.Emult_mod

            return {
                message = "Mejorado!",
                colour = G.C.ENHANCEMENT,
                message_card = card
                
            }
            
        end
        if context.joker_main then
            return {
                emult = card.ability.extra.Emult
                
            }
        end
    end,

    
}
SMODS.Atlas {
    key = "flash",
    path = "flash.png",
    px = 71,
    py = 95,
}
SMODS.Joker {
    key = "thecreator",
    atlas = "flash",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = "{E:1,C:edition,s:1.2}FLASH{} {s:0.8}(its actually me jabon ggratis)",
        text = {
            "Creates {C:attention}#2#{} random Jokers on blind selection",
            "{C:dark_edition}Every joker and fucking consumable{} gives {X:inactive,C:white}^#1#{} Mult.",
            "{C:inactive}the obligatory self-insert card{}"
        }
    },
     rarity = 'jabong_Max',
     blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = {extra = {Emult = 5, creates = 3}},
    loc_vars = function(self, info_queue, card)
        return{
            card.ability.extra.Emult,
            card.ability.extra.creates
        }
    end,
    calculate = function(self, card, context)
        if context.other_consumeable then
            return {
                emult = card.ability.extra.Emult,
                message_card = context.other_consumeable
            }
        end
        if context.other_joker then
            return {
                emult = card.ability.extra.Emult,
                message_card = context.other_joker
            }
        end
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local jokers_to_create = math.min(card.ability.extra.creates,
                G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            set = 'Joker',
                            edition = "e_negative" 
                        }
                                   play_sound('jabong_oh')
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
    end,
}
SMODS.Joker:take_ownership('joker', -- make jimbo great(er) this is def not just a test for take_ownership
    { 
	cost = 5,
    config = {extra = {Xmult = 50}},
    loc_vars = function (self, info_queue, card)
        return{
            card.ability.extra.Xmult
        }
    end,
	calculate = function(self, card, context)
        if context.joker_main then
            return{
        x_mult = card.ability.extra.Xmult
            }
           
        end
	end
    },
    true 
)
SMODS.Joker:take_ownership('midas_mask', 
    { 
	cost = 5,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local numbr = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                    numbr = numbr + 1 
                    scored_card:set_ability('m_gold', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound( 'jabong_damn')
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
        end
    },
    true 
)



--maybe i fixed it, we shall see
SMODS.Joker {
    key = "thecringler",
    atlas = "sccre",
    blueprint_compat = true,
    rarity = 4,
    cost = 25,
    pos = { x = 0, y = 0},
    loc_txt = {
        name = "Bock and suskin",
        text = {
            "Retriggers all played {C:attention}face cards{}. Increases by {C:attention}#1#{} per one-shot.",
            "{C:inacive}Currently{} {C:attention}#1#{}{C:inactive}.{}",
            "{C:inactive}...{}",
            "{C:inactive}hey wait a fucking minute-{}"
        }
    },
    config = {extra = {repetitions = 1, addon = 1}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_slander_comment', set = 'Other' }
        return{
            card.ability.extra.repetitions,
            card.ability.extra.addon
        }
    end,
    calculate = function(self, card, context)
        if context.repetitions and context.cardarea == G.play and context.other_card:is_face() then
            return{
                repetitions = card.ability.extra.repetitions,
                message = "Again!"
            }
        end
        if SMODS.last_hand_oneshot and context.end_of_round and context.main_eval and context.game_over == false then
            card.ability.extra.repetitions = card.ability.extra.repetitions + card.ability.extra.addon
           return{ message = "Upgrade!", colour = G.C.ATTENTION}
           
        end
    end
} 
SMODS.Joker{
    key = "beemovie",
    atlas = "sccre",
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = "Movie Script",
        text = {
            "{X:red,C:white}X#1#{} Mult, but this card has",
            "an {C:dark_edition}Absoultley fucking absurd{} tooltip.",
            "{C:inactive}you are not ready :3{}"
        }
    },
    cost = 5,
    rarity = 2,
    config = {extra = {Xmult = 500}},
    loc_vars = function (self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'hc_bee_comment', set = 'Other' } --according to all known laws of
        return{
            card.ability.extra.Xmult
        }
    end,
	calculate = function(self, card, context)
        if context.joker_main then
            return{
        x_mult = card.ability.extra.Xmult
            }
           
        end
	end
}
SMODS.Joker{
key = "hanging",
    atlas = "hatlas",
    pos = {x = 0, y = 0},
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pools = {["halfjokes"] = true},
    loc_txt = {
        name = "Hanging",
        text = {
            "Retriggers the {C:attention}first and last{}",
            "played cards in a hand {C:attention}#1#{} time"
        },
    },
    config = {extra = {repetitions = 1}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_half_comment', set = 'Other' }
        return {vars = {card.ability.extra.repetitions}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
            return {
                repetitions = card.ability.extra.repetitions,
                message = "Ag"
            }
        end
        if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[#context.scoring_hand] then
            return {
                repetitions = card.ability.extra.repetitions,
                message = "Ag"
            }
        end
    end
}
SMODS.Joker{
key = "chard",
    atlas = "hatlas",
    pos = {x = 1, y = 0},
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pools = {["halfjokes"] = true},
    loc_txt = {
        name = "Chad",
        text = {
            "Retriggers the played cards in a hand that ARENT",
            "the {C:attention}first and last{} {C:attention}#1#{} time"
        },
    },
    config = {extra = {repetitions = 1}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'hc_half_comment', set = 'Other' }
              info_queue[#info_queue + 1] = { key = 'hc_slander_comment', set = 'Other' }
        return {vars = {card.ability.extra.repetitions}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and not context.other_card == context.scoring_hand[1] then
            return {
                repetitions = card.ability.extra.repetitions,
                message = "ain!"
            }
        end
        if context.repetition and context.cardarea == G.play and not context.other_card == context.scoring_hand[#context.scoring_hand] then
            return {
                repetitions = card.ability.extra.repetitions,
                message = "ain!"
            }
        end
    end
} 
--next joker: DIVER
-- ^20 mult 
-- changes the boss blind music to DIVER by nico touches the walls
-- designed for naneinf motivation (and to see who can time it to the drop)