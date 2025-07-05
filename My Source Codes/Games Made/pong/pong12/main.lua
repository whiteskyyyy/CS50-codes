WINDOW_WIDTH = 1280 
WINDOW_HEIGHT = 720  

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

Class = require 'class'
push = require 'push'

require 'Paddle'
require 'Ball'

function love.load()
    math.randomseed(os.time())

    love.window.setTitle('Pong')

    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallfont = love.graphics.newFont('font.ttf', 8)
    scorefont = love.graphics.newFont('font.ttf', 32)
    victoryfont = love.graphics.newFont('font.ttf', 24)

    sounds = {
        ['paddle'] = love.audio.newSource('first.wav', 'static'),
        ['wall'] = love.audio.newSource('second.wav', 'static'),
        ['point'] = love.audio.newSource('third.wav', 'static'),
        ['winning'] = love.audio.newSource('WINNER.wav', 'static')
    }

    player1Score = 0
    player2Score = 0

    servingPlayer = math.random(2) == 1 and 1 or 2
    VictoryPlayer = math.random(2) == 1 and 1 or 2

    paddle1 = Paddle(5, 20, 5, 20)
    paddle2 = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 40, 5, 20)
    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    if servingPlayer == 1 then
        ball.dx = 100
    else 
        ball.dx = -100
    end

    
    gameState = 'start'


-- the game screen scale    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end 

function love.resize(w, h)
    push:resize(w, h)
end
-- paddle & ball movement / the game
function love.update(dt)

    if gameState == 'start' then
        player1Score = 0
        player2Score = 0
    end
    
    if ball.x <= 0 then
        player2Score = player2Score + 1
        servingPlayer = 1
        ball:reset()
        ball.dx = 100
        sounds['point']:play()
        if player2Score >= 10 then
            gameState = 'winner'
            VictoryPlayer = 2
            sounds['winning']:play()
        else
            gameState = 'serve'
        end
        
    end
    if ball.x >= VIRTUAL_WIDTH - 4 then
        player1Score = player1Score + 1
        servingPlayer = 2
        ball:reset()
        ball.dx = -100
        sounds['point']:play()
        if player1Score >= 10 then
            gameState = 'winner'
            VictoryPlayer = 1
            sounds['winning']:play()
        else
            gameState = 'serve'
        end
    end
    -- paddle.lua
    paddle1:update(dt)
    paddle2:update(dt)

    if ball:collides(paddle1) then
        -- deflect
        ball.dx = -ball.dx
        --sound
        sounds['paddle']:play()
    end

    if ball:collides(paddle2) then
        --deflect
        ball.dx = -ball.dx
        sounds['paddle']:play()
    end

    if ball.y <= 0 then
        --deflect
        ball.dy = -ball.dy
        ball.y = 0
        sounds['wall']:play()
    end

    if ball.y >= VIRTUAL_HEIGHT - 4 then
        --deflect
        ball.dy = -ball.dy
        ball.y = VIRTUAL_HEIGHT - 4
        sounds['wall']:play()
    end
    --first player up down 
    if love.keyboard.isDown('w') then
        paddle1.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('s') then
        paddle1.dy = PADDLE_SPEED
    else
        paddle1.dy = 0
    end
    -- second player up down
    if love.keyboard.isDown('up') then
        paddle2.dy = -PADDLE_SPEED        
    elseif love.keyboard.isDown('down') then
        paddle2.dy = PADDLE_SPEED   
    else
        paddle2.dy = 0     
    end
    --ball @ start of the game
    if gameState == 'play' then
        ball:update(dt)
    end
end
-- press esc to close the game
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'serve'
        elseif gameState == 'serve' then
            gameState = 'play'
        elseif gameState == 'winner' then
            gameState = 'start'
        --elseif gameState == 'play' then
            --gameState = 'start'
            --ball:reset()
        end
    end
end


function love.draw()
    push:apply('start')
-- background
    love.graphics.clear(40 / 255, 45 / 255, 52 / 255 , 255 / 255)
-- ball
    ball:render()
-- Paddles // paddle.lua
    paddle1:render()
    paddle2:render()
-- title   
    love.graphics.setFont(smallfont)
    if gameState == 'start' then
        love.graphics.printf("Welcome to Pong!", 0, 20, VIRTUAL_WIDTH, 'center')
        love.graphics.printf("Press Enter to Start!", 0, 32, VIRTUAL_WIDTH, 'center')
    elseif gameState == 'play' then
        love.graphics.printf("GoodLuck!", 0, 20, VIRTUAL_WIDTH, 'center')
    elseif gameState == 'serve' then
        love.graphics.printf("Player " .. tostring(servingPlayer) .. " 's turn!", 0, 20, VIRTUAL_WIDTH, 'center')
        love.graphics.printf("Press Enter to Serve!", 0, 32, VIRTUAL_WIDTH, 'center')
    elseif gameState == 'winner' then
        love.graphics.setFont(victoryfont)
        love.graphics.printf("Player " .. tostring(VictoryPlayer) .. " WINS!", 0, 20, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(smallfont)
        love.graphics.printf("Press Enter to Restart the Game!", 0, 49, VIRTUAL_WIDTH, 'center')
    end
-- scores
    love.graphics.setFont(scorefont)
    love.graphics.print(player1Score, VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(player2Score, VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)

    displayFPS()
    push:apply('end')
end

function displayFPS()
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.setFont(smallfont)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 40, 20)
    love.graphics.setColor(1, 1, 1, 1)
end
