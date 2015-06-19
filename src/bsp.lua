-- BSP

require "src/Leaf"
require "src/Container"


local function splitRooms( container )
	local one, two
	if love.math.random( 0, 1 ) == 0 then
		-- Vertical split
		print(  "Vertical Split" )
		one = Container.new( container.x, container.y, love.math.random( container.w * 0.3, container.w * 0.7 ), container.h )
		two = Container.new( container.x + one.w, container.y, container.w - one.w, container.h )
	else
		-- Horizontal split
		print(  "Horizontal Split" )
		one = Container.new( container.x, container.y, container.w, love.math.random( container.h * 0.3, container.h * 0.7 ) )
		two = Container.new( container.x, container.y + one.h, container.w, container.h - one.h )
	end
	return one, two
end

function bsp( container, iter )
	local root = Leaf.new( container )
	if iter > 0 then
		local one, two = splitRooms( container )
		root.left = bsp( one, iter - 1 )
		root.right = bsp( two, iter - 1 )
	end
	return root
end
