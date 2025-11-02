--  THE mod's ID is still jamod cuz im lazy and dont wanna break anything
-- any addtiions that use the mod id do NOT go under BALAAL, they go under jamod
-- cuz that was the orginal name
-- so yeah
--A: hey i finally built aseprite from source it took forfuckingeverrrrrrrrrrrrrrrrrr
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
SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    quantum_enhancements = true,
}
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
SMODS.Rank {
    key = 'Zero',
    card_key = '1',
    --atlas coming later
    pos = { x = 8 },
    nominal = 1,
    next = { 'Ace' },
    face = true,
    loc_txt = {
        name = "0"
    }
}


