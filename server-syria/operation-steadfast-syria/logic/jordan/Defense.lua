FRACTION_JORDAN = {
    isHot = false
}

local squadron = {
    name = "jordan-air-defenders",
    airbase = AIRBASE.Syria.King_Hussein_Air_College,
    templateNames = { "jordan-air-defenders-1" }
}

local ewrSpawn = SPAWN
    :New("jordan-ewr-preset-1")
    :InitRandomizeTemplate({
        "jordan-ewr-preset-1"
    })

local detectionGroup = SET_GROUP:New()
local ewrGroups = {}
for  _, zoneName in pairs({
    "jordan-air-defenders-ewr-spawn-1",
    -- "jordan-air-defenders-ewr-spawn-2",
    "jordan-air-defenders-ewr-spawn-3",
 }) do
    local zone = ZONE:New(zoneName)
    local ewrGroup = ewrSpawn:SpawnInZone(zone)
    detectionGroup:AddGroup(ewrGroup)
    ewrGroups[ewrGroup.GroupName] = ewrGroup
end

local eventHandler = EVENT:New()
eventHandler:HandleEvent(EVENTS.Dead)
function eventHandler:OnEventDead(eventdata)
    if eventdata.IniGroup ~= nil then
        local isSetEvent = ewrGroups[eventdata.IniGroup.GroupName] ~= nil

        if isSetEvent == true and FRACTION_JORDAN.isHot == false then
            eventHandler:UnHandleEvent(EVENTS.Dead)
            eventHandler = nil
            
            trigger.action.outText("Jordanian units were killed in the no-fly zone.\nJordan will increase its attack rate and strength.", 30, false)
            FRACTION_JORDAN.isHot = true
            env.info("STEADFAST: Jordan hot")
        end
    end
end

local detectionAreas = DETECTION_AREAS:New(detectionGroup, 100000)
local a2aDispatcher = AI_A2A_DISPATCHER:New(detectionAreas)
a2aDispatcher:SetEngageRadius(50000)

local defendZone = ZONE:New("jordan-air-defend-zone")
defendZone:DrawZone(-1, {1, 0, 0}, 1, {1, 0, 0}, 0.15, 2, true)

a2aDispatcher:SetBorderZone(defendZone)
a2aDispatcher:SetSquadron(squadron.name, squadron.airbase, squadron.templateNames)
a2aDispatcher:SetSquadronOverhead(squadron.name, 1.5)
a2aDispatcher:SetSquadronGrouping(squadron.name, 2)
a2aDispatcher:SetSquadronTakeoffFromRunway(squadron.name)

local capZone = ZONE_POLYGON:New( "jordan-air-defend-cap-zone", GROUP:FindByName( "jordan-air-defend-cap-zone" ) )
a2aDispatcher:SetSquadronCap(squadron.name, capZone, 4000, 8000, 400, 600, 800, 1200, "BARO")
a2aDispatcher:SetSquadronCapInterval(squadron.name, 1, 180, 600)

env.info("STEADFAST: Fraction_Jordan initialized")

JORDAN_DEFENSE = {}
function JORDAN_DEFENSE:onEvent(event)
end
world.addEventHandler(JORDAN_DEFENSE)