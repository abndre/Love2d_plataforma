local anim8 = require 'anim8'
local image, animation

local posX = 10
local dogX = 0
local speed = 100
local mirror =1


love.window.setTitle( "Judas Game" )


function love.load()
  -- 375x267
  image = love.graphics.newImage('dd.png') 
  local g = anim8.newGrid(60, 50, image:getWidth(), image:getHeight())
  animation = anim8.newAnimation(g('1-5',1), 0.5)


  local h = anim8.newGrid(39, 37, image:getWidth(), image:getHeight())
  animationpato = anim8.newAnimation(h('1-3',4), 0.3)

end


function love.update(dt)
  animation:update(dt)
  animationpato:update(dt)


   if love.keyboard.isDown("right") then
      posX = posX + (speed * dt)
      mirror = 1
   end
   if love.keyboard.isDown("left") then
      posX = posX - (speed * dt)
      mirror = -1
   end
 
 dogX  = dogX + 0.01

end

function love.draw()
  animation:draw(image, dogX, 200)
  animationpato:draw(image, posX, 80,0,mirror,1)
end