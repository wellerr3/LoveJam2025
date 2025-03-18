Entity = Object:extend()

function Entity:new(x, y, imagePath, width, height)
  self.x = x
  self.y = y
  self.width = width or 16
  self.height = height or 16
  self.spriteSheet = love.graphics.newImage(imagePath)
  self.state = "still"
  self.offsetX = 0
  self.offsetY = 0
  self.name = "entity"
  self.home = {
    x = x,
    y = y
  }
  self.drawn = true
  self.rotation = 0
  self.mode = "default"
  self.scale = 1
  self.type = nil
  self.dir = "right"
end
