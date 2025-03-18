Robit = Entity:extend()

function Robit:new(x,y)
  Robit.super.new(self, x, y, "src/tilesets/char.png", 16, 16)

  local numFramesWide = self.spriteSheet:getWidth() / 16
  local numFramesHigh = self.spriteSheet:getHeight() / 16

  self.grid = Anim8.newGrid(16, 16, self.spriteSheet:getWidth(), self.spriteSheet:getHeight(), 0,0,0)
  self.speed = 100
  self.isMoving = true
  self.img = {}
  self.img.default = {}
  self.img.default.right = Anim8.newAnimation(self.grid('1-' .. numFramesWide, 1), .125)
  self.img.default.left = self.img.default.right:clone():flipH()
  -- self.collider = world:newCollider("Rectangle", {x,y, 8,16})
  self.collider = world:newBSGRectangleCollider(x,y,8,16,2)

  self.collider:setCollisionClass('Red')
  self.collider:setRestitution(0.1)
  -- print (self.collider:getFixtures())
  -- for i,v in pairs(self.collider:getFixtures()) do
  --   print (i,v)
  --   for inv,val in pairs(v:getUserData()) do
  --     print (inv,val)
  --   end
  
  -- end

  self.collider:setFixedRotation(true)

end

function Robit:update(dt)
  self.isMoving = false
  local vx = 0
  local vy = 0


  if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
    -- vx = self.speed
    self.dir = "right"
    self.isMoving = true
    self.collider:applyForce(50, 0)
  elseif love.keyboard.isDown("left") or love.keyboard.isDown("a") then
    vx = - self.speed
    self.dir = "left"
    self.isMoving = true
    self.collider:applyForce(-50, 0)
    -- ball:applyForce(-50, 0)
  elseif love.keyboard.isDown("up") or love.keyboard.isDown("w")  then
    -- ball:setPosition(325, 20)
    -- ball:setLinearVelocity(0, 0)
  elseif love.keyboard.isDown("down") or love.keyboard.isDown("s") then
    --  ball:applyForce(0, 100)
  end


  local test = self.collider:getX()
  self.x = self.collider:getX() -8
  self.y = self.collider:getY() -8

  self.img.default[self.dir]:update(dt)

end


function Robit:draw()
  if self.isMoving == false then
    self.img[self.mode][self.dir]:gotoFrame(1)
    self.img[self.mode][self.dir]:draw(self.spriteSheet, self.x,self.y, nil, nil, nil, self.offsetX, self.offsetY)
  else
    self.img[self.mode][self.dir]:draw(self.spriteSheet, self.x, self.y, nil, nil, nil, self.offsetX, self.offsetY)
  end
end