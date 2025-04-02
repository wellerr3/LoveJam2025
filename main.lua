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
  
  Maps = MapMaker()
  Robit = Robit(128,200)
  -- ball = world:newCollider("circle", {320, 20, 10})
  world:setGravity(0, 256)
  Button = Button(background:getWidth()/2,32, "Press To Move", "Press To Reset")

  ColorHolder = ColorHolder(1)

  -- ball:setRestitution(0.8)
end


function love.update(dt)
  if Winning > 0 then
    Winning = Winning - 1
    if Winning == 0 then
      MapNum = MapNum + 1
      Maps:changeMap("map"..MapNum)
      Robit:reset()
      ColorHolder:reset()
      
    end
  end
  Physics:update(dt)
  world:update(dt)
  ColorHolder:update(dt)
  Robit:update(dt)
  Button:update(dt)
  Maps:update(dt)
end

function love.draw()
  love.graphics.scale( Scale, Scale)
  love.graphics.draw(background)


  love.graphics.setColor(1, 1, 1)
  if Winning > 0 then
    love.graphics.draw( Text, 0, 32)
  end
	Maps:draw()
  -- world:draw()
  Robit:draw()
  ColorHolder:draw()
  Physics:draw()
  -- love.graphics.setColor(1, 0, 0, .5)
  -- love.graphics.circle( "fill", TestObj.x, TestObj.y, 10 )
  -- love.graphics.setColor(1, 1, 1)
  Button:draw()

end


function love.keypressed(key)

end

function love.mousemoved( x, y, dx, dy, istouch )
  Mouse.x = x
  Mouse.y = y
end

function love.mousepressed(x, y, button, istouch)
  if button == 1 then
    if Mouse.held ~= nil then
      Mouse.held.held = false
      Mouse.held = nil
    else
    local collision = world:queryRectangleArea(x/Scale, y/Scale, 10, 10)
    TestObj.x = x/Scale
    TestObj.y = y/Scale
    for i,col in ipairs(collision) do
      if col.collision_class == "ColorEntity" then
        col.obj.held = true
        Mouse.held = col.obj
        break
      elseif col.collision_class == "Button" then
        if col.obj.isPressed == true then
          col.obj.isPressed = false
          Robit.auto = false
          Robit:reset()
        else
          col.obj.isPressed = true
          Robit.auto = true
        end
      end
    end
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