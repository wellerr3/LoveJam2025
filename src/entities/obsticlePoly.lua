-- ObsticlePoly = Entity:extend()

-- function ObsticlePoly:new(x,y, width, height, color, type, verts)
--   ObsticlePoly.super.new(self, x, y, nil, width, height)
--   self.type = type
--   self.color = color
--   self.verts = verts


-- end

-- function ObsticlePoly:update(dt)

-- end


-- function ObsticlePoly:draw()
--   love.graphics.setColor(lovecc.getColor(self.color))
--   love.graphics.rectangle( "fill", self.x, self.y, self.width, self.height )
--   love.graphics.setColor(1, 1, 1)
-- end



-- function ObsticlePoly:addCollider()

--   self.collider = world:newPolygonCollider(self.verts)
--   self.collider:setCollisionClass(self.color.."Wall")
--   self.collider:setFixedRotation(true)
--   self.collider:setType('static')
--   self.collider.obs = self

-- end
