-- main

require "src/bsp"
require "src/Container"
require "src/Room"


local ITER = 5 -- May not work above 12

-- Load
function love.load()
	container = Container.new( 0, 0, 800, 600 )
	containerTree = bsp( container, ITER )
	roomList = getRoomList( containerTree )
end

-- Update
function love.update( dt )

end

-- Keypressed
function love.keypressed( key )
   if key == " " then
      containerTree = bsp( container, ITER )
      roomList = getRoomList( containerTree )
   end
end

-- Draw
function love.draw()
	containerTree:draw()
	roomList:draw()
end