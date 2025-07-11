WINDOW_WIDTH = 1280 
WINDOW_HEIGHT = 720  

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

push = require 'push'

function love.load()
    math.randomseed(os.time())

    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallfont = love.graphics.newFont('font.ttf', 8)
    scorefont = love.graphics.newFont('font.ttf', 32)

    player1Score = 0
    player2Score = 0

    player1Y = 20
    player2Y = VIRTUAL_HEIGHT - 40

    ballX = VIRTUAL_WIDTH / 2 - 2
    ballY = VIRTUAL_HEIGHT / 2 - 2

    ballDX = math.random(2) == 1 and -100 or 100
    ballDY = math.random(-50, 50)

    gameState = 'start'


-- the game screen scale    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = true,
        vsync = true,
        resizable = false
    })
end 
-- paddle & ball movement
function love.update(dt)
    --first player up down
    if love.keyboard.isDown('w') then
        player1Y = math.max(0, player1Y - PADDLE_SPEED * dt)
    elseif love.keyboard.isDown('s') then
        player1Y = math.min(VIRTUAL_HEIGHT - 20, player1Y + PADDLE_SPEED * dt)
    end
    -- second player up down
    if love.keyboard.isDown('up') then
        player2Y = math.max(0, player2Y - PADDLE_SPEED * dt)        
    elseif love.keyboard.isDown('down') then
        player2Y = math.min(VIRTUAL_HEIGHT - 20, player2Y + PADDLE_SPEED * dt)        
    end
    --ball @ start of the game
    if gameState == 'play' then
        ballX = ballX + ballDX * dt
        ballY = ballY + ballDY * dt
    end
end
-- press esc to close the game
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        elseif gameState == 'play' then
            gameState = 'start'
            ballX = VIRTUAL_WIDTH / 2 - 2
            ballY = VIRTUAL_HEIGHT / 2 - 2

        ballDX = math.random(2) == 1 and -100 or 100
        ballDY = math.random(-50, 50)
        end
    end
end


function love.draw()
    push:apply('start')
-- background
    love.graphics.clear(40 / 255, 45 / 255, 52 / 255 , 255 / 255)
-- ball
    love.graphics.rectangle('fill', ballX, ballY, 4, 4)
-- Paddles
    love.graphics.rectangle('fill', 5, player1Y, 5, 20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2Y, 5, 20)
-- title   
    love.graphics.setFont(smallfont)
    if gameState == 'start' then
        love.graphics.printf("hello pong!", 0, 20, VIRTUAL_WIDTH, 'center')
    elseif gameState == 'play' then
        love.graphics.printf("HAHA HAKDOG!", 0, 20, VIRTUAL_WIDTH, 'center')
    end
-- scores
    love.graphics.setFont(scorefont)
    love.graphics.print(player1Score, VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(player2Score, VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)

    push:apply('end')
end
