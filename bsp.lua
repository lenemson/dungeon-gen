-- Container

Container = {}

function Container:Set( x, y, w, h )
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.cx = w / 2
	self.cy = h / 2
end

function Container:Draw()
	love.graphics.setColor( 0, 255, 0, 255 )
 	love.graphics.rectangle( "line", self.x, self.y, self.w, self.h )
end

function Container:ToString()
	str = string.format( "[%i, %i, %i, %i]", self.x, self.y, self.w, self.h )
	return str
end

-- BSP Tree

Leaf = {}

function Leaf:Set( container )
	self.data = container
	self.left = nil
	self.right = nil
end

function Leaf:Draw()
	self.data:Draw()
	if self.left ~= nil then
		self.left:Draw()
	end
	if self.right ~= nil then
		self.right:Draw()
	end
end

function Leaf:ToString( level )
	for i = 0, level do
		io.write( "	" )
	end
	print( string.format( "level:%i %s", level, self.data:ToString() ) )
	if self.left ~= nil then
		self.left:ToString( level + 1 )
	end
	if self.right ~= nil then
		self.right:ToString( level + 1 )
	end
end

-- BSP

local function splitRooms( container )
	local one, two = {}, {}
	setmetatable( one, { __index = Container } )
	setmetatable( two, { __index = Container } )
	if love.math.random( 0, 1 ) == 0 then
		-- Vertical split
		print(  "Vertical Split" )
		one:Set( container.x, container.y, love.math.random( container.w * 0.3, container.w * 0.7 ), container.h )
		two:Set( container.x + one.w, container.y, container.w - one.w, container.h )
	else
		-- Horizontal split
		print(  "Horizontal Split" )
		one:Set( container.x, container.y, container.w, love.math.random( container.h * 0.3, container.h * 0.7 ) )
		two:Set( container.x, container.y + one.h, container.w, container.h - one.h )
	end
	return one, two
end

function bsp( container, iter )
	local root = {}
	setmetatable( root, { __index = Leaf } )
	root:Set( container )
	if iter > 0 then
		local one, two = splitRooms( container )
		root.left = bsp( one, iter - 1 )
		root.right = bsp( two, iter - 1 )
	end
	return root
end
