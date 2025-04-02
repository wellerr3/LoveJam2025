ColorHolder = Entity:extend()


ColorObjs = {
  {{x = 100, y = 275, color = "red", radius = 16}, {x = 200, y = 275, color = "blue", radius = 16}, {x = 300, y = 275, color = "green", radius = 16}}
}
function ColorHolder:new(level)

  self.objs = {}
  local obj = {}
  for i,v in ipairs(ColorObjs[level]) do
    obj = ColorCircle(v.x, v.y, v.color, v.radius)
    table.insert(self.objs, obj)
  end

  

end

function ColorHolder:update(dt)
  for i,v in ipairs(self.objs) do
    v:update(dt)
  end
end


function ColorHolder:draw()
  for i,v in ipairs(self.objs) do
    v:draw()
  end
end


function ColorHolder:reset()
  for i,v in ipairs(self.objs) do
    v.collider:setPosition(v.home.x, v.home.y)
  end 
end
