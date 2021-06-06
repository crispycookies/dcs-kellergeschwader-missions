STEADFAST_TARGET_STATICS = {
    _statics = nil,
    _percentageToKill = 1,
    isDestroyed = false,
    targetsLeft = 0,
    targetsTotal = 0,
}
STEADFAST_TARGET_STATICS.__index = STEADFAST_TARGET_STATICS

function STEADFAST_TARGET_STATICS:New(statics, percentageToKill)
    local self = {}
    setmetatable(self, STEADFAST_TARGET_STATICS)

    self._percentageToKill = percentageToKill
    self._statics = statics
    world.addEventHandler(self)

    for _, static in pairs(statics) do
        if static:getLife() >= 1.0 then
            self.targetsTotal = self.targetsTotal + 1
        end
    end

    self.targetsLeft = self.targetsTotal
    return self
end

function STEADFAST_TARGET_STATICS:onEvent(eventdata)
    if eventdata.id == world.event.S_EVENT_DEAD and eventdata.initiator and eventdata.initiator.getName ~= nil then
        local staticName = eventdata.initiator:getName()
        local _self = self

        for _, static in pairs(self._statics) do
            if static:getName() == staticName then
                _self:_onStaticDead()
            end
        end
    end
end

function STEADFAST_TARGET_STATICS:_onStaticDead()
    if self.isDestroyed == false then
        self.targetsLeft  = self.targetsLeft - 1
        local staticsDeadPercentage = 1 - (self.targetsLeft / self.targetsTotal)
        if self.targetsLeft == 0 or staticsDeadPercentage >= self._percentageToKill then
            self.isDestroyed = true
            world.removeEventHandler(self)

            if self.OnTargetDestroyed then
                self:OnTargetDestroyed()
            end
        end
    end
end

function STEADFAST_TARGET_STATICS:OnTargetDestroyed()
end