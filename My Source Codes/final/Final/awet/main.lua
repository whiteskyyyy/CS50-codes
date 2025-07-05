WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 1280
VIRTUAL_HEIGHT = 720

local sti = require "sti"
push = require 'push'
Class = require 'class'
maps = require 'Maps'
util = require 'Util'

function love.load()
    math.randomseed(os.time())
    map = sti("map.lua")
    maps = Maps()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    love.window.setTitle('SLIME HUNT!')

    love.keyboard.keysPressed = {}
    love.keyboard.keysReleased = {}

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
    maps:update(dt)

    love.keyboard.keysPressed = {}
    love.keyboard.keysReleased = {}
end

function love.draw()
    push:apply('start')
    love.graphics.translate(math.floor(-maps.camX + 0.5), math.floor(-maps.camY + 0.5))
    
    map:draw()
    maps:render()
    push:apply('end')
end

