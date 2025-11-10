--  THE mod's ID is still jamod cuz im lazy and dont wanna break anything
-- any addtiions that use the mod id do NOT go under BALAAL, they go under jabong
-- cuz that was the orginal name
-- so yeah
if not jamod then
	jamod = {}
end
local game_main_menu_ref = Game.main_menu

function Game:main_menu()


   local ret = game_main_menu_ref(self)
   
   
    
 G.title_top.cards[1]:remove()
    
    print("Welcome to hell, I hope you like this mess")

    return ret
   
end
local mod_path = "" .. SMODS.current_mod.path
jamod.path = mod_path
jamod_config = SMODS.current_mod.config

assert(SMODS.load_file("jamod/src/balatroicon.lua"))()
assert(SMODS.load_file("jamod/src/seals.lua"))()
assert(SMODS.load_file("jamod/src/backs.lua"))()
assert(SMODS.load_file("jamod/src/blinds.lua"))()
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
--[[
SMODS.Stake {
    name = "Spob Stake", --i need to make the sticker this uses first
    key = "spob",
    applied_stakes = { "gold" },
    pos = { x = 2, y = 1 },
    sticker_pos = { x = 3, y = 1 },
    modifiers = function()
        G.GAME.modifiers.enable_rentals_in_shop = true
    end,
    colour = G.C.GOLD,
    shiny = true,
}]]
SMODS.ObjectType {
     key = "balaaljonklers",
    default = "j_ice_cream",
    cards = {
        j_jabong_tongs = true,
        j_jabong_lildude = true,
        j_jabong_dam = true,
        j_jabong_drei = true,
        j_jabong_Aerial = true,
        j_jabong_gundx = true,
        j_jabong_vegeta = true,
        j_jabong_buskin = true,
        j_jabong_sock = true,
        j_jabong_Oracle = true,
        j_jabong_intelligence = true,
        j_jabong_cross = true,
        j_jabong_photo = true,
        j_jabong_graph = true,
        j_jabong_longasfname = true,
        j_jabong_homer = true,
        j_jabong_screaming = true,
        j_jabong_benson = true,
        j_jabong_fisherman = true,
        j_jabong_balatroreddit = true,
        j_jabong_basspro = true,
        j_jabong_dingus = true,
        j_jabong_lytherorefrence = true,
        j_jabong_thebrontjame = true,
        j_jabong_jimbyramid = true,
        j_jabong_nill = true,
        j_jabong_gojoker = true,
        j_jabong_soulbottle = true,
        j_jabong_thegober = true,
        j_jabong_beemovie = true,
        j_jabong_hanging = true,
        j_jabong_chard = true,
    },
}
SMODS.Sound{
     vol = 0.6,
    pitch = 1.0, 
    key = "music_drop", 
    path = "music_Drop.ogg",
    select_music_track = function() 
        return SMODS.Mods.jamod.config.whiteash and G.STAGE == G.STAGES.MAIN_MENU

         end
}

SMODS.current_mod.config_tab = function()
	return {n = G.UIT.ROOT, config = {
		align = "cm", padding = 0.1
	}, nodes = {
 {n = G.UIT.T, config = {text = "im workin on it ok be patient", colour = G.C.UI.TEXT_LIGHT, scale = 1.1}}
    }}
end


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
                    text = "Art dudes:",
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
                        text = "RandomizedAlias, MrCr33ps(the garbshit textures guy)",
                        shadow = false,
                        scale = scale*2,
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
                    text = "Myself (cuz i cant code)",
                    shadow = false,
                    scale = scale*2,
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
                    scale = scale*2,
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
                    scale = scale*2,
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
        { id = 'j_jabong_dam', eternal = true },
        { id = "j_hanging_chad", edition = "negative"},


    },
    loc_txt = {
        name = "damnnn!!!!"
    },
    restrictions = {
        banned_other = {
            { id = 'bl_plant', type = 'blind' },
            { id = 'bl_psychic', type = 'blind' },
              { id = 'bl_club', type = 'blind' },
           
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
  lc_atlas = "lcz",
  hc_atlas = "hcz",
    pos = { x = 0 },
    nominal = 13.5,
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
        { 'D_7', false, seal = 'Red' } 
    },
loc_txt = {
    name = "Funny",
    description = {
        "The least funny hand ever",
        "(NOTICE, A ZERO IS REQUIRED TO PLAY THIS HAND)"
    }
},
    

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
                elseif card:get_id() == 2 and _has2 == false then
                    _has2 = true
                    eligible_cards[#eligible_cards + 1] = card
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

    
    
