--I have to figure out https requests myself cuz im THIS CLOSE TO  LOSING IT
-- so for now, this si where the tags go
SMODS.Edition {
    key = 'radiant',
    shader = false, --someone please make thhis
    config = { chips = 50, Mult = 20, Xmult = 2.5 },
    in_shop = true,
    weight = 20,
    extra_cost = 2,
    loc_txt = {
        name = "Radiant",
        label = "Radiant"
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
}
