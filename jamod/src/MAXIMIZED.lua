
SMODS.ObjectType ({
    key = "maximized",
    default  = "j_joker",
    cards ={},
    inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
  }
  )