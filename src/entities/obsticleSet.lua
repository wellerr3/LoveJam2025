ObsticleSet = Entity:extend()

ObstTypes = {
  Wall = ObsticleWall
}

function ObsticleSet:new(ObsSet)


end

function ObsticleSet:update(dt)

end


function ObsticleSet:draw()
  love.graphics.setColor(lovecc.getColor(self.color))
  love.graphics.rectangle( "fill", self.x, self.y, self.width, self.height )
  love.graphics.setColor(1, 1, 1)
end


