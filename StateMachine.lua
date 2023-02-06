StateMachine = Class{}

function StateMachine:init(states)
  self.empty = {
    render = function () end,
    update = function () end,
    enter = function () end,
    exit = function () end
  }
  self.states = states or {}
  self.current = self.empty
  self.currentStateName = nil
end

function StateMachine:change(stateName, enterParams)
  assert(self.states[stateName])
  self.current:exit()
  self.current = self.states[stateName]()
  self.current:enter(enterParams)
  self.currentStateName = stateName
end

function StateMachine:update(dt)
  self.current:update(dt)
end

function StateMachine:render()
  self.current:render()
end

function StateMachine:isCurrent(state)
  print(self.currentStateName)
  return self.currentStateName == state
end