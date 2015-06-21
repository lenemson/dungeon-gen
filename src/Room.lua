-- Room ( Dungeon room of course :v )

require "src/List"


Room = {}

function Room.new( container )
	local self = setmetatable( {}, { __index = Room } )
	self.x = container.x + love.math.random( 0, container.w / 3 )
	self.y = container.y + love.math.random( 0, container.h / 3 )
	self.w = container.w - ( self.x - container.x )
	self.h = container.h - ( self.y - container.y )
	self.w = self.w - love.math.random( 0, self.w / 3 )
    self.h = self.h - love.math.random( 0, self.w / 3 )
	return self
end

function Room:draw()
	love.graphics.setColor( 255, 0, 0, 255 )
 	love.graphics.rectangle( "line", self.x, self.y, self.w, self.h )
end

-- Tree to List
function getRoomList( container )
	if container == nil then
		return nil
	elseif container.left == nil and container.right == nil then
		return List.new( Room.new( container.data ) )
	else
		print( "We need to go deeper" )
		local elem, run
		elem = getRoomList( container.left )
		run = elem
		while run.next ~= nil do
			run = run.next
		end
		run.next = getRoomList( container.right )
		return elem
	end
end