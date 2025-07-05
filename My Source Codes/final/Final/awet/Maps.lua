Maps = Class{}
require 'Util'

local SCROLL_SPEED = 100

function Maps:init()
    self.tileWidth = 16
    self.tileHeight = 16
    self.mapWidth = 30
    self.mapHeight = 28
    self.tiles = {}

    -- camera offsets
    self.camX = 0
    self.camY = -3

    -- cache width and height of map in pixels
    self.mapWidthPixels = self.mapWidth * self.tileWidth
    self.mapHeightPixels = self.mapHeight * self.tileHeight
end

function Maps:update(dt)
    if love.keyboard.isDown('a') then
        self.camX = math.max(0, self.camX - dt * SCROLL_SPEED)
    elseif love.keyboard.isDown('d') then
        self.camX = math.min(self.camX + dt * SCROLL_SPEED, self.mapWidthPixels - VIRTUAL_WIDTH)
    end

    if love.keyboard.isDown('w') then
        self.camY = math.max(0, self.camY - dt * SCROLL_SPEED)
    elseif love.keyboard.isDown('s') then
        self.camY = math.min(self.camY + dt * SCROLL_SPEED, self.mapHeightPixels - VIRTUAL_HEIGHT)
    end
end

function Maps:render()

end

