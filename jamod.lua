--  THE mod's ID is still jamod cuz im lazy and dont wanna break anything
-- any addtiions that use the mod id do NOT go under BALAAL, they go under jabong
-- cuz that was the orginal name
-- so yeah
if not jamod then
	jamod = {}
end
local mod_path = "" .. SMODS.current_mod.path
jamod.path = mod_path
jamod_config = SMODS.current_mod.config

assert(SMODS.load_file("jamod/src/blinds.lua"))()
assert(SMODS.load_file("jamod/src/balatroicon.lua"))()
assert(SMODS.load_file("jamod/src/seals.lua"))()
assert(SMODS.load_file("jamod/src/backs.lua"))()
assert(SMODS.load_file("jamod/src/basiccs.lua"))()
assert(SMODS.load_file("jamod/src/jonklers.lua"))()
assert(SMODS.load_file("jamod/src/MAXIMIZED.lua"))()
assert(SMODS.load_file("jamod/src/enhacnements.lua"))()
assert(SMODS.load_file("jamod/src/utube.lua"))()
assert(SMODS.load_file("jamod/src/web.lua"))()
assert(SMODS.load_file("config.lua"))()
SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    quantum_enhancements = true,
}
local someshitTabs = function()
	return {
		{
			label = localize("jabong_set_music"),
			tab_definition_function = function()
				jabong_nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							--{n=G.UIT.O, config={object = DynaText({string = "", colours = {G.C.WHITE}, shadow = true, scale = 0.4})}},
						},
					},
				}
				settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
				settings.nodes[#settings.nodes + 1] = create_toggle({
					active_colour = G.C.RED,
					label = localize("jabong_mus_getarnd"),
					ref_table = jamod_config.jamod,
					ref_value = "jimbum_music",
				})
				config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { settings } }
				jabong_nodes[#jabong_nodes + 1] = config
				return {
					n = G.UIT.ROOT,
					config = {
						emboss = 0.05,
						minh = 6,
						r = 0.1,
						minw = 10,
						align = "cm",
						padding = 0.2,
						colour = G.C.BLACK,
					},
					nodes = jabong_nodes,
				}
			end,
		},
	}
end
SMODS.current_mod.extra_tabs = someshitTabs

-- thanks cryptid
local creditspage = {
        "Jabon Gratis",
        "(basically the whole damn mod)",
		"",
        "RandomizedAlias",
        "Some art",
		"",
		"Vo Memes",
        "Creator of SPOOP: SeaWEED delivery",
		"",
		"Bandai Namco Filmworks",
        "Gundam ost (Vigilante)",
		"(Please note it's not fully implimented yet so you wont hear it)",
        "",
        "Bungie, Inc.",
        "Created halo and destiny 2",
        "",
        "And you",
        "thanks for playing this fuckin mess"
    }
    --and thanks yahi too ig
SMODS.current_mod.extra_tabs = function() --Credits tab
    local scale = 0.5
    return {
        label = "Credits",
        tab_definition_function = function()
        return {
            n = G.UIT.ROOT,
            config = {
            align = "cm",
            padding = 0.05,
            colour = G.C.CLEAR,
            },
            nodes = {
                {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Mod Director:",
                    shadow = false,
                    scale = scale*0.66,
                    colour = G.C.INACTIVE
                    }
                },
                }
            },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Jabon gratis (hey its me)",
                    shadow = false,
                    scale = scale*2,
                    colour = G.C.PURPLE
                    }
                }
                }
            },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "an increasingly small amount of art from:",
                    shadow = false,
                    scale = scale*0.66,
                    colour = G.C.INACTIVE
                    }
                },
                }
            },
            {
                n = G.UIT.R,
                config = {
                    padding = 0,
                    align = "cm"
                },
                nodes = {
                    {
                    n = G.UIT.T,
                    config = {
                        text = "RandomizedAlias",
                        shadow = false,
                        scale = scale,
                        colour = G.C.MONEY
                    }
                    },
                }
                },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Slander towards",
                    shadow = false,
                    scale = scale*0.66,
                    colour = G.C.INACTIVE
                    }
                }
                },
            },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "alias (for fucking up the intial mod)",
                    shadow = false,
                    scale = scale,
                    colour = G.C.GREEN
                    }
                }
                } 
            },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Music from",
                    shadow = false,
                    scale = scale*0.66,
                    colour = G.C.INACTIVE
                    }
                }
                } 
            },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Vigilante - Sawano Hiroyuki [nZK]",
                    shadow = false,
                    scale = scale*0.75,
                    colour = G.C.RED
                    }
                }
                } 
            },
			{
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Special thanks:",
                    shadow = false,
                    scale = scale*0.66,
                    colour = G.C.INACTIVE
                    }
                }
                } 
            },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "the GOATS at the balatro Discord",
                    shadow = false,
                    scale = scale*0.66,
                    colour = G.C.BLUE
                    }
                }
                } 
            }
            }
        }
        end
    }
end

-- misc

SMODS.Achievement {
    key = "fishtim",
    loc_txt = {
        name = "Fishing time!",
        description = {
            "Obtain the fishing voucher"
        }
    },
    pos = { x = 1, y = 0 }, 
    hidden_pos = { x = 0, y = 0 },
    unlock_condition = function(self, args)
      if args.type == "ach_fishing" then return true end
    end,
}
SMODS.Achievement {
    key = "gunderm",
    loc_txt = {
        name = "ITS A GUNDAM!!!!!!!!",
        description = {
            "Get a gundam"
        }
    },
    pos = { x = 1, y = 0 }, 
    hidden_pos = { x = 0, y = 0 },
    unlock_condition = function(self, args)
      if args.type == "ach_gund" then return true end
    end,
}
SMODS.Achievement {
    key = "hell",
    loc_txt = {
        name = "the discarding of all that is considered normal with balatro",
        description = {
            "Use AWAKENING once"
        }
    },
    pos = { x = 1, y = 0 }, 
    hidden_pos = { x = 0, y = 0 },
    unlock_condition = function(self, args)
      if args.type == "ach_awaken" then return true end
    end,
}
SMODS.Challenge {
    key = 'zamnnnnn',
    jokers = {
        { id = 'j_jabong_zam', eternal = true },
        { id = "j_hanging_chad", edition = "negative"},


    },
    loc_txt = {
        name = "ZAMnnn!!!!"
    },
    restrictions = {
        banned_other = {
            { id = 'bl_plant', type = 'blind' },
           
        },
        banned_cards = {
             {id = "j_certificate", },
             {id = "j_marble", },
             {id = "c_grim"},
             {id = "c_incantation"},
             {id = "c_familiar"},
             { id = 'v_magic_trick' },
             { id = 'v_illusion' },
             { id = 'p_standard_normal_1', ids = {
                'p_standard_normal_1', 'p_standard_normal_2',
                'p_standard_normal_3', 'p_standard_normal_4',
                'p_standard_jumbo_1', 'p_standard_jumbo_2',
                'p_standard_mega_1', 'p_standard_mega_2' }
            },
        },
        banned_tags ={
            {id = "tag_standard"},
        }
    },
    deck = {
        type = 'Challenge Deck',
        cards = {
            { s = 'C', r = 'K' },
        }
    },
    button_colour = G.C.TAROT,
}
SMODS.Atlas {
    key = "hcz",
    path = "zatlas.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "lcz",
    path = "zatlaslc.png",
    px = 71,
    py = 95
}
SMODS.Rank {
    key = 'Zero',
    card_key = '1',
  lc_atlas = "lcz"
  hc_atlas = "hcz"
    pos = { x = 8 },
    nominal = 1,
    next = { 'Ace' },
    face = true,
    loc_txt = {
        name = "0"
    }
}

SMODS.PokerHand({
    key = "pkr_funny",
    mult = 69,
    chips = 420,
    l_mult = 3,
    l_chips = 30,
    example = {
        { 'S_6', true }, 
        { 'D_9', true },
        { 'H_4', true, enhancement = 'm_lucky' }, 
        { 'S_3', true },
        { 'D_jabong_Zero', true, seal = 'Red' } -
    },
    loc_txt = {
        name = "The Funny",
        description = {"'hello fellow children' having ass "},
    },
    visible = true,

    evaluate = function(parts, hand)
        if #hand >= 3 then
            local _has9 = false
            local _has6 = false
            local _has4 = false
             local _has2 = false
              local _hasZ = false
            local eligible_cards = {}
            local other_hands = next(parts._flush) or next(parts._straight) or next(parts._all_pairs)

            for i, card in ipairs(hand) do
                if card:get_id() == 9 and _has9 == false then
                    _has9 = true
                    eligible_cards[#eligible_cards + 1] = card
                elseif card:get_id() == 6 and _has6 == false then
                    _has6 = true
                    eligible_cards[#eligible_cards + 1] = card
                elseif card:get_id() == 4 and _has4 == false then
                    _has4 = true
                    eligible_cards[#eligible_cards + 1] = card
                end
                elseif card:get_id() == 2 and _has2 == false then
                    _has2 = true
                    eligible_cards[#eligible_cards + 1] = card
                end
                elseif card:get_id() == SMODS.Ranks['jabong_Zero'].id and _hasz == false then
                    _hasz = true
                    eligible_cards[#eligible_cards + 1] = card
                end
            end


            if _has9 and _has6 and _has4 and _has2 and _hasZ and not other_hands then
                return{eligible_cards}
            end
        end


    end,


    modify_display_text = function(self, cards, scoring_hand)
        return pkr_funny
    end,
})
SMODS.PokerHand({
    key = "pkr_flfunny",
    mult = 60,
    chips = 90,
    l_mult = 3,
    l_chips = 30,
    example = {
        { 'S_6', true }, 
        { 'S_9', true },
        { 'S_4', true, enhancement = 'm_lucky' }, 
        { 'S_3', true },
        { 'S_jabong_Zero', true, seal = 'Red' } -
    },
    loc_txt = {
        name = "Flush Funny",
        description = {"making these hands was a mistake"},
    },
    visible = true,

    evaluate = function(parts, hand)
        if #hand >= 3 then
            local _has9 = false
            local _has6 = false
            local _has4 = false
             local _has2 = false
              local _hasZ = false
            local eligible_cards = {}
            local other_hands =  or next(parts._straight) or next(parts._all_pairs)

            for i, card in ipairs(hand) do
                if card:get_id() == 9 and _has9 == false then
                    _has9 = true
                    eligible_cards[#eligible_cards + 1] = card
                elseif card:get_id() == 6 and _has6 == false then
                    _has6 = true
                    eligible_cards[#eligible_cards + 1] = card
                elseif card:get_id() == 4 and _has4 == false then
                    _has4 = true
                    eligible_cards[#eligible_cards + 1] = card
                end
                elseif card:get_id() == 2 and _has2 == false then
                    _has2 = true
                    eligible_cards[#eligible_cards + 1] = card
                end
                elseif card:get_id() == SMODS.Ranks['jabong_Zero'].id and _hasz == false then
                    _hasz = true
                    eligible_cards[#eligible_cards + 1] = card
                end
            end


            if _has9 and _has6 and _has4 and _has2 and _hasZ and next(parts._flush) and not other_hands then
                return{eligible_cards}
            end
        end


    end,


    modify_display_text = function(self, cards, scoring_hand)
        return pkr_flfunny
    end,
})
    
    
--i have to check to see if this code is fine
--[[]
      local _zcheck = 0
        local _zcheck2 = 0

        if G.hand.highlighted[1] then
            for i = 1, #G.hand.highlighted do
                if G.hand.highlighted[i].id == "jabong_Zero" then _zcheck = _zcheck + 1 end
            end
        end
        
        if G.play.cards[1] then
            for i = 1, #G.play.cards do
                if G.play.cards[i].id == "jabong_Zero" then _zcheck2 = _zcheck2 + 1 end
            end
        end

        if _zcheck >= 5 or _zcheck2 >= 5 then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blocking = false,
            blockable = false,
            delay = 0.7,
            func = function()
                if  G.GAME.current_round.current_hand.handname == "Flush Five" then
                G.GAME.current_round.current_hand.handname = "Flush Fucking nothing"
                end
                if  G.GAME.current_round.current_hand.handname == "Five Of A Kind" then
                G.GAME.current_round.current_hand.handname = "Five of A      ""
                end
                if G.GAME.current_round.current_hand.handname == "Flush Fucking nothing" or G.GAME.current_round.current_hand.handname == "Five of A      " then return true end
            end
            }))
        end

]]