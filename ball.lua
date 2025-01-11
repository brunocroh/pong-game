Ball = {}


function Ball:load()
  self.img = love.graphics.newImage('assets/ball.png')
  self.soundHit = love.audio.newSource('assets/hit.mp3', 'stream')
  self.soundScore = love.audio.newSource('assets/score.mp3', 'stream')
  self.soundHit:setVolume(0.1)
  self.soundScore:setVolume(0.2)

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
    self.soundHit:play()
    self.xVel = self.speed
    local middleBall = self.y + self.height / 2
    local middlePlayer = Player.y + Player.height / 2
    local collisionPosition = middleBall - middlePlayer
    self.yVel = collisionPosition * 5
  end

  if CheckCollision(self, AI) then
    self.soundHit:play()
    self.xVel = -self.speed
    local middleBall = self.y + self.height / 2
    local middleAI = AI.y + AI.height / 2
    local collisionPosition = middleBall - middleAI
    self.yVel = collisionPosition * 5
  end
end



function Ball:checkBoundaries()
  if self.y < 0 then
    self.soundHit:play()
    self.y = 0
    self.yVel = -self.yVel
  elseif self.y + self.height > love.graphics.getHeight() then
    self.soundHit:play()
    self.y = love.graphics.getHeight() - self.height
    self.yVel = -self.yVel
  end

  if self.x < 0 then
    Ball:resetPosition()
    Score.ai = Score.ai + 1
  elseif self.x + self.width > love.graphics.getWidth() then
    Ball:resetPosition()
    Score.player = Score.player + 1
  end
end

function Ball:resetPosition()
  self.soundScore:play()
  self.x = love.graphics.getWidth( ) / 2 - self.width / 2
  self.y = love.graphics.getHeight( ) / 2 - self.height / 2
  self.yVel = 0
  self.xVel = self.xVel * -1
end

function Ball:draw()
  love.graphics.draw(self.img, self.x, self.y)
end
