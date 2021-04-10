STEADFAST_COMMANDER_MARKER = {}

local commanderStatusMarkerZoneName = "RedCommanderStatusMarker";
local marker = nil

if redAirCommanderRespawnMinTime > -1 or redSupportCommanderRespawnMinTime > -1 then
    local markerZoneCoordinate = ZONE:New(commanderStatusMarkerZoneName):GetCoordinate()
    marker = MARKER
        :New(markerZoneCoordinate, "Commander status:")
        :ReadOnly()
        :ToCoalition(coalition.side.BLUE)
end

STEADFAST_COMMANDER_MARKER.updateText = function()
    local text = "Commander status"
    if redAirCommanderRespawnMinTime > -1 then
        if STEADFAST_COMMANDER.ccRedAir == true then
            text = text .. "\nAir commander:         " .. STEADFAST_COMMANDER.ccRedAirMGRS
        else
            text = text .. "\nAir commander: dead"
        end
    end

    if redSupportCommanderRespawnMinTime > -1 then
        if STEADFAST_COMMANDER.ccRedSupport == true then
            text = text .. "\nSupport commander: " .. STEADFAST_COMMANDER.ccRedSupportMGRS
        else
            text = text .. "\nSupport commander: dead"
        end
    end

    marker:UpdateText(text)
end

env.info("STEADFAST: Steadfast_Commander_Marker loaded")
