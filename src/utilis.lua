function GetDist(startX, startY, endX, endY)
  local distX = math.abs(startX - endX)
  local distY = math.abs(startY - endY)
  local dist = math.sqrt(((startX - endX)^2 + (startY - endY)^2))
  return dist
end

function CalculateAngle(p1, p2)
  return math.atan2(p1.y - p2.y, p1.x - p2.x)
end

function CalculateXYFromDistAngle(x1, y1, dist, angle)
  local x2 = x1 + (dist) * math.cos(angle)
  local y2 = y1 + (dist) * math.sin(angle)
  return x2, y2
end

function CalculateXYDiff(x1, y1, x2, y2)
  if x2 == nil or y2 == nil then
    return
  end
  local diffX = x1 - x2
  local diffY = y1 - y2
  return diffX, diffY
end

function XYToTile(x,y)
  local tx = math.floor(x /TileSize)
  local ty = math.floor(y /TileSize)
  return tx, ty
end

function CalculateTilesPassedThrough(x,y)
  local tx = math.floor(x /TileSize)
  local ty = math.floor(y /TileSize)
  return tx, ty
end