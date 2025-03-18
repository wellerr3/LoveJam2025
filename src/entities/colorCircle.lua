ColorCicle = Entity:extend()

Colors = {"red","green","blue"}

function ColorCicle:new(x,y, color, radius)
  self.held = false
  self.radius = radius
  self.color = color
  self[color] = 1
  for i,v in ipairs(Colors) do
    if not self[v] then
      self[v] = 0
    end
  end
  -- self.collider = world:newCircleCollider(x,y,self.radius)
  self.collider = world:newBSGRectangleCollider(x,y,self.radius*2,self.radius*2,self.radius/2)
  -- self.collider = world:newRectangleCollider(x, y, self.radius*2, self.radius*2)


  self.collider:setCollisionClass('ColorEntity')
  self.collider:setGravityScale(0)
  self.collider:setFixedRotation(true)

end

function ColorCicle:update(dt)
  local test = self.collider:getX()
  self.x = self.collider:getX()
  self.y = self.collider:getY()

end


function ColorCicle:draw()
  love.graphics.setColor(1, 0, 0, .5)
  love.graphics.circle( "fill", self.x, self.y, self.radius )
  love.graphics.setColor(1, 1, 1)
end