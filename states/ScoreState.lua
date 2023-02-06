ScoreState = Class { __includes = BaseState }

function ScoreState:enter(params)
  self.score = params.score

  self.image = love.graphics.newImage('star.png')
end

function ScoreState:update(dt)
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('countdown')
  end
end

function ScoreState:render()
  love.graphics.setFont(flappyFont)
  love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

  local starWidth = self.image:getWidth()
  local starHeight = self.image:getHeight()

  local numStars = 0
  if self.score >= 11 then
    numStars = 3
  elseif self.score >= 6 then
    numStars = 2
  elseif self.score >= 1 then
    numStars = 1
  end

  local spacing = 5
  local x = (VIRTUAL_WIDTH - (numStars - 1) * spacing - numStars * starWidth) / 2

  for i = 1, numStars do
    love.graphics.draw(self.image, x, VIRTUAL_HEIGHT / 2 - starHeight / 2 - 5)
    x = x + starWidth + spacing
  end

  love.graphics.setFont(mediumFont)
  love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

  love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end

