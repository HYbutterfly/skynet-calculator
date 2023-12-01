local moudle = {
    "lobby",
}

local game = {
    lobby = {
        online = 0,
        players = {}
    }
}

local rwlock = {}


local function lock(str)
    return function(f)
        f()
        for k, v in pairs(game) do
            if type(v) == "function" and not rwlock[k] then
                rwlock[k] = str
            end
        end
    end
end


for _, m in ipairs(moudle) do
    local f = require(string.format("game.%s", m))
    f(game, lock)
end


return { game = game, rwlock = rwlock }
