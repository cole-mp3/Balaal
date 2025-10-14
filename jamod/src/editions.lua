SMODS.Shader ({ key = 'fractured', path = 'fractured.fs' })
SMODS.Edition ({
    key ="fractured",
    shader = "fractured",
    discovered = true,
    unlocked = true,
    config = {x_mult = 2, mult = 20},
    in_shop = true,
    weight = 8,
    extra_cost = 6,
    apply_to_float = true,
    loc_vars = function(self)
        return { vars = {self.config.mult, self.config.x_mult} }
    end
})