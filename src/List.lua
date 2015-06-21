-- List

List = {}

function List.new( data )
	local self = setmetatable( {}, { __index = List } )
	self.data = data
	self.next = nil
	return self
end

function List:draw()
	local run = self
	while run ~= nil do
		run.data:draw()
		run = run.next
	end
end

