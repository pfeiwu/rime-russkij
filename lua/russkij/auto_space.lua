-- auto_space.lua
-- Author: kuroame

require("utf8")
local kAccepted = 1
local kNoop = 2
local Top = {}
function Top.init(env)
end

function Top.fini(env)
end

function Top.func(key_event, env)
    if key_event.keycode ~= 32 or key_event:release() then
        return kNoop
    end
    local script_text = env.engine.context:get_commit_text()
    if script_text == "" then
        return kNoop
    end
    script_text = script_text .. " "
    env.engine:commit_text(script_text)
    env.engine.context:clear()
    return kAccepted
end

return Top
