--Nothing yet.
SMODS.ObjectType ({
    key = "maximized",
    default  = "j_joker"
    cards ={}
    inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
		self:inject_card(G.P_CENTERS.j_burnt_joker)
	end,
})