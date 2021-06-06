STEADFAST_TARGET_GROUPS = {
    _groups = nil,
    _percentageToKill = 1,
    isDestroyed = false,
    targetsLeft = 0,
    targetsTotal = 0,
}
STEADFAST_TARGET_GROUPS.__index = STEADFAST_TARGET_GROUPS

function STEADFAST_TARGET_GROUPS:New(groups, percentageToKill)
    local self = {}
    setmetatable(self, STEADFAST_TARGET_GROUPS)

    self._percentageToKill = percentageToKill
    self._groups = groups
    world.addEventHandler(self)

    for _, group in pairs(groups) do
        for _, unit in pairs(group:getUnits()) do
            if unit:getLife() >= 1.0 then
                self.targetsTotal = self.targetsTotal + 1
            end
        end
    end

    self.targetsLeft = self.targetsTotal
    return self
end

function STEADFAST_TARGET_GROUPS:onEvent(eventdata)
    if eventdata.id == world.event.S_EVENT_DEAD and eventdata.initiator and eventdata.initiator.getGroup ~= nil then
        local groupName = eventdata.initiator:getGroup():getName()
        local _self = self

        for _, group in pairs(self._groups) do
            if group:getName() == groupName then
                _self:_onUnitDead()
            end
        end
    end
end

function STEADFAST_TARGET_GROUPS:_onUnitDead()
    if self.isDestroyed == false then
        self.targetsLeft  = self.targetsLeft - 1
        local unitsDeadPercentag = 1 - (self.targetsLeft / self.targetsTotal)
        if self.targetsLeft == 0 or unitsDeadPercentag >= self._percentageToKill then
            self.isDestroyed = true
            world.removeEventHandler(self)

            if self.OnTargetDestroyed then
                self:OnTargetDestroyed()
            end
        end
    end
end

function STEADFAST_TARGET_GROUPS:OnTargetDestroyed()
end