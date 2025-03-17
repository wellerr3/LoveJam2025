if arg[2] == 'debug' then
  require('lldebugger').start()
end
-- io.stdout:setvbuf('no')
-- starter


function love.load()
  math.randomseed(os.time())
  success = love.window.setMode( 2000, 1200 )
  print ("Starting Game")
  love.graphics.setDefaultFilter("nearest", "nearest")

  require("src/startup/gameStart")
  GameStart()

  background = love.graphics.newImage('src/tilesets/background.png')

  world = bf.newWorld(0, 0, true)
  Maps = MapMaker()

  ball = world:newCollider("polygon", {320, 20, 310, 20, 310, 30, 320, 30})
  world:setGravity(0, 512)
  ball:setRestitution(0.8)
end


function love.update(dt)

    world:update(dt)
    if love.keyboard.isDown("right") then
     ball:applyForce(100, 0)
   elseif love.keyboard.isDown("left") then
     ball:applyForce(-100, 0)
   elseif love.keyboard.isDown("up") then
     ball:setPosition(325, 20)
     ball:setLinearVelocity(0, 0)
   elseif love.keyboard.isDown("down") then
      ball:applyForce(0, 200)
    end

	map:update(dt)
end

function love.draw()
  love.graphics.scale( 3, 3 )
  love.graphics.draw(background)

	map:draw()
  world:draw()

end


function love.keypressed(key)

end

function love.mousemoved( x, y, dx, dy, istouch )
  Mouse.x = x
  Mouse.y = y
end

function love.mousepressed(x, y, button, istouch)

end

-- error handler
local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
  if lldebugger then
    error(msg, 2)
  else
    return love_errorhandler(msg)
  end
end