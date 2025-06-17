-- Simple multi-agent system in Love2D

local agents = {}

function love.load()
    for i=1, 20 do
        agents[i] = {
            x = math.random(0, 800),
            y = math.random(0, 600),
            speed = 100,
            color = {
                r = math.random(),
                g = math.random(),
                b = math.random()
            }
        }
    end
end

function love.update(dt)
    for _, agent in ipairs(agents) do
        -- Random movement
        local dx = (math.random() - 0.5) * agent.speed * dt
        local dy = (math.random() - 0.5) * agent.speed * dt
        
        -- Basic collision avoidance with screen edges
        agent.x = math.min(800, math.max(0, agent.x + dx))
        agent.y = math.min(600, math.max(0, agent.y + dy))
    end
end

function love.draw()
    for _, agent in ipairs(agents) do
        love.graphics.setColor(agent.color.r, agent.color.g, agent.color.b)
        love.graphics.circle("fill", agent.x, agent.y, 5)
    end
end
