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

for  _, zoneName in pairs({
    "jordan-air-defenders-ewr-spawn-1",
    "jordan-air-defenders-ewr-spawn-2",
    "jordan-air-defenders-ewr-spawn-3",
 }) do
    local zone = ZONE:New(zoneName)
    ewrSpawn:SpawnInZone(zone)
end

local detectionGroup = SET_GROUP:New()
detectionGroup:FilterPrefixes({ "jordan-ewr" })
detectionGroup:FilterStart()

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

env.info("STEADFAST: AA_Defense_Jordan initialized")