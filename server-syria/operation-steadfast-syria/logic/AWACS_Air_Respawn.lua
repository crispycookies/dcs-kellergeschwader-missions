AWACS = {
    spawn = nil,
    activeGroup = nil,
    checkFuelTimer = nil,
    startCoordinate = nil,
}
AWACS.__index = AWACS

function AWACS:_new(groupName)
    local self = {}
    setmetatable(self, COMMANDER)

    self.spawn = SPAWN:New(groupName)
        :OnSpawnGroup(function(group)
                AWACS:OnSpawn(group)
            end)
        :InitDelayOff()
        :InitLimit(1, 0)
        :SpawnScheduled(60, 0) -- TODO: SET TIME
end

function AWACS:OnSpawn(activeGroup)
    self.activeGroup = activeGroup
    self.startCoordinate = activeGroup:GetCoordinate()
    self.checkFuelTimer = TIMER:New(AWACS.CheckFuel, self)

    local context = self
    function activeGroup:OnEventCrash()
        trigger.action.outText("Our AWACS was killed. Another AWACS will enter the battlefield soon.", 60, false)
        context:Reset()
    end

    self.checkFuelTimer:Start(60, 120)
    activeGroup:HandleEvent(EVENTS.Crash)
    trigger.action.outText("Our AWACS entered the battlefield.", 60, false)
end

function AWACS:CheckFuel()
    local fuel = self.activeGroup:GetFuelMin()
    
    if fuel < 0.9 then
        local context = self
        local taskRouteToZone = self.activeGroup:TaskFunction("AWACS:Destroy", context)
        local route = {
            self.startCoordinate:WaypointAirTurningPoint(POINT_VEC3.RoutePointAltType.BARO, 220, { taskRouteToZone })
        }

        self.activeGroup:Route(route, 0)
        self.checkFuelTimer:Stop()

        trigger.action.outText("AWACS: BINGO - RTB ", 60, false)
    end
end

function AWACS:Destroy()
    self.activeGroup:Destroy(false, 0)
    self:Reset()
end

function AWACS:Reset()
    self.checkFuelTimer:Stop()
    self.checkFuelTimer = nil
    self.activeGroup = nil
end

local awacsGroupName = {
    "Overlord"
}

for _, v in pairs(awacsGroupName) do
    AWACS:_new(v)
end