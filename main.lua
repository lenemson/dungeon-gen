-- main

require "src/bsp"
require "src/Container"
require "src/Room"


local ITER = 1

-- Load
function love.load()
	container = Container.new( 0, 0, 800, 600 )
	treeContainer = bsp( container, ITER )
	treeRoom = getRooms( treeContainer )
end

-- Update
function love.update( dt )

end

-- Keypressed
function love.keypressed( key )
   if key == " " then
      treeContainer = bsp( container, ITER )
      treeRoom = getRooms( treeContainer )
   end
end

-- Draw
function love.draw()
	treeContainer:draw()
	treeRoom:draw()
end