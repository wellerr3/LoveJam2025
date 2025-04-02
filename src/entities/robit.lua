Robit = Entity:extend()

function Robit:new(x,y)
  Robit.super.new(self, x, y, "src/tilesets/char.png", 16, 16)

  local numFramesWide = self.spriteSheet:getWidth() / 16
  local numFramesHigh = self.spriteSheet:getHeight() / 16
  self.home = {x = x, y = y}
  self.auto = false
  self.grid = Anim8.newGrid(16, 16, self.spriteSheet:getWidth(), self.spriteSheet:getHeight(), 0,0,0)
  self.speed = 75
  self.isMoving = true
  self.changeCollider = false
  self.colliderColor = "white"
  self.img = {}
  self.img.default = {}
  self.img.default.right = Anim8.newAnimation(self.grid('1-' .. numFramesWide, 1), .125)
  self.img.default.left = self.img.default.right:clone():flipH()
  -- self.collider = world:newCollider("Rectangle", {x,y, 8,16})
  self.collider = world:newBSGRectangleCollider(x,y,8,16,2)

  self.collider:setCollisionClass('white')
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

  if not self.auto then
    self:manual()
  else
    self:autoRun()
  end
       
  local goingHor = self.collider:getX() -8
  if self.x > goingHor then
    self.isMoving = true
    self.dir = "left"
  elseif self.x < goingHor then
    self.isMoving = true
    self.dir = "right"
  else
    self.isMoving = false
  end

  self.x = self.collider:getX() -8
  self.y = self.collider:getY() -8

  self.img.default[self.dir]:update(dt)
  local enters = false
  if self.collider:enter('ColorEntity') then
    local data = self.collider:getEnterCollisionData('ColorEntity')
    enters = true
    self.changeCollider = true
    self.colliderColor = data.collider.obj.color
  end

  if self.collider:exit('ColorEntity') then
    self.changeCollider = true
    if enters == false then
      self.colliderColor = 'white'
    end
  end

  if self.changeCollider then
    self.changeCollider = false
    self.collider:setCollisionClass(self.colliderColor)
    self.colliderColor = 'white'
  end

  if self.collider:enter('Exit') then
    if Winning == 0 then
      Winning = 50
    end
  end
end


function Robit:draw()
  love.graphics.setColor(lovecc.getColor(self.colliderColor))
  if self.isMoving == false then
    self.img[self.mode][self.dir]:gotoFrame(1)
    self.img[self.mode][self.dir]:draw(self.spriteSheet, self.x,self.y, nil, nil, nil, self.offsetX, self.offsetY)
  else
    self.img[self.mode][self.dir]:draw(self.spriteSheet, self.x, self.y, nil, nil, nil, self.offsetX, self.offsetY)
  end
  love.graphics.setColor(1, 1, 1)
end


function Robit:manual()
  if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
    self.dir = "right"
    self.collider:applyForce(self.speed, 0)
  elseif love.keyboard.isDown("left") or love.keyboard.isDown("a") then
    self.dir = "left"
    self.collider:applyForce(-self.speed, 0)
    -- ball:applyForce(-50, 0)
  elseif love.keyboard.isDown("up") or love.keyboard.isDown("w")  then
    self.collider:setPosition(self.home.x, self.home.y)
    self.collider:setLinearVelocity(0, 0)
  elseif love.keyboard.isDown("down") or love.keyboard.isDown("s") then
    self.collider:applyForce(0, self.speed)
  end
end

function Robit:autoRun()
  if self.dir == "right" then
    self.collider:applyForce(self.speed, 5)
  elseif self.dir == "left" then
    self.collider:applyForce(-self.speed, 5)
  else
    self.dir = "right"
  end

end

function Robit:reset()
  self.collider:setLinearVelocity(0, 0)
  self.collider:setPosition(self.home.x, self.home.y)
  self.auto = false
  Button.isPressed = false
end


function Robit:inBubble(color)

end