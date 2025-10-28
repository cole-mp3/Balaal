--  THE mod's ID si still jamod cuz im lazy and dont wanna break anything
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
SMODS.PokerHand {
    key = "funny",
    mult = 69,
    chips = 420,
    l_mult = 1,
    l_chips = 10,
    example = {
        { 'S_6', true },
        { 'D_9', true },
        { 'D_4', true },
        { 'C_2', true },
        { 'D_3', false }
    },
    loc_txt = {
        name = "the funny",
        description = {"i'm so fucking unfunny bro"},
    },
    visible = true,
    evaluate = function(parts, hand)
        if #hand >= 4 then
            local _is6 = false
            local _is9 = false
            local _is4 = false
            local _is2 = false
            local eligible_cards = {}
            local other_hands = next(parts._flush) or next(parts._straight) or next(parts._all_pairs)

            for i, card in ipairs(hand) do
                if card:get_id() == 9 and _is9 == false then
                    _is9 = true
                    eligible_cards[#eligible_cards + 1] = card
                elseif card:get_id() == 6 and _is6 == false then
                    _has6 = true
                    eligible_cards[#eligible_cards + 1] = card
                elseif card:get_id() == 4 and _is4 == false then
                    _is4 = true
                    eligible_cards[#eligible_cards + 1] = card
                    elseif card:get_id() == 2 and _is2 == false then
                    _is2 = true
                    eligible_cards[#eligible_cards + 1] = card
                end
            end


            if _is9 and _is6 and _is4 and _is2 and not other_hands then
                return{eligible_cards}
            end
        end


    end,

modify_display_text = function(self, cards, scoring_hand)
        return pkr_funny
    end,
  
}
