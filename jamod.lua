
assert(SMODS.load_file("jamod/src/seals.lua"))()
assert(SMODS.load_file("jamod/src/backs.lua"))()
assert(SMODS.load_file("jamod/src/basiccs.lua"))()
assert(SMODS.load_file("jamod/src/jonklers.lua"))()
assert(SMODS.load_file("jamod/src/MAXIMIZED.lua"))()
assert(SMODS.load_file("jamod/src/balatroicon.lua"))()
assert(SMODS.load_file("jamod/src/enhacnements.lua"))()
assert(SMODS.load_file("jamod/src/utube.lua"))()
assert(SMODS.load_file("jamod/src/blinds.lua"))()
SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    quantum_enhancements = true,
}
-- editions(cuz it errors me if i load file.
SMODS.Edition {
    key = "sheetapaper",
    shader = false,
    loc_txt = {
        name = "Paper'd",
        text = {
            "This card is considered to be a{C:attention} glass card{}.",
            "{X:red,C:white}X#1#{} Mult"
        }
    },
    config = { vars = { x_mult = 5 }},
    sound = { sound = "jabong_oh", per = 1.2, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.x_mult } }
    end,
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_mult = card.edition.x_mult
            }
        end
    end
    
}
