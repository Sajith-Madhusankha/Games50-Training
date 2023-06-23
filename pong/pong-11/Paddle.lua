--[[
    Pong Remake

    -- Paddle Class --

    Represents a paddle that can move up and down. Used in the main
    program to deflect the ball back toward the opponent.
]]

Paddle = Class{}

--[[
    The 'init' function on our class is called just once, when the object
    is first created. Used to set up all variables in the class and get it
    ready for use.
    Our Paddle should take an X and a Y, for positioning, as well as a width
    and height for its dimensions.

    Note that `self` is a reference to *this* object, whichever object is
    instantiated at the time this function is called. Different objects can
    have their own x, y, width, and height values, thus serving as containers
    for data. In this sense, they're very similar to structs in C.
]]
function Paddle:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    -- Velocity is the rate at which the paddle will move up and down, in pixels
    -- per second. We initialize it to zero here so that the paddle doesn't move
    -- until we press a key.
    self.dy = 0
end

function Paddle:update(dt)
    if self.dy < 0 then
        -- If dy is negative, we're moving up. So we want to subtract from y instead.
        self.y = math.max(0, self.y + self.dy * dt)
    else
        -- If dy is positive, we're moving down. So we want to add to y instead.
        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
    end
end

function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end