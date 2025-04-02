Walls = Object:extend()

function Walls:new(map)
  self.walls = {}
  self.obs = {}
  self.exit = {}
  if map.layers["Walls"] then
    for i, obj in pairs(map.layers["Walls"].objects) do
      if obj.shape == 'rectangle' then
        -- block1 = world:newCollider("Polygon", {150, 375, 250, 375, 250, 425, 150, 425})
        -- local verts = {obj.x, obj.y, obj.x + obj.width, obj.y, obj.x + obj.width, obj.y + obj.height, obj.x, obj.y + obj.height }
        -- local wall = world:newCollider("Polygon", verts)
        -- local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
        local wall = Wall(obj.shape, nil, obj.x, obj.y, obj.width, obj.height)
        table.insert(self.walls, wall)
      elseif obj.shape == 'polygon' then
        local verts = {}
        for ind, vert in ipairs(obj.polygon) do
          local x = vert.x + obj.x
          local y = vert.y + obj.y
          table.insert(verts, x)
          table.insert(verts, y)
        end
        local wall = Wall(obj.shape, verts)
        table.insert(self.walls, wall)
      end
    end
  end
  if map.layers["Obs"] then
    for i, obj in pairs(map.layers["Obs"].objects) do
      if obj.shape == 'rectangle' then
        local obsticle = ObsticleWall(obj.x,obj.y, obj.width, obj.height, obj.properties.color, obj.properties.type, nil, obj.shape, obj.properties.dir)
        table.insert(self.obs, obsticle)
      end
      if obj.shape == 'polygon' then
        local verts = {}
        for ind, vert in ipairs(obj.polygon) do
          local x = vert.x + obj.x
          local y = vert.y + obj.y
          table.insert(verts, x)
          table.insert(verts, y)
        end
        local obsticle = ObsticleWall(obj.x,obj.y, obj.width, obj.height, obj.properties.color, obj.properties.type, verts, obj.shape, obj.properties.dir)
        table.insert(self.obs, obsticle)
      end
    end
  end
  if map.layers["Exit"] then
    for i, obj in pairs(map.layers["Exit"].objects) do
      if obj.shape == 'rectangle' then
        local exit = Wall(obj.shape, nil, obj.x, obj.y, obj.width, obj.height, "exit", nil, obj.shape)
        table.insert(self.exit, exit)
      end
    end
  end
end


function Walls:update(dt)
  for i, v in ipairs(self.obs) do
    v:update(dt)
  end
end

function Walls:draw()
  for i, v in ipairs(self.obs) do
    v:draw()
  end
end

function Walls:addColliders()
  for i, wall in ipairs(self.walls) do
    wall:addCollider()
  end
  for i, ob in ipairs(self.obs) do
    ob:addCollider()
  end
  for i, exit in ipairs(self.exit) do
    exit:addCollider()
  end
end

function Walls:removeColliders()
  for i, item in ipairs(self.walls) do
    item.collider:destroy()
  end
  for i, item in ipairs(self.obs) do
    item.collider:destroy()
  end
  for i, item in ipairs(self.exit) do
    item.collider:destroy()
  end
end

