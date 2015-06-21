-- Room

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

function getRooms( treeContainer )
	if treeContainer == nil or treeContainer.data == nil then
		print( "nil" )
		return nil
	end
	print( "non nil" )
	local root = Leaf.new( Room.new( treeContainer.data ) )
	root.left = getRooms( treeContainer.left )
	root.right = getRooms( treeContainer.right )
	return root
end