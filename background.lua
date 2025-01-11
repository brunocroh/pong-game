Background = {}

function Background:load()
  self.universe = love.graphics.newImage('assets/universe.png')
  self.planets = love.graphics.newImage('assets/planets.png')
  self.middleWidth = self.planets:getWidth() / 2
  self.middleHeight = self.planets:getHeight() / 2
  self.rotation = 0
end

function Background:update(dt)
  self.rotation = self.rotation + 0.05 * dt
end

function Background:draw()
  love.graphics.draw(self.universe, 0, 0)
  love.graphics.draw(self.planets, self.middleWidth, self.middleHeight, self.rotation, 1, 1, self.middleWidth, self.middleHeight)
end
