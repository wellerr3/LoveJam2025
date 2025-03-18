ColorHolder = Entity:extend()

function ColorHolder:new(x,y, color)

  self.objs = {}
  local obj = ColorCicle(300, 100, "red", 25)
  table.insert(self.objs, obj)

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