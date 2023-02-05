PauseState = Class{__includes = BaseState}

function PauseState:update(dt)
  scrolling = false
  paused = true
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('countdown')
  end
end