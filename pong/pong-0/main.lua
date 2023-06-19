--[[
    Games50
    Pong Remake

    "The Day-0 Update"

    -- Main Program --
    This is just me practicing things. Dont mind me.
]]
--[[Declarong variables for window size]]
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

--[[
    Runs when the game first starts up, only once, used to inititate the game.
]]
function love.load()
    love.window.setMode(WINDOW_WIDTH,WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

--[[
    Called after update by LOVE2D, used to draw anything to the screen, updated or otherwise.
]]
function love.draw()
    love.graphics.printf(
        'Hello Pong',         -- text to render
        0,                    -- starting X (0 since we're going to center it based on width)
        WINDOW_HEIGHT / 2 - 6,-- starting Y (halfway down the screen)
        WINDOW_WIDTH,         -- number of pixels to center within (the entire screen here)
        'center')             -- alignment mode, can be 'center', 'left', or 'right'
    
end