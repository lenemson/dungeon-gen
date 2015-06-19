-- Leaf

Leaf = {}

function Leaf.new( container )
	local self = setmetatable( {}, { __index = Leaf } )
	self.data = container
	self.left = nil
	self.right = nil
	return self
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