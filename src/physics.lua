Physics = Object:extend()

function Physics:new()
  world = WF.newWorld(0, 0, true)

  world:addCollisionClass('Pointer')
  world:addCollisionClass('red')
  world:addCollisionClass('green')
  world:addCollisionClass('blue')
  world:addCollisionClass('white')
  world:addCollisionClass('Solid')
  world:addCollisionClass('redWall', {ignores = {'red'}})
  world:addCollisionClass('greenWall', {ignores = {'green'}})
  world:addCollisionClass('blueWall', {ignores = {'blue'}})
  world:addCollisionClass('Player')
  world:addCollisionClass('Ghost', {ignores = {'Player'}})
  world:addCollisionClass('ColorEntity', {ignores = {'All'}} )
  world:addCollisionClass('Button',{ignores = {'All'}})
  world:addCollisionClass('Exit',{ignores = {'All'}})

  -- ColorCollider = world:newRectangleCollider(200,50,8,16)
  -- ColorCollider:setCollisionClass('RedWall')

end

function Physics:update(dt)
  

end

function Physics:draw()

end
