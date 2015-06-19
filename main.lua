require "bsp"

-- Load
function love.load()
	container = {}
	setmetatable( container, { __index = Container } )
	container:Set( 0, 0, 800, 600 )
	iter = 3
	tree = bsp( container, iter )
	tree:ToString( 1 )
end

-- Update
function love.update( dt )

end

-- Keypressed
function love.keypressed( key )
   if key == " " then
      tree = bsp( container, iter )
      tree:ToString( 1 )
   end
end

-- Draw
function love.draw()
	tree:Draw()
end

