-- This can be put in a DO SCRIPT in the mission editor itself for ease of adjustment from the editor
-- Delay before the mission starts (in seconds)
missionPrepTime = 900

-- Set the minimum and maximum random time between attacks on the zones (in seconds)
zoneAttackTimeMin = 600
zoneAttackTimeMax = 1200

-- Set the amount of enemy ground groups that will attack the zone
zoneAttackQuantity = 3

-- Set whether helicopters and planes will attack the zone
zoneAttackHelicopters = true
zoneAttackAircraft = true

-- Enable/Disable and set the update time for the periodic status updates (in seconds)
missionStatusReportAutoDisplay = true
missionStatusReportTime = 900

-- Alert level type ('none'/'wave'/'duration') to set escalation method
-- Value sets either the number of waves per escalation, or time between escalations (in seconds)
alertLevelType = 'wave'
alertLevelValue = 3

-- Enable/Disable extra artillery units, and average time between their spawns (in seconds)
supportArty = true
supportArtySpawnTime = 900

-- Time between restocking zones with troops (in seconds), and amount of groups restocked
zoneRestockTime = 1200
zoneRestockQuantity = 5

-- Timerange until the command unit respawns (in seconds), set min time -1 to disable respawn
redSupportCommanderRespawnMinTime = 1200
redSupportCommanderRespawnMaxTime = 2400
redAirCommanderRespawnMinTime = 1200
redAirCommanderRespawnMaxTime = 2400