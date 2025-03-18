MousePointer = Entity:extend()

function MousePointer:new(x,y)
  self.holding = false
  self.radius = 5
  -- self.collider = world:newCircleCollider(x,y,self.radius)
  self.collider = world:newBSGRectangleCollider(x,y,self.radius*2,self.radius*2,4)
  -- self.collider = world:newRectangleCollider(x, y, self.radius*2, self.radius*2)


  self.collider:setCollisionClass('Pointer')
  self.collider:setGravityScale(0)
  self.collider:setFixedRotation(true)

end

function MousePointer:update(dt)
  self.x = Mouse.x / Scale
  self.y = Mouse.y / Scale
  self.collider:setPosition(self.x, self.y)

end


function MousePointer:draw()
  love.graphics.setColor(1, 0, 0, .5)
  love.graphics.circle( "fill", self.x, self.y, self.radius )
  love.graphics.setColor(1, 1, 1)
end