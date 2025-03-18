Walls = Object:extend()

function Walls:new()
  self.walls = {}
  
  if map.layers["Walls"] then
    for i, obj in pairs(map.layers["Walls"].objects) do
      if obj.shape == 'rectangle' then
        -- block1 = world:newCollider("Polygon", {150, 375, 250, 375, 250, 425, 150, 425})
        -- local verts = {obj.x, obj.y, obj.x + obj.width, obj.y, obj.x + obj.width, obj.y + obj.height, obj.x, obj.y + obj.height }
        -- local wall = world:newCollider("Polygon", verts)
        local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
        wall:setType('static')
      elseif obj.shape == 'polygon' then
        -- block1 = world:newCollider("Polygon", {150, 375, 250, 375, 250, 425, 150, 425})
        local verts = {}
        for ind, vert in ipairs(obj.polygon) do
          local x = vert.x + obj.x
          local y = vert.y + obj.y
          table.insert(verts, x)
          table.insert(verts, y)
        end
        local wall = world:newPolygonCollider(verts)
        wall:setType('static')
      end
    end
  end


end
function Walls:update(dt)

end

function Walls:draw()

end
