STEADFAST_COMMANDER = {
    ccRedAir = false,
    ccRedAirCoordinate = nil,
    ccRedSupport = false,
    ccRedSupportCoordinates = nil
}

local spawnHeading = 280
local commanderCorrdOffset = 100
local redCommandGroupAirTemplates = {
    "RedCommandGroup_Air_Alert-1", "RedCommandGroup_Air_Alert-2",
    "RedCommandGroup_Air_Alert-3", "RedCommandGroup_Air_Alert-4",
    "RedCommandGroup_Air_Alert-5"
}

local redCommandGroupSupportTemplates = {
    "RedCommandGroup_Support_Alert-1", "RedCommandGroup_Support_Alert-2",
    "RedCommandGroup_Support_Alert-3", "RedCommandGroup_Support_Alert-4",
    "RedCommandGroup_Support_Alert-5"
}

local redCommandGroupAirSpawnZones = {
    ZONE:New("RedCommandGroupAirSpawn-1"),
    ZONE:New("RedCommandGroupAirSpawn-2"),
    ZONE:New("RedCommandGroupAirSpawn-3"),
    ZONE:New("RedCommandGroupAirSpawn-4"),
    ZONE:New("RedCommandGroupAirSpawn-5"),
    ZONE:New("RedCommandGroupAirSpawn-6"),
    ZONE:New("RedCommandGroupAirSpawn-7"),
}

local redCommandGroupSupportSpawnZones = {
    ZONE:New("RedCommandGroupSupportSpawn-1"),
    ZONE:New("RedCommandGroupSupportSpawn-2"),
    ZONE:New("RedCommandGroupSupportSpawn-3"),
    ZONE:New("RedCommandGroupSupportSpawn-4"),
    ZONE:New("RedCommandGroupSupportSpawn-5"),
    ZONE:New("RedCommandGroupSupportSpawn-6"),
    ZONE:New("RedCommandGroupSupportSpawn-7"),
}

local spawnCommandGroupAirAlert1 = SPAWN:New(redCommandGroupAirTemplates[1])
    :InitRandomizeZones(redCommandGroupAirSpawnZones)
    :InitGroupHeading(spawnHeading)
local spawnCommandGroupAirAlert2 = SPAWN:New(redCommandGroupAirTemplates[2])
    :InitRandomizeZones(redCommandGroupAirSpawnZones)
    :InitGroupHeading(spawnHeading)
local spawnCommandGroupAirAlert3 = SPAWN:New(redCommandGroupAirTemplates[3])
    :InitRandomizeZones(redCommandGroupAirSpawnZones)
    :InitGroupHeading(spawnHeading)
local spawnCommandGroupAirAlert4 = SPAWN:New(redCommandGroupAirTemplates[4])
    :InitRandomizeZones(redCommandGroupAirSpawnZones)
    :InitGroupHeading(spawnHeading)
local spawnCommandGroupAirAlert5 = SPAWN:New(redCommandGroupAirTemplates[5])
    :InitRandomizeZones(redCommandGroupAirSpawnZones)
    :InitGroupHeading(spawnHeading)

local spawnCommandGroupSupportAlert1 = SPAWN:New(redCommandGroupSupportTemplates[1])
    :InitRandomizeZones(redCommandGroupSupportSpawnZones)
    :InitGroupHeading(spawnHeading)
local spawnCommandGroupSupportAlert2 = SPAWN:New(redCommandGroupSupportTemplates[2])
    :InitRandomizeZones(redCommandGroupSupportSpawnZones)
local spawnCommandGroupSupportAlert3 = SPAWN:New(redCommandGroupSupportTemplates[3])
    :InitRandomizeZones(redCommandGroupSupportSpawnZones)
    :InitGroupHeading(spawnHeading)
local spawnCommandGroupSupportAlert4 = SPAWN:New(redCommandGroupSupportTemplates[4])
    :InitRandomizeZones(redCommandGroupSupportSpawnZones)
    :InitGroupHeading(spawnHeading)
local spawnCommandGroupSupportAlert5 = SPAWN:New(redCommandGroupSupportTemplates[5])
    :InitRandomizeZones(redCommandGroupSupportSpawnZones)
    :InitGroupHeading(spawnHeading)

-- Will be initializised later. But need to be references before. Execution should only start after initialization
local startTimerSpawnAirCommander = nil
local startTimerSpawnSupportCommander = nil


-- Functions commander died event
local function airCommanderDied()
    trigger.action.outText("The enemy air commander has been destroyed.  They won't be committing any more aircraft to the attack, for the moment.", 15, false)
    trigger.action.outSound("en_us_air_command_destroyed.ogg")
    STEADFAST_COMMANDER.ccRedAir = false
    STEADFAST_COMMANDER_MARKER:updateText()
    startTimerSpawnAirCommander()
end

local function supportCommanderDied()
    trigger.action.outText("The enemy support commander has been destroyed.  They won't be committing any more support vehicles to the attack or escalating the alert level further, for the moment.", 15, false)
    trigger.action.outSound("en_us_ground_command_destroyed.ogg")
    STEADFAST_COMMANDER.ccRedSupport = false

    if supportArty == true then
        zone1Arty:SpawnScheduleStop()
        zone2Arty:SpawnScheduleStop()
        zone3Arty:SpawnScheduleStop()
    end

    STEADFAST_COMMANDER_MARKER:updateText()
    startTimerSpawnSupportCommander()
end


-- Write off the Red Air Command Center and stop helo/aircraft spawns once it's destroyed
local checkRedAirCCDead = {}
local airCommandGroup = nil
local airCommanderId = -1
function checkRedAirCCDead:onEvent(event)
    if airCommandGroup ~= nil and
        event.initiator ~= nil and
        event.id == world.event.S_EVENT_DEAD and
        event.initiator.getID ~= nil and
        event.initiator:getID() == airCommanderId then

        airCommanderDied()
    end
end
world.addEventHandler(checkRedAirCCDead)

-- Write off the Red Vehicle Command Center and stop support battery spawns once it's destroyed
local checkRedSupportCCDead = {}
local supportCommandGroup = nil
local supportCommanderId = -1
function checkRedSupportCCDead:onEvent(event)
    if supportCommandGroup ~= nil and
        event.initiator ~= nil and
        event.id == world.event.S_EVENT_DEAD and
        event.initiator.getID ~= nil and
        event.initiator:getID() == supportCommanderId then

        supportCommanderDied()
    end
end
world.addEventHandler(checkRedSupportCCDead)




local function spawnAirCommanderGroup()
    if airCommandGroup ~= nil then
        airCommandGroup:Destroy(false, 0)
    end

    if STEADFAST.alertLevel == 1 then
        airCommandGroup = spawnCommandGroupAirAlert1:Spawn()
    elseif STEADFAST.alertLevel == 2 then
        airCommandGroup = spawnCommandGroupAirAlert2:Spawn()
    elseif STEADFAST.alertLevel == 3 then
        airCommandGroup = spawnCommandGroupAirAlert3:Spawn()
    elseif STEADFAST.alertLevel == 4 then
        airCommandGroup = spawnCommandGroupAirAlert4:Spawn()
    elseif STEADFAST.alertLevel == 5 then
        airCommandGroup = spawnCommandGroupAirAlert5:Spawn()
    end

    airCommanderId = airCommandGroup:GetUnit(4):GetID()

    STEADFAST_COMMANDER.ccRedAirCoordinate = airCommandGroup
        :GetCoordinate()
        :GetRandomCoordinateInRadius(commanderCorrdOffset, 0)
        :ToStringLLDDM()

    STEADFAST_COMMANDER.ccRedAir = true
    trigger.action.outText("An enemy air commander has entered the battlefield.\nHe was last seen around " .. STEADFAST_COMMANDER.ccRedAirCoordinate .. ".", 15, false)
    STEADFAST_COMMANDER_MARKER:updateText()
end

local function spawnSupportCommanderGroup()
    if supportCommandGroup ~= nil then
        supportCommandGroup:Destroy(false, 0)
    end

    if STEADFAST.alertLevel == 1 then
        supportCommandGroup = spawnCommandGroupSupportAlert1:Spawn()
    elseif STEADFAST.alertLevel == 2 then
        supportCommandGroup = spawnCommandGroupSupportAlert2:Spawn()
    elseif STEADFAST.alertLevel == 3 then
        supportCommandGroup = spawnCommandGroupSupportAlert3:Spawn()
    elseif STEADFAST.alertLevel == 4 then
        supportCommandGroup = spawnCommandGroupSupportAlert4:Spawn()
    elseif STEADFAST.alertLevel == 5 then
        supportCommandGroup = spawnCommandGroupSupportAlert5:Spawn()
    end

    supportCommanderId = supportCommandGroup:GetUnit(4):GetID()

    STEADFAST_COMMANDER.ccRedSupportCoordinates = supportCommandGroup
        :GetCoordinate()
        :GetRandomCoordinateInRadius(commanderCorrdOffset, 0)
        :ToStringLLDDM()

    STEADFAST_COMMANDER.ccRedSupport = true
    trigger.action.outText("An enemy support commander has entered the battlefield at\nHe was last seen around " .. STEADFAST_COMMANDER.ccRedSupportCoordinates .. ".", 15, false)
    STEADFAST_COMMANDER_MARKER:updateText()
end

startTimerSpawnAirCommander = function()
    timer.scheduleFunction(spawnAirCommanderGroup, {}, timer.getTime() + 1 + math.random(redAirCommanderRespawnMinTime, redAirCommanderRespawnMaxTime))
end

startTimerSpawnSupportCommander = function()
    timer.scheduleFunction(spawnSupportCommanderGroup, {}, timer.getTime() + 1 + math.random(redSupportCommanderRespawnMinTime, redSupportCommanderRespawnMaxTime))
end

-- Check if commander ar activated and start spawn timer
if redAirCommanderRespawnMinTime > -1 then
    spawnAirCommanderGroup()
end

if redSupportCommanderRespawnMinTime > -1 then
    spawnSupportCommanderGroup()
end

env.info("STEADFAST: Steadfast_Commander loaded")
