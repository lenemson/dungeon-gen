-- main

require "src/bsp"
require "src/Container"


-- Load
function love.load()
	rooms = Container.new( 0, 0, 800, 600 )
	iter = 7
	tree = bsp( rooms, iter )
	tree:ToString( 1 )
end

-- Update
function love.update( dt )

end

-- Keypressed
function love.keypressed( key )
   if key == " " then
      tree = bsp( rooms, iter )
      tree:ToString( 1 )
   end
end

-- Draw
function love.draw()
	tree:Draw()
end

