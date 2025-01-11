Ball = {}


function Ball:load()
  self.img = love.graphics.newImage('assets/ball.png')

  self.width = 20
  self.height = self.width

  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2

  self.speed = 600

  self.xVel = -self.speed
  self.yVel = 0
end

function Ball:update(dt)
  Ball:move(dt)
  Ball:collide()

  Ball:checkBoundaries()
end

function Ball:move(dt)
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
end

function Ball:collide()
  if CheckCollision(self, Player) then
    self.xVel = self.speed
    local middleBall = self.y + self.height / 2
    local middlePlayer = Player.y + Player.height / 2
    local collisionPosition = middleBall - middlePlayer
    self.yVel = collisionPosition * 5
  end

  if CheckCollision(self, AI) then
    self.xVel = -self.speed
    local middleBall = self.y + self.height / 2
    local middleAI = AI.y + AI.height / 2
    local collisionPosition = middleBall - middleAI
    self.yVel = collisionPosition * 5
  end
end


function Ball:checkBoundaries()
  if self.y < 0 then
    self.y = 0
    self.yVel = -self.yVel
  elseif self.y + self.height > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height
    self.yVel = -self.yVel
  end

  if self.x < 0 then
    self.x = love.graphics.getWidth( ) / 2 - self.width / 2
    self.y = love.graphics.getHeight( ) / 2 - self.height / 2

    self.yVel = 0
    self.xVel = self.speed
  end

  if self.x < 0 then
    self.x = love.graphics.getWidth( ) / 2 - self.width / 2
    self.y = love.graphics.getHeight( ) / 2 - self.height / 2

    self.yVel = 0
    self.xVel = self.speed
  end

  if self.x < 0 then
    Ball:resetPosition(1)
  elseif self.x + self.width > love.graphics.getWidth() then
    Ball:resetPosition(-1)
  end
end

function Ball:resetPosition(modifier)
  self.x = love.graphics.getWidth( ) / 2 - self.width / 2
  self.y = love.graphics.getHeight( ) / 2 - self.height / 2
  self.yVel = 0
  self.xVel = self.xVel * modifier
end

function Ball:draw()
  love.graphics.draw(self.img, self.x, self.y)
end
