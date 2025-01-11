
Player = {}

function Player:load()
  self.img = love.graphics.newImage('assets/1.png')
  self.width = 20
  self.height = 100

  self.x = 50
  self.y = love.graphics.getHeight() / 2 - self.height

  self.speed = 500

end

function Player:update(dt)
  Player:move(dt)
  Player:checkBoundaries()
end

function Player:move(dt)
  if love.keyboard.isDown('k') then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown('j') then
    self.y = self.y + self.speed * dt
  end
end

function Player:checkBoundaries()
  if self.y < 0 then
    self.y = 0
  elseif self.y + self.height > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height
  end
end

function Player:draw()
  love.graphics.draw(self.img, self.x, self.y)
end
