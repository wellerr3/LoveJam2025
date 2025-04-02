ObsticleWall = Entity:extend()

function ObsticleWall:new(x,y, width, height, color, type, verts,shape, dir)
  ObsticleWall.super.new(self, x, y, nil, width, height)
  self.type = type
  self.color = color
  self.shape = shape
  self.isMoving = true
  self.dir = dir

  if type == "spring" then
    self.spriteSheet = love.graphics.newImage("src/tilesets/spring.png")
    local numFramesWide = self.spriteSheet:getWidth() / 16
    local numFramesHigh = self.spriteSheet:getHeight() / 16
    self.grid = Anim8.newGrid(16, 16, self.spriteSheet:getWidth(), self.spriteSheet:getHeight(), 0,0,0)
    self.img = {}
    self.img.up = Anim8.newAnimation(self.grid('1-' .. numFramesWide, 1), .125)
    self.img.left = Anim8.newAnimation(self.grid('1-' .. numFramesWide, 2), .125)
    self.img.right = self.img.left:clone():flipH()
    self.img.down = self.img.up:clone():flipV()
  end

end

function ObsticleWall:update(dt)
  if self.type == "spring" then
    self.img[self.dir]:update(dt)
  end
end


function ObsticleWall:draw()
  love.graphics.setColor(lovecc.getColor(self.color))
  if self.type == "wall" then
    love.graphics.rectangle( "fill", self.x, self.y, self.width, self.height )
  elseif self.type == "spring" then
    if self.isMoving == false then
      print (self.dir)
      self.img[self.dir]:gotoFrame(1)
      self.img[self.dir]:draw(self.spriteSheet, self.x,self.y, nil, nil, nil, self.offsetX, self.offsetY)
    else
      print (self.dir)
      self.img[self.dir]:draw(self.spriteSheet, self.x, self.y, nil, nil, nil, self.offsetX, self.offsetY)
    end
  end
  love.graphics.setColor(1, 1, 1)
end



function ObsticleWall:addCollider()
  if self.shape == "rectangle" then
    self.collider = world:newRectangleCollider(self.x, self.y, self.width, self.height)
  elseif self.shape == "polygon" then
    self.collider = world:newPolygonCollider(self.verts)
  end
  if self.type == "spring" then
    self.collider:setRestitution(2)
  end
  self.collider:setCollisionClass(self.color.."Wall")
  self.collider:setFixedRotation(true)
  self.collider:setType('static')
  self.collider.obs = self

end
