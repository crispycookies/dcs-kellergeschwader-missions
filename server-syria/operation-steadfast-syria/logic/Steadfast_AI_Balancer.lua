AI_LIMIT_BALANCER = {
    set = nil,
    spawn = nil,
    maxAI = 0,
    scheduler = nil,
    checkClientsScheduleId = nil,
    activeGroups = {},
    activeGroupsCount = nil,
    rtbBase = nil
}
AI_LIMIT_BALANCER.__index = AI_LIMIT_BALANCER

function AI_LIMIT_BALANCER:New(set, spawn, maxAI, respawnTime, airbaseName)
    local self = {}
    setmetatable(self, AI_LIMIT_BALANCER)

    self.set = set
    self.spawn = spawn
    self.maxAI = maxAI
    self.scheduler = SCHEDULER:New(self)
    self.checkClientsScheduleIdself = self.scheduler:Schedule(self, self._checkClients, {}, 0, respawnTime)
    self.rtbBase = AIRBASE:FindByName(airbaseName)
    self.activeGroupsCount = 0
    self.activeGroups = {}

    return self
end

function AI_LIMIT_BALANCER:_checkClients()
    self.set:Clear():FilterOnce()
    local maxGroupCount = self.maxAI - self.set:Count()

    if self.activeGroupsCount < maxGroupCount then
        for i = self.activeGroupsCount, maxGroupCount - 1, 1 do
            local group = self.spawn:Spawn()
            if group ~= nil then
                self.activeGroupsCount = self.activeGroupsCount + 1
                table.insert(self.activeGroups, group)

                local _self = self
                group:HandleEvent(EVENTS.Crash, function ()
                    _self.activeGroupsCount = _self.activeGroupsCount - 1

                    for i, v in pairs(_self.activeGroups) do
                        if v == group then
                            _self.activeGroups[i] = nil
                        end
                    end
                end)
            end
        end
    end


    local n = maxGroupCount
    for _, group in pairs(self.activeGroups) do
        n = n - 1
        if n < 0 then
            self.activeGroupsCount = self.activeGroupsCount - 1

            local destroy = function ()
                group:Destroy(false)
            end

            if group:InAir() == true then
                group:RouteRTB(self.rtbBase)
                group:HandleEvent(EVENTS.Crash, destroy)
                group:HandleEvent(EVENTS.Dead, destroy)
                group:HandleEvent(EVENTS.Ejection, destroy)
                group:HandleEvent(EVENTS.EngineShutdown, destroy)
                group:HandleEvent(EVENTS.Land, destroy)
                group:HandleEvent(EVENTS.LandingAfterEjection, destroy)
                group:HandleEvent(EVENTS.PilotDead, destroy)
            else
                destroy()
            end
            


            for i, v in pairs(self.activeGroups) do
                if v == group then
                    self.activeGroups[i] = nil
                end
            end
        end
    end
end

local clientPlaneSet = SET_CLIENT:New()
    :FilterCoalitions("blue")
    :FilterCategories("plane")
    :FilterActive(true)
local spawnAG = SPAWN:New("H-A-10C II-AI-1")
    :InitCleanUp(240)
    :InitAirbase(AIRBASE.Syria.Eyn_Shemer, SPAWN.Takeoff.Cold)

AI_LIMIT_BALANCER:New(clientPlaneSet, spawnAG, 4, 10, AIRBASE.Syria.Eyn_Shemer)
env.info("STEADFAST: Steadfast_AI_Balancer initialized")