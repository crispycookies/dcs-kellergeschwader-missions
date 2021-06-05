local function initWinCondition()
    local airbase = AIRBASE:FindByName(AIRBASE.Syria.King_Hussein_Air_College)
    trigger.action.setUserFlag(1, 0)
    airbase:HandleEvent(EVENTS.BaseCaptured, function()
        env.info("STEADFAST: " .. airbase:GetName() .. " was captured")
        trigger.action.setUserFlag(1, 2)
    end)
end

initWinCondition()

env.info("STEADFAST: Steadfast initialized")
