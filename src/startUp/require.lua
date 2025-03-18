function RequireAll()
  Object = require "lib/classic"
  -- bf = require("lib/breezefield")
  WF = require "lib/windfield"
  cartographer = require "lib/cartographer"
  require "src/startup/initVariables"
  require "src/maps/mapMaker"
  require "src/maps/walls"
  require "src/entities/entity"
  require "src/entities/robit"
  require "src/entities/colorCircle"
  require "src/entities/colorHolder"
  require "src/entities/mouse"
  require "src/physics"
  Anim8 = require "lib/anim8"
  
end