--[[
    day 1
    The Low-Res Update
    --Main Program
]]

-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic

--htttps://github.com/Ulydev/push
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

--[[ 
    Runs when the game first starts up, only once; used to initialize the game.
]]
function love.load()
    --use nearest-neighbor filtering on upscaling and downscaling to prevent blurring of text
    --and graphics; try removing this function to see the difference!
    love.graphics.setDefaultFilter('nearest', 'nearest')

    --Initialize our virtual resolution, which will be rendered within our
    --actual window no matter its dimensions; replaces our love.window.setMode call
    --from the last example
    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

--[[
    Keyboard handling, calledby LÖVE2D each frame;
    passes in the key we pressed so we can access.
]]
function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        --function LOVE gives us to terminate application
        love.event.quit()
    end
end

--[[
    Called after update by LOVE2D, used to draw anything to the screen,
    updated or otherwise.
]]
function love.draw()
    --begin rendering at virtual resolution\
    push:apply('start')

    --condensed onto one line from last example
    --note we are now using virtual width and height now for text placement
    love.graphics.printf('Hello Pong', 0, VIRTUAL_HEIGHT/2 - 6, VIRTUAL_WIDTH, 'center')

    --end rendering at virtual resolution
    push:apply('end')
end