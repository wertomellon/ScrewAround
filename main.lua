function love.load()
  width = 1280
  height = 720
  success = love.window.setMode(
    width,
    height,
    { fullscreen = false}
  )

-- Player table
player = {}
player.x = width/2
player.y = height/2
player.width = 10
player.height = 10
player.moveSpeed = 3
player.MOVESPEED = 3
player.runSpeed = 5
player.upBullets = {}
player.downBullets = {}
player.leftBullets = {}
player.rightBullets = {}
-- Bullet fire funtions for the player one for each direction
player.upFire = function()
  bullet = {}
  bullet.x = player.x + player.width/2
  bullet.y = player.y
  table.insert(player.upBullets,bullet)
 end
 player.downFire = function()
  bullet = {}
  bullet.x = player.x + player.width/2
  bullet.y = player.y + player.height
  table.insert(player.downBullets,bullet)
 end
 player.leftFire = function()
  bullet = {}
  bullet.x = player.x
  bullet.y = player.y + player.height/2
  table.insert(player.leftBullets,bullet)
 end
 player.rightFire = function()
  bullet = {}
  bullet.x = player.x + player.width
  bullet.y = player.y + player.height/2
  table.insert(player.rightBullets,bullet)
 end
 

end

-------------------------------------------------------------------------------------------------------------------------------
--updates the game on deltatime 
function love.update(dt)
  
  if love.keyboard.isDown('lshift') then
    player.moveSpeed = player.runSpeed
  else
    player.moveSpeed = player.MOVESPEED
  end
    
-- moving up
if love.keyboard.isDown('w') then
  player.y = player.y - player.moveSpeed
end
--[[
if love.keyboard.isDown('w') and love.keyboard.isDown("lshift") then
  player.y = player.y - player.runSpeed
end
--]]
--moving down
if love.keyboard.isDown('s') then
  player.y = player.y + player.moveSpeed
end
--[[
if love.keyboard.isDown('s') and love.keyboard.isDown("lshift") then
  player.y = player.y + player.runSpeed
end
--]]
--moving left
if love.keyboard.isDown('a') then
 player.x = player.x - player.moveSpeed
end
--[[
if love.keyboard.isDown('a') and love.keyboard.isDown("lshift") then
  player.x = player.x - player.runSpeed
end
--]]
--moving right
if love.keyboard.isDown('d') then
  player.x = player.x + player.moveSpeed
 end 
 --[[
if love.keyboard.isDown('d') and love.keyboard.isDown("lshift") then
  player.x = player.x + player.runSpeed
 end
 --]]
 
-------------------------------------------------------------------------------------------------------------------------------
--bullet firing 
if love.keyboard.isDown("up") then
  player.upFire()
 end

if love.keyboard.isDown("down") then
  player.downFire()
end

if love.keyboard.isDown("left") then
  player.leftFire()
end

if love.keyboard.isDown("right") then
  player.rightFire()
end

--detect firing


--end the game and close the window
if love.keyboard.isDown("escape") then
  love.event.quit()
end
------------------------------------------------------------------------------------------------------------------------------
--changes the values of the bullets so they render correctly and removes bullets that have gone off screen
--Upward bullets
 for key, value in pairs(player.upBullets) do
    if value.y < -10 then
      table.remove(player.upBullets, key)
    end
  value.y = value.y - 10
end
--Down bullets
  for key, value in pairs(player.downBullets) do
    if value.y > height + 10 then
      table.remove(player.downBullets, key)
    end
  value.y = value.y + 10
end
--left bullets
  for key, value in pairs(player.leftBullets) do
    if value.x < -10 then
      table.remove(player.leftBullets, key)
    end
  value.x = value.x - 10
end
--right bullets
for key, value in pairs(player.rightBullets) do
    if value.x > width + 10 then
      table.remove(player.rightBullets, key)
    end
  value.x = value.x + 10
end
-------------------------------------------------------------------------------------------------------------------------------
end


-------------------------------------------------------------------------------------------------------------------------------
function love.draw()
  
  --draws the player
  love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)

------------------------------------------------------------------------------------------------------------------------------
--draws the bullets

--up bullets
for key, value in pairs(player.upBullets) do
  love.graphics.rectangle('fill', value.x, value.y, 2, 2)
end

--down bullets
for key,value in pairs(player.downBullets) do
    love.graphics.rectangle('fill', value.x, value.y, 2, 2)
  end
--left bullets
for key,value in pairs(player.leftBullets) do
    love.graphics.rectangle("fill", value.x, value.y, 2, 2)
  end
  
  --right bullets
for key, value in pairs(player.rightBullets) do
    love.graphics.rectangle("fill", value.x, value.y, 2, 2)
  end
  -----------------------------------------------------------------------------------------------------------------------------
  
 
    
  end