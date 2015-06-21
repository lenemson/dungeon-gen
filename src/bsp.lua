-- BSP

require "src/Leaf"
require "src/Container"


local W_RATIO = 0.40
local H_RATIO = 0.40

local function splitContainer( container )
	local one, two
	if love.math.random( 0, 1 ) == 0 then
		-- Vertical split
		print(  "Vertical Split" )
		one = Container.new( container.x, container.y, love.math.random( 1, container.w ), container.h )
		two = Container.new( container.x + one.w, container.y, container.w - one.w, container.h )
		if (one.w / one.h) < W_RATIO or (two.w / two.h) < W_RATIO then
			return splitContainer( container )
		end
	else
		-- Horizontal split
		print(  "Horizontal Split" )
		one = Container.new( container.x, container.y, container.w, love.math.random( 1, container.h ) )
		two = Container.new( container.x, container.y + one.h, container.w, container.h - one.h )
		if (one.h / one.w) < H_RATIO or (two.h / two.w) < H_RATIO then
			return splitContainer( container )
		end
	end
	return one, two
end

function bsp( container, iter )
	local root = Leaf.new( container )
	if iter > 0 then
		local one, two = splitContainer( container )
		root.left = bsp( one, iter - 1 )
		root.right = bsp( two, iter - 1 )
	end
	return root
end