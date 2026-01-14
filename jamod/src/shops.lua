-- thanks to hotpot for having custom shop and currency code 
-- so i can be unable to understand how it works with style
Bullshit = {
    shop_scale = 0.85
}
-- ...I have to do patches dont i
-- wait why dont i just make it like hpots ads
--[[
Bullshit.Shop = {}

local mener = G.FUNCS.go_to_menu
G.FUNCS.go_to_menu = function(e)
    local ret = mener(e)
    PissDrawer.Shop.active_tab = nil
    return ret
end
]]--


