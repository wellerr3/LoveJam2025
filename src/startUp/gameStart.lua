function GameStart()
  require("src/startup/require")
  RequireAll()
  -- Scene = Scene()

  Physics = Physics()

  
  -- World:setCallbacks( beginContact, endContact, preSolve, postSolve )
  -- world:addCollisionClass('Solid')
  -- world:addCollisionClass('Ghost', {ignores = {'Solid'}})
end