ColorCircle = Entity:extend()

Colors = {"red","green","blue"}

function ColorCircle:new(x,y, color, radius)
  self.home = {x = x, y = y}
  self.held = false
  self.radius = radius
  self.color = color
  self[color] = 1
  self.offset = {x = 0, y = 0}
  for i,v in ipairs(Colors) do
    if not self[v] then
      self[v] = 0
    end
  end
  -- self.collider = world:newCircleCollider(x,y,self.radius)
  self.collider = world:newBSGRectangleCollider(x,y,self.radius*2 - 5,self.radius*2 - 5,self.radius/2)
  -- self.collider = world:newRectangleCollider(x, y, self.radius*2, self.radius*2)


  self.collider:setCollisionClass('ColorEntity')
  self.collider:setGravityScale(0)
  self.collider:setFixedRotation(true)

  self.collider.obj = self

end

function ColorCircle:update(dt)
  if self.held then
    self.collider:setPosition( Mouse.x/Scale, Mouse.y/Scale)
  end
  self.x = self.collider:getX()
  self.y = self.collider:getY()

end


function ColorCircle:draw()
  love.graphics.setColor(lovecc.getColor(self.color,.5))
  love.graphics.circle( "fill", self.x, self.y, self.radius )
  love.graphics.setColor(lovecc.getColor("white"))
  love.graphics.circle( "line", self.x, self.y, self.radius )
  love.graphics.setColor(1, 1, 1)
end

function ColorCircle:changeColor(color)

end