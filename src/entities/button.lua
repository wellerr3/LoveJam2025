Button = Entity:extend()

function Button:new(x,y, text1, text2)
  Button.super.new(self, x - 48, y, nil, 96, 16)

  self.home = {x = x, y = y}
  -- self.font =  love.graphics.newFont("lib/RasterForgeRegular-JpBgm.ttf", 8)
  self.textUp = love.graphics.newText(Font)
  self.textUp:setf( text1, self.width, "center" )
  self.textDown = love.graphics.newText(Font)
  self.textDown:setf( text2, self.width, "center" )

  self.isPressed = false

  self.collider = world:newRectangleCollider(x - (self.width/2) ,y,self.width,self.height)
  self.collider:setCollisionClass('Button')
  self.collider:setGravityScale(0)
  self.collider:setFixedRotation(true)
  self.collider.obj = self
end

function Button:update(dt)

end


function Button:draw()
  if self.isPressed == false then
    love.graphics.setColor(lovecc.getColor('cornflowerblue'))
      love.graphics.rectangle( "fill", self.x, self.y, self.width, self.height )
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw( self.textUp, self.x, self.y + 4)
    love.graphics.rectangle( "line", self.x, self.y, self.width, self.height )
  else
    love.graphics.setColor(lovecc.getColor('grey'))
      love.graphics.rectangle( "fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw( self.textDown, self.x, self.y + 4)
    love.graphics.rectangle( "line", self.x, self.y, self.width, self.height)
  end
end


