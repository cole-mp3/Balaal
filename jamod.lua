
assert(SMODS.load_file("jamod/src/seals.lua"))()
assert(SMODS.load_file("jamod/src/backs.lua"))()
assert(SMODS.load_file("jamod/src/basiccs.lua"))()
assert(SMODS.load_file("jamod/src/jonklers.lua"))()
assert(SMODS.load_file("jamod/src/MAXIMIZED.lua"))()
assert(SMODS.load_file("jamod/src/balatroicon.lua"))()
assert(SMODS.load_file("jamod/src/enhacnements.lua"))()
assert(SMODS.load_file("jamod/src/utube.lua"))()
SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    quantum_enhancements = true,
}