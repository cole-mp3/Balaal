Jafunc = {} --you should be global, now!!!!!!*lightning*
--fishing token stuff
-- most of this stolen from hotpot because they have plenty of custom currencies
function init_portokens(game)

  game.fokens = game.fokens or 0
  game.fokens_per_round = game.fokens_per_round or 0
  game.current_round.fokens = game.current_round.fokens or 0

end

function add_round_eval_fokens(config)
    local config = config or {}
    local width = G.round_eval.T.w - 0.51
    local num_dollars = to_big(config.fokens or 1)
    local scale = 0.9
    
    if not G.round_eval.divider_added then
    G.E_MANAGER:add_event(Event({
        trigger = 'after',delay = 0.25,
        func = function() 
            local spacer = {n=G.UIT.R, config={align = "cm", minw = width}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = {'......................................'}, colours = {G.C.WHITE},shadow = true, float = true, y_offset = -30, scale = 0.45, spacing = 13.5, font = G.LANGUAGES['en-us'].font, pop_in = 0})}}
            }}
            G.round_eval:add_child(spacer,G.round_eval:get_UIE_by_ID('bonus_round_eval'))
            return true
        end
    }))
  end
    delay(0.6)
    G.round_eval.divider_added = true

    delay(0.2)

        G.E_MANAGER:add_event(Event({
            trigger = 'before',delay = 0.5,
            func = function()
                --Add the far left text and context first:
                local left_text = {}
                if config.name == 'fokens' then
                  table.insert(left_text, {n=G.UIT.T, config={text = config.fokens, font = config.font, scale = 0.8*scale, colour = SMODS.Gradients.jabong_maxient, shadow = true, juice = true}})
                  table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = {" "..localize{type = 'variable', key = 'jabong_fokens_cashout', vars = {G.GAME.fokens_per_round or 0}}}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})
                elseif string.find(config.name, 'joker') then
                  table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = localize{type = 'name_text', set = config.card.config.center.set, key = config.card.config.center.key}, colours = {G.C.FILTER}, shadow = true, pop_in = 0, scale = 0.6*scale, silent = true})}})
                elseif string.find(config.name, 'tag') then
                    local blind_sprite = Sprite(0, 0, 0.7,0.7, G.ASSET_ATLAS[config.atlas], copy_table(config.pos))
                    blind_sprite:define_draw_steps({
                        {shader = 'dissolve', shadow_height = 0.05},
                        {shader = 'dissolve'}
                    })
                    blind_sprite:juice_up()
                    table.insert(left_text, {n=G.UIT.O, config={w=0.7,h=0.7 , object = blind_sprite, hover = true, can_collide = false}})
                    table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = {config.condition}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})    
                end
                    local full_row = {n=G.UIT.R, config={align = "cm", minw = 5}, nodes={
                    {n=G.UIT.C, config={padding = 0.05, minw = width*0.55, minh = 0.61, align = "cl"}, nodes=left_text},
                    {n=G.UIT.C, config={padding = 0.05,minw = width*0.45, align = "cr"}, nodes={{n=G.UIT.C, config={align = "cm", id = 'dollar_'..config.name},nodes={}}}}
                }}

                G.round_eval:add_child(full_row,G.round_eval:get_UIE_by_ID('bonus_round_eval'))
                play_sound('cancel', config.pitch or 1)
                play_sound('highlight1',( 1.5*config.pitch) or 1, 0.2)
                if config.card and config.card.juice_up then config.card:juice_up(0.7, 0.46) end
                return true
            end
        }))
        local dollar_row = 0
        if num_dollars > to_big(60) then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',delay = 0.38,
                func = function()
                    G.round_eval:add_child(
                            {n=G.UIT.R, config={align = "cm", id = 'dollar_row_'..(dollar_row+1)..'_'..config.name}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {localize('$')..num_dollars}, colours = {SMODS.Gradients.jabong_maxient}, shadow = true, pop_in = 0, scale = 0.65, float = true})}}
                            }},
                            G.round_eval:get_UIE_by_ID('dollar_'..config.name))

                    play_sound('coin3', 0.9+0.2*math.random(), 0.7)
                    play_sound('coin6', 1.3, 0.8)
                    return true
                end
            }))
        else
            for i = 1, to_number(num_dollars or 1) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',delay = 0.18 - ((num_dollars > to_big(20) and 0.13) or (num_dollars > to_big(9) and 0.1) or 0),
                    func = function()
                        if i%30 == 1 then 
                            G.round_eval:add_child(
                                {n=G.UIT.R, config={align = "cm", id = 'dollar_row_'..(dollar_row+1)..'_'..config.name}, nodes={}},
                                G.round_eval:get_UIE_by_ID('dollar_'..config.name))
                                dollar_row = dollar_row+1
                        end

                        local r = {n=G.UIT.T, config={text = localize('$'), colour = SMODS.Gradients.jabong_maxient, scale = ((num_dollars > to_big(20) and 0.28) or (num_dollars > to_big(9) and 0.43) or 0.58), shadow = true, hover = true, can_collide = false, juice = true}}
                        play_sound('coin3', 0.9+0.2*math.random(), 0.7 - (num_dollars > to_big(20) and 0.2 or 0))
                        
                        if config.name == 'blind1' then 
                            G.GAME.current_round.dollars_to_be_earned = G.GAME.current_round.dollars_to_be_earned:sub(2)
                        end

                        G.round_eval:add_child(r,G.round_eval:get_UIE_by_ID('dollar_row_'..(dollar_row)..'_'..config.name))
                        G.VIBRATION = G.VIBRATION + 0.4
                        return true
                    end
                }))
            end
        end

      -- might cause issues. Dollars cashout adds up everything and sends "bottom" cashout. Might need similar implementation if more foken cashouts are added
      G.GAME.current_round.fokens = G.GAME.current_round.fokens + config.fokens

end
function Card:calculate_foken_bonus()
    if not self:can_calculate() then return end
    local obj = self.config.center
    if obj.calc_foken_bonus and type(obj.calc_foken_bonus) == 'function' then
        return obj:calc_foken_bonus(self)
    end
end
-- for direct deposit
function Card:calculate_foken_bonus_delayed(dollars)
    if not self:can_calculate() then return end
    local obj = self.config.center
    if obj.calc_foken_bonus_delayed and type(obj.calc_foken_bonus_delayed) == 'function' then
        return obj:calc_foken_bonus_delayed(self, dollars)
    end
end


--#endregion

--The fishing shop
-- help me.
--commented because idk how to hide the menu
--[[
local game_start_run_ref = Game.start_run
local portopen = false 
function Game:start_run(args)
   local ret = game_start_run_ref(self, args)
function Fishingfunction(menu_name)
   return {n=G.UIT.ROOT, config={align = "cm", juice = true,}, nodes={
      {n=G.UIT.R, config={align = "cm"}, nodes={
         {n=G.UIT.C, config={align = "cm"}, nodes={
            {n=G.UIT.T, config={text = menu_name, colour = G.C.UI.TEXT_LIGHT, scale = 0.5}}
         }},
         {n=G.UIT.C, config={align = "cm"}, nodes={
            -- add the port token count
            {n=G.UIT.R, config ={align = "cm"}, nodes={
{n=G.UIT.T, config={text = "You have [idk] Port Tokens.", colour = G.C.UI.TEXT_LIGHT, scale = 0.5}, }
            }},
            
         }},
         {n=G.UIT.C, config={align = "cm"}, nodes={
            -- i'on even knoe
         }},
         -- Etc...
      }}
   }}

end
  
  local fop = UIBox({
   definition = Fishingfunction("The Port"),
   config = {type = "cm",  }
  })
    
    
  
    print("please.")

    return ret
   
end

]]-- 

--To Port button
local function fishop_ui(card)
  return UIBox {
    definition = {
      n = G.UIT.ROOT,
      config = {
        colour = G.C.CLEAR
      },
      nodes = {
        {
          n = G.UIT.C,
          config = {
            align = 'cm',
            padding = 0.15,
            r = 0.08,
            hover = true,
            shadow = true,
            colour = G.C.MULT, -- color of the button background
            button = 'jabong_fishop_click', -- function in G.FUNCS that will run when this button is clicked
            func = 'jabong_fishop_func', -- function in G.FUNCS that will run every frame this button exists (optional)
            ref_table = card,
          },
          nodes = {
            {
              n = G.UIT.R,
              nodes = {
                {
                  n = G.UIT.T,
                  config = {
                    text = "To Port",
                    colour = G.C.UI.TEXT_LIGHT, -- color of the button text
                    scale = 0.4,
                  }
                },
                {
                  n = G.UIT.B,
                  config = {
                    w = 0.1,
                    h = 0.4
                  }
                }
              }
            }
          }
        }
      }
    },
    config = {
      align = 'cl', -- position relative to the card, meaning "center left". Follow the SMODS UI guide for more alignment options
      major = card,
      parent = card,
      offset = { x = 0.2, y = 0.1} -- depends on the alignment you want, without an offset the button will look as if floating next to the card, instead of behind it
    }
  }
end
 --placeholders!!!!!!!!!!!!11!
-- Will be called whenever the button is clicked
G.FUNCS.jabong_fishop_click = function(e)
 
  local card = e.config.ref_table 
  if portopen == false then
    portopen = true -- portopen is for debugging and testing button states
    local fishingnode = {n=G.UIT.O, config={object = fop, button = "jabong_fishop_click" }}

    print("Port State is currently Open") --for debugging
  end
  
  
end

-- Will run every frame while the button exists
G.FUNCS.jabong_fishop_func = function(e)
  local card = e.config.ref_table  
  local can_use = true
  e.config.button = can_use and 'jabong_fishop_click' or nil
  e.config.colour = can_use and G.C.MULT or G.C.UI.BACKGROUND_INACTIVE
   -- Get the menu UIBox object:
  
end
--drawstep him
SMODS.DrawStep {
  key = 'fih',
  order = -30, 
  func = function(card, layer)
    if card.children.jabong_fih then
      card.children.jabong_fih:draw()
    end
  end
}

-- make sure SMODS doesn't draw the button after the card is drawn
SMODS.draw_ignore_keys.jabong_fih = true
--aaaand now we do
local highlight_ref = Card.highlight
function Card.highlight(self, is_highlighted)
  if is_highlighted and self.ability.set == "Joker" and self.area == G.jokers and self.config.center.key == "j_jabong_fisherman" then
    self.children.jabong_fih = fishop_ui(self)
  elseif self.children.jabong_fih then
    self.children.jabong_fih:remove()
    self.children.jabong_fih = nil
  end

  return highlight_ref(self, is_highlighted)
end
--a seperate fucking close Port button
local function fishopc_ui(card)
  return UIBox {
    definition = {
      n = G.UIT.ROOT,
      config = {
        colour = G.C.CLEAR
      },
      nodes = {
        {
          n = G.UIT.C,
          config = {
            align = 'cm',
            padding = 0.15,
            r = 0.08,
            hover = true,
            shadow = true,
            colour = G.C.MULT, -- color of the button background
            button = 'jabong_fishopc_click', -- function in G.FUNCS that will run when this button is clicked
            func = 'jabong_fishopc_func', -- function in G.FUNCS that will run every frame this button exists (optional)
            ref_table = card,
          },
          nodes = {
            {
              n = G.UIT.R,
              nodes = {
                {
                  n = G.UIT.T,
                  config = {
                    text = "Leave Port",
                    colour = G.C.UI.TEXT_LIGHT, -- color of the button text
                    scale = 0.4,
                  }
                },
                {
                  n = G.UIT.B,
                  config = {
                    w = 0.1,
                    h = 0.4
                  }
                }
              }
            }
          }
        }
      }
    },
    config = {
      align = 'tl', -- position relative to the card, meaning "center left". Follow the SMODS UI guide for more alignment options
      major = card,
      parent = card,
      offset = { x = 0.2, y = 1.2 } -- depends on the alignment you want, without an offset the button will look as if floating next to the card, instead of behind it
    }
  }
end
 --placeholders!!!!!!!!!!!!11!
-- Will be called whenever the button is clicked
G.FUNCS.jabong_fishopc_click = function(e)
 
  local card = e.config.ref_table 
  if portopen == true then
    portopen = false -- portopen is for debugging and testing button states
    print("Port State is currently Closed") --for debugging
  end
  
  
end

-- Will run every frame while the button exists
G.FUNCS.jabong_fishopc_func = function(e)
  local card = e.config.ref_table
  local can_use = true
  e.config.button = can_use and 'jabong_fishopc_click' or nil
  e.config.colour = can_use and G.C.MULT or G.C.UI.BACKGROUND_INACTIVE

end
--drawstep him
SMODS.DrawStep {
  key = 'fihc',
  order = -30, 
  func = function(card, layer)
    if card.children.jabong_fihc then
      card.children.jabong_fihc:draw()
    end
  end
}

-- make sure SMODS doesn't draw the button after the card is drawn
SMODS.draw_ignore_keys.jabong_fihc = true
--aaaand now we do
local highlight_ref2 = Card.highlight
function Card.highlight(self, is_highlighted)
  if is_highlighted and self.ability.set == "Joker" and self.area == G.jokers and self.config.center.key == "j_jabong_fisherman" then
    self.children.jabong_fihc = fishopc_ui(self)
  elseif self.children.jabong_fihc then
    self.children.jabong_fihc:remove()
    self.children.jabong_fihc = nil
  end

  return highlight_ref2(self, is_highlighted)
end