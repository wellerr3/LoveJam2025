Wall = Object:extend()

function Wall:new(shape, verts, x, y, width, height, type)
  self.shape = shape
  self.verts = verts
  self.x = x or nil
  self.y = y or nil
  self.width = width or nil
  self.height = height or nil
  self.type = type or nil
end


function Wall:addCollider()
  if self.type == "exit" then
    self.collider = world:newRectangleCollider(self.x, self.y, self.width, self.height)
    self.collider:setCollisionClass('Exit')
  elseif self.shape == "rectangle" then
    self.collider = world:newRectangleCollider(self.x, self.y, self.width, self.height)
    self.collider:setCollisionClass('Solid')
  else
    self.collider = world:newPolygonCollider(self.verts)
    self.collider:setCollisionClass('Solid')
  end
  self.collider:setType('static')
  self.collider.obj = self
end