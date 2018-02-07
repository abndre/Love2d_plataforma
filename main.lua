local anim8 = require 'anim8'
local image, animation

local posX = 10
local dogX = 0
local speed = 100
local mirror =1


love.window.setTitle( "Judas Game" )
larguratela = love.graphics.getWidth()
alturatela = love.graphics.getHeight()

function love.load()
  love.window.setMode(960, 640)

  -- 375x267
  image = love.graphics.newImage('dd.png') 
  local g = anim8.newGrid(60, 50, image:getWidth(), image:getHeight())
  animation = anim8.newAnimation(g('1-5',1), 0.5)


  local h = anim8.newGrid(39, 37, image:getWidth(), image:getHeight())
  animationpato = anim8.newAnimation(h('1-3',4), 0.3)


  --bg
  background1 = love.graphics.newImage("/PARALLAX/layer_02_1920 x 1080.png")
  background2 = love.graphics.newImage("/PARALLAX/layer_02_1920 x 1080.png")

  --bg
  background1_1 = love.graphics.newImage("/PARALLAX/layer_05_640 x 480.png")
  background2_1 = love.graphics.newImage("/PARALLAX/layer_05_640 x 480.png")

  planodefundo ={
	 x=0,
	 y=0,
	 y2=0-background1:getHeight(),
   vel=10
	}

  

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

--funcoes
  planoDeFundoScrolling(dt)
end

function love.draw()

  --love.graphics.draw(background1,planodefundo.x,planodefundo.y)
  --love.graphics.draw(background2,planodefundo.x,planodefundo.y2)

  love.graphics.draw(background1_1,planodefundo.y, planodefundo.x,0,1,1,1)
  love.graphics.draw(background2_1,planodefundo.y2,planodefundo.x,0,1,1,1)

  love.graphics.draw(background1,planodefundo.y, planodefundo.x)--,0,background1:getHeight*0.5,background1:getWidth*0.5)
  love.graphics.draw(background2,planodefundo.y2,planodefundo.x)--,0,background1:getHeight*0.5,background1:getWidth*0.5)



  animation:draw(image, dogX, alturatela-image:getHeight())
  animationpato:draw(image, posX, 80,0,mirror,1,1)

end


function planoDeFundoScrolling(dt)
	planodefundo.y = planodefundo.y + planodefundo.vel*dt
	planodefundo.y2 = planodefundo.y2 + planodefundo.vel*dt

	if planodefundo.y > alturatela then
	 planodefundo.y = planodefundo.y2 - background2:getHeight()
   planodefundo.y = planodefundo.y2 - background2_1:getHeight()
	
	end

  if planodefundo.y2 > alturatela then
   planodefundo.y2 = planodefundo.y - background1:getHeight()
   planodefundo.y = planodefundo.y2 - background1_1:getHeight()
  
  end

end
