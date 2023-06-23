--[[
    Flappy Bird clone using Lua and LÖVE2D
]]

-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic

push = require 'push'

-- Physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual screen dimension
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

-- images we load into memory from files to later draw onto the screen
local background = love.graphics.newImage('background.png')
local ground = love.graphics.newImage('ground.png')

function love.load()
    -- filter
    love.graphics.setDefaultFilter('nearest', 'nearest')
    -- Title
    love.graphics.setTitle("Fifty Bird")

--initialize virtual resolution
push:setuScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    resizable = true,
    fullscreen = false,
    vsync = on
})
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:start()

    love.graphics.draw(background, 0, 0)

    love.graphics.draw(ground, 0, VIRTUAL_HEIGHT - 16)

    push:finish()
end