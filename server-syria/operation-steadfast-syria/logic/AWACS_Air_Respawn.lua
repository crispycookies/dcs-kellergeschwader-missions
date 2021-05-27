local rtbOnFuel = 0.05
local respawnTime = 1200
local messageTime = 15

AWACS = {
    spawn = nil,
    activeGroup = nil,
    checkFuelTimer = nil,
    startCoordinate = nil,
    forcedDestroy = false,
    groupName = ""
}
AWACS.__index = AWACS

function AWACS:_new(groupName)
    local self = {}
    setmetatable(self, AWACS)

    self.groupName = groupName
    self.spawn = SPAWN:New(groupName)
        :OnSpawnGroup(function(group)
                self:OnSpawn(group)
            end)
        :InitDelayOn()
        :InitRepeat()
        :InitLimit(1, 0)
        :SpawnScheduled(respawnTime, 0)
    return self
end

function AWACS:OnSpawn(activeGroup)
    self.activeGroup = activeGroup
    self.startCoordinate = activeGroup:GetCoordinate()
    self.checkFuelTimer = TIMER:New(AWACS.CheckFuel, self)

    local context = self
    function activeGroup:OnEventCrash()
        if context.forcedDestroy == false then
            trigger.action.outText(context.groupName .. " was killed. " .. context.groupName .. " will enter the battlefield again soon.", messageTime, false)
        end
        context:Reset()
    end

    self.checkFuelTimer:Start(60, 120)
    activeGroup:HandleEvent(EVENTS.Crash)
    trigger.action.outText(self.groupName .. " entered the battlefield.", messageTime, false)
end

function AWACS:CheckFuel()
    local fuel = self.activeGroup:GetFuelMin()

    if fuel < rtbOnFuel then
        local context = self
        local taskRouteToZone = self.activeGroup:TaskFunction("MOOSE_CONTROLLABLE_HELPER.PassContext", "Destroy", context)
        local route = {
            self.startCoordinate:WaypointAirTurningPoint(POINT_VEC3.RoutePointAltType.BARO, 220, { taskRouteToZone })
        }

        self.activeGroup:Route(route, 0)
        self.checkFuelTimer:Stop()

        trigger.action.outText(self.groupName .. ": BINGO - RTB ", messageTime, false)
    end
end

function AWACS:Destroy()
    self.forcedDestroy = true
    self.activeGroup:Destroy(true, 0) --must be true to provide propper respawn by moose spawn :(
    trigger.action.outText(self.groupName .. " left the battlefield for refuiling.", messageTime, false)
end

function AWACS:Reset()
    self.checkFuelTimer:Stop()
    self.checkFuelTimer = nil
    self.activeGroup = nil
    self.forcedDestroy = false
end

local awacsGroupName = {
    "Overlord"
}

for _, v in pairs(awacsGroupName) do
    AWACS:_new(v)
end