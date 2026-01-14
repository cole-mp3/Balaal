Jafunc = {} --you should be global, now!!!!!!*lightning*
--fishing token stuff


--#endregion

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
      offset = { x = 0.2, y = 0 } -- depends on the alignment you want, without an offset the button will look as if floating next to the card, instead of behind it
    }
  }
end
-- Will be called whenever the button is clicked
G.FUNCS.jabong_fishop_click = function(e)
  local card = e.config.ref_table 
  --placeholder
  SMODS.calculate_effect({ message = "Hi!" }, card)
end

-- Will run every frame while the button exists
G.FUNCS.jabong_fishop_func = function(e)
  local card = e.config.ref_table  
  local can_use = true   
  e.config.button = can_use and 'jabong_fishop_click' or nil
  e.config.colour = can_use and G.C.MULT or G.C.UI.BACKGROUND_INACTIVE

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