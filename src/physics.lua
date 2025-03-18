Physics = Object:extend()

function Physics:new()
  world = WF.newWorld(0, 0, true)

  world:addCollisionClass('Pointer')
  world:addCollisionClass('Red')
  world:addCollisionClass('Green')
  world:addCollisionClass('Blue')
  world:addCollisionClass('Solid')
  world:addCollisionClass('RedWall', {ignores = {'Red'}})
  world:addCollisionClass('GreenWall', {ignores = {'Green'}})
  world:addCollisionClass('BlueWall', {ignores = {'Blue'}})
  world:addCollisionClass('Player')
  world:addCollisionClass('Ghost', {ignores = {'Player'}})
  world:addCollisionClass('ColorEntity', {ignores = {'Red', 'Green','Blue'}} )


  ColorCollider = world:newRectangleCollider(200,50,8,16)
  ColorCollider:setCollisionClass('RedWall')



end

function Physics:update(dt)
  

end

function Physics:draw()

end
