if arg[2] == 'debug' then
  require('lldebugger').start()
end
-- io.stdout:setvbuf('no')
-- starter


function love.load()
  math.randomseed(os.time())
  Scale = 4
  print ("Starting Game")
  love.graphics.setDefaultFilter("nearest", "nearest")

  require("src/startup/gameStart")
  GameStart()
  TestObj = {x= 0, y= 0}

  background = love.graphics.newImage('src/tilesets/background.png')
  success = love.window.setMode( background:getWidth() * Scale, background:getHeight() * Scale )

  MousePointer = MousePointer(0, 0)
  Maps = MapMaker()
  Robit = Robit(320,20)
  -- ball = world:newCollider("circle", {320, 20, 10})
  world:setGravity(0, 256)

  ColorHolder = ColorHolder()

  -- ball:setRestitution(0.8)
end


function love.update(dt)
  Physics:update(dt)
  world:update(dt)
  ColorHolder:update(dt)
  MousePointer:update(dt)
	map:update(dt)
  Robit:update(dt)
end

function love.draw()
  love.graphics.scale( Scale, Scale)
  love.graphics.draw(background)

	map:draw()
  world:draw()
  Robit:draw()
  ColorHolder:draw()
  MousePointer:draw()
  Physics:draw()
  love.graphics.setColor(1, 0, 0, .5)
  love.graphics.circle( "fill", TestObj.x, TestObj.y, 10 )
  love.graphics.setColor(1, 1, 1)

end


function love.keypressed(key)

end

function love.mousemoved( x, y, dx, dy, istouch )
  Mouse.x = x
  Mouse.y = y
end

function love.mousepressed(x, y, button, istouch)
  if button == 1 then
    local collision = world:queryRectangleArea(x/Scale, y/Scale, 10, 10)
    TestObj.x = x/Scale
    TestObj.y = y/Scale
    print (#collision)
    if #collision > 1 then
      joint = world:addJoint('WeldJoint', collision[1], collision[2], TestObj.x, TestObj.y, true)
    end
  end

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