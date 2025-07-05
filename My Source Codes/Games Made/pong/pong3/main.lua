WINDOW_WIDTH = 1280 
WINDOW_HEIGHT = 720 

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

push = require 'push'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallfont = love.graphics.newFont('font.ttf', 8)
    scorefont = love.graphics.newFont('font.ttf', 32)

    player1Score = 0
    player2Score = 0

    player1Y = 20
    player2Y = VIRTUAL_HEIGHT - 40


-- the game screen scale    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })
end 

function love.update(dt)
    if love.keyboard.isDown('w') then
        player1Y = player1Y - PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then
        player1Y = player1Y + PADDLE_SPEED * dt
    end

    if love.keyboard.isDown('up') then
        player2Y = player2Y - PADDLE_SPEED * dt        
    elseif love.keyboard.isDown('down') then
        player2Y = player2Y + PADDLE_SPEED * dt        
    end
end
-- press esc to close the game
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end


function love.draw()
    push:apply('start')
-- background
    love.graphics.clear(40 / 255, 45 / 255, 52 / 255 , 255 / 255)
-- ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
-- Paddles
    love.graphics.rectangle('fill', 5, player1Y, 5, 20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2Y, 5, 20)
-- title   
    love.graphics.setFont(smallfont)
    love.graphics.printf("hello pong!", 0, 20, VIRTUAL_WIDTH, 'center')
-- scores
    love.graphics.setFont(scorefont)
    love.graphics.print(player1Score, VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(player2Score, VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)

    push:apply('end')
end
