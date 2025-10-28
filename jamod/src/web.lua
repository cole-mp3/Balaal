-- im not going to fucking bother trying to figure these out so here.
-- stolen code.
-- thanks cryptid devs
-- oh and also thanks again to yahi for having a working twitch version of membership card
-- you are a fucking lifesaver
https = require "SMODS.https"
local member_fallback = 3
local succ, https = pcall(require, "SMODS.https")
local last_update_time = 0
local initial = true
local clientid = "gp762nuuoqcoxypju8c569th9wz7q5"

jabong.viewercount = member_fallbackn
if not succ then --[[hmm yes,succ]]
	print("HTTP module could not be loaded. " .. tostring(https))
end

local function apply_discord_member_count(code, body, headers)
	if body then
		jabong.viewercount = string.match(body, '"approximate_member_count"%s*:%s*(%d+)') or jabong.viewercount
	end
end
function recheckTwitch(please)

    if ((os.time() - G.last_update_time) >= 90) or please == "blease" then
        G.last_update_time = os.time()
        local json = require "json"
        local succ, https = pcall(require, "SMODS.https")
        local url = "https://gql.twitch.tv/gql"
        local options = {
        method = "POST",

        
            -- Keep in mind i have no clue how this wokrs so I'm ASSUMING just adding the channel name here is fine
        data = '[{"operationName":"VideoMetadata","variables":{"channelLogin":"Aztecross","videoID":"0"},"extensions":{"persistedQuery":{"version":1,"sha256Hash":"45111672eea2e507f8ba44d101a61862f9c56b11dee09a15634cb75cb9b9084d"}}}]',
        headers = {
            ["Client-ID"] = "kimne78kx3ncx6brgo4mv6wki5h1ko",
            ["user-agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36",
            ["Content-Type"] = "application/json"
        }
        }

        local status, body, headers = https.request(url, options)

        local ok, parsed = pcall(json.decode, body or "")
        if not ok or type(parsed) ~= "table" then

            G.azteviewers = 0
            print("Couldn't JSON decode for some reason. Check your VPN?")
            return 
        end

        G.twitchbodyjson = json.decode(body)
        G.azteviewers = 0
        if G.twitchbodyjson[1].data.user.stream then G.azteviewers = G.twitchbodyjson[1].data.user.stream.viewersCount else print("Pretty sure Cross is offline...") end
    else
		--print("Can't update! Wait " .. (90 - (os.time() - G.last_update_time)) .. " more seconds please...")
	end
end
 

recheckTwitch("blease")


SMODS.Joker{
    -- im so sorry my man but this was too funny
    key = 'cross',
    loc_txt= {
        name = 'Another week boys, and another TWAB',
    
        text = { "{C:red}+#1#{} Mult for every",
                    "viewer currently watching",
                    "{C:attention}Aztecross{} on {C:dark_edition}Twitch.{}",
                    "{C:inactive}Currently{} {C:red}+#2#{}{C:inactive} Mult{}",
                    "                        ",
                    "{C:inactive}PATCH NOOOTES!!!!!!!{}"
                }
    },
    atlas = 'sccre',
    pos = {x=0, y=0},
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {perviewer = 1, viewercount = G.azteviewers/5 }},
    
    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.perviewer , center.ability.extra.viewercount}  }
	end,


    calculate = function(self, card, context)
    recheckTwitch()
    card.ability.extra.viewercount = G.azteviewers * card.ability.extra.perviewer/5
    if context.joker_main then
        return {
            color = G.C.RED,
            message = "+".. card.ability.extra.perviewer,
            mult_mod = card.ability.extra.viewercount
        }
    end
end,
}
