
Bird = Class{}

local GRAVITY = 20

function Bird:init()
    -- load bird image from disk and assign its width and height
    self.image = love.graphics.newImage('bird.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    -- position bird in the middle of the screen
    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)

    -- Y velocity; gravity
    self.dy = 0
end

function Bird:collides(pipe)
    if (self.x +2) + (self.width -4) >= pipe.x and self.x +2 <= pipe.x + PIPE_WIDTH then
        if (self.y +2) + (self.height -4) >= pipe.y and self.y +2 <= pipe.y + PIPE_HEIGHT then
            return true
        end
    end
    return false
end

function Bird:update(dt)
    -- apply gravity to velocity
    self.dy = self.dy + GRAVITY * dt

    -- add a sudden burst of negative gravity if we hit space
    if love.keyboard.wasPressed('space') then
        self.dy = -5
    end

    -- apply current velocity to Y position
    self.y = self.y + self.dy
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end