WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 500
VIRTUAL_HEIGHT = 500


local sti = require "sti"

push = require 'push'

function love.load()
    -- Load map file
    map = sti("map.lua")
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)
    -- Update world
    map:update(dt)
end

function love.draw()
    push:apply('start')
    -- Draw world
    map:draw()
    push:apply('end')
end