require 'Dependencies'

local sti = require "sti"
function love.load()
    math.randomseed(os.time())
    map = sti("map.lua")
    love.window.setTitle('Slime Dungeon')
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['game-over'] = function() return GameOverState() end
    }
    gStateMachine:change('start')

    love.keyboard.keysPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true
end

function love.keyreleased(key)
	love.keyboard.keysReleased[key] = true
end

function love.keyboard.wasPressed(key)
	if (love.keyboard.keysPressed[key]) then
		return true
	else
		return false
	end
end

function love.keyboard.wasReleased(key)
	if (love.keyboard.keysReleased[key]) then
		return true
	else
		return false
	end
end

function love.update(dt)
    map:update(dt)

    love.keyboard.keysPressed = {}
    love.keyboard.keysReleased = {}
end

function love.draw()
    push:apply('start')
    gStateMachine:render()
    map:draw()
    push:apply('end')
end

