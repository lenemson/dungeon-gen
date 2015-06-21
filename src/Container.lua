-- Container ( For BSP )

require "src/Point"


Container = {}

function Container.new( x, y, w, h )
	local self = setmetatable( {}, { __index = Container } )
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.pos = Point.new( w / 2, h / 2 )
	return self
end

function Container:draw()
	love.graphics.setColor( 0, 255, 0, 255 )
 	love.graphics.rectangle( "line", self.x, self.y, self.w, self.h )
end

function Container:toString()
	str = string.format( "[%i, %i, %i, %i]", self.x, self.y, self.w, self.h )
	return str
end