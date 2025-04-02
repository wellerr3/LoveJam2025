MapMaker = Object:extend()

function MapMaker:new()
    self.maps = {}
    self.walls = {}
    local numMaps = 4
    for i = numMaps, 1, -1 do
        local mapLoc = "src/maps/map"..i..".lua"
        local map = cartographer.load("src/maps/map"..i..".lua")
        self.walls["map"..i] = Walls(map)
        self.maps["map"..i] = map
    end

    self.walls[CurrMap]:addColliders()

end

function MapMaker:update(dt)
    self.maps[CurrMap]:update(dt)
    self.walls[CurrMap]:update(dt)

end

function MapMaker:draw()
    self.maps[CurrMap]:draw()
    self.walls[CurrMap]:draw()
end


function MapMaker:changeMap(newMap)
    if self.maps[newMap]then
      self.walls[CurrMap]:removeColliders()
      self.walls[newMap]:addColliders()
      CurrMap = newMap
    else
      print ("ERROR: no map named that")
    end
  end