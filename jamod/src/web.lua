--I have to figure out https requests myself cuz im THIS CLOSE TO  LOSING IT
-- so for now, this si where the tags go
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
    key = "luchalibre",
    atlas = "tatlas"
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = "Luchador Tag",
        text = {
            "Creates {C:attention}Luchador{}.",
            "{C:inactive}(Must have room){}"
        }
    }
    apply = function(self, tag, context)
         if context.type == 'new_blind_choice' then
            SMODS.add_card {
            key = "j_luchador",                       
                         }
            tag.triggered = true
            return true
        end
    end
}

