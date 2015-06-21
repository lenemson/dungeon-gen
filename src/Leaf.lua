-- Leaf ( Binary tree node )

Leaf = {}

function Leaf.new( data )
	local self = setmetatable( {}, { __index = Leaf } )
	self.data = data
	self.left = nil
	self.right = nil
	return self
end

function Leaf:draw()
	self.data:draw()
	if self.left ~= nil then
		self.left:draw()
	end
	if self.right ~= nil then
		self.right:draw()
	end
end

function Leaf:toString( level )
	for i = 0, level do
		io.write( "	" )
	end
	print( string.format( "level:%i %s", level, self.data:toString() ) )
	if self.left ~= nil then
		self.left:toString( level + 1 )
	end
	if self.right ~= nil then
		self.right:toString( level + 1 )
	end
end