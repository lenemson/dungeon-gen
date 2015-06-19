-- Container

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

function Container:Draw()
	love.graphics.setColor( 0, 255, 0, 255 )
 	love.graphics.rectangle( "line", self.x, self.y, self.w, self.h )
end

function Container:ToString()
	str = string.format( "[%i, %i, %i, %i]", self.x, self.y, self.w, self.h )
	return str
end