-- Point

Point = {}

function Point.new( x, y )
	local self = setmetatable( {}, { __index = Point } )
	self.x = x
	self.y = y
	return self
end

function Point:set( x, y )
	self.x = x
	self.y = y
end

function Point:getX()
	return self.x
end

function Point:getY()
	return self.y
end

function Point:toString()
	str = string.format( "[%i, %i]", self.x, self.y )
	return str
end