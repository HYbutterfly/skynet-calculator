local skynet = require "skynet"
local storage = require "storage"
local calculator = require "lualib.calculator"

storage.init {
    usermgr = {
        count = 0,
        usermap = {} -- id => User
    },
}

skynet.start(function()
    calculator:init(4)
    skynet.error("test call", calculator:call("test"))
end)
