-- Disable MOOSE player settings menu
_SETTINGS:SetPlayerMenuOff()

STEADFAST = {
	alertLevel = 1
}

dofile(missionDir .. "logic\\border-war\\Steadfast_SpawnDefs.lua")
dofile(missionDir .. "logic\\border-war\\Steadfast_Commander_Marker.lua")
dofile(missionDir .. "logic\\border-war\\Steadfast_Commander.lua")

-- Set up the capture zones
-- These need to match the zones in the Mission Editor where you want the fights happening
CommandPost1 = ZONE:New( "Zone1" )
CommandPost2 = ZONE:New( "Zone2" )
CommandPost3 = ZONE:New( "Zone3" )

-- Name the zones
-- Change these when porting between maps/regions
zone1Name = 'Zone1 (YA49, WP1)'
zone2Name = 'Zone2 (YB40, WP2)'
zone3Name = 'Zone3 (YB41, WP3)'

-- Name the teams, e.g. US, Russia to match your theatre etc
blueTeamName = 'NATO'
redTeamName = 'REDFOR'

-- Set some initial variables up
local wavesLaunched = 0
local zone1Status = zoneHeldBlue
local zone2Status = zoneHeldBlue
local zone3Status = zoneHeldBlue
local zoneHeldRed = "controlled by " .. redTeamName .. ".  Capture the position!"
local zoneHeldBlue = "controlled by " .. blueTeamName .. ".  Defend the position!"
local zoneAttackedRed = "under attack by " .. redTeamName .. ".  Defend the position!"
local zoneAttackedBlue = "under attack by " .. blueTeamName .. ".  Help retake the position!"
local zoneSecuringRed = "being secured by " .. redTeamName .. ".  Destroy their attack force!"
local zoneSecuringBlue = "being secured by " .. blueTeamName .. ".  Clear any nearby enemies!"
local zoneUnoccupied = "uncontrolled by either side.  Capture the position!"

-- Zone 1
CP1 = ZONE_CAPTURE_COALITION:New( CommandPost1, coalition.side.BLUE )
CP1:__Guard( 1 )
CP1:Mark()

function CP1:OnEnterGuarded( From, Event, To )
	if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
		if Coalition == coalition.side.BLUE then
			trigger.action.outText(""  .. zone1Name .. " is no longer under enemy attack.", 15)
			trigger.action.outSound("en_us_zone_defended.ogg")
			ctld.activatePickupZone("zone1pickup")
			zone1Status = zoneHeldBlue
		else
			trigger.action.outText( "Our attempt to recapture " .. zone1Name .. " has failed.  The enemy remains in control.", 15)
			trigger.action.outSound("en_us_zone_counterattack_failed.ogg")
			zone1Status = zoneHeldRed
		end
	end
self:Mark()
end
 
function CP1:OnEnterEmpty()
	-- trigger.action.outText(""  .. zone1Name .. " is now no longer held by either side.", 15)
	ctld.deactivatePickupZone("zone1pickup")
	zone1Status = zoneUnoccupied
self:Mark()
end
  
function CP1:OnEnterAttacked()
local Coalition = self:GetCoalition()
self:E({Coalition = Coalition})
	if Coalition == coalition.side.BLUE then
		trigger.action.outText( "Our forces have reported enemy contact at " .. zone1Name .. "!", 15)
		trigger.action.outSound("en_us_zone_attacked.ogg")
		zone1Status = zoneAttackedRed
	else
		trigger.action.outText( "Our forces are attempting to retake " .. zone1Name .. ".  Provide what support you can!", 15)
		trigger.action.outSound("en_us_zone_counterattacked.ogg")
		zone1Status = zoneAttackedBlue
	end
self:Mark()
end

function CP1:OnEnterCaptured()
local Coalition = self:GetCoalition()
self:E({Coalition = Coalition})
	if Coalition == coalition.side.BLUE then
		trigger.action.outText( "Our forces have captured " .. zone1Name .. " and are securing the area now!", 15)
		trigger.action.outSound("en_us_zone_captured.ogg")
		zone1Status = zoneSecuringBlue
	else
		trigger.action.outText( "The enemy has captured " .. zone1Name .. " and is attempting to secure the area.", 15)
		trigger.action.outSound("en_us_zone_lost.ogg")
		ctld.deactivatePickupZone("zone1pickup")
		zone1Status = zoneSecuringRed
	end   
CP1:__Guard( 30 )
self:Mark()
end

CP1:Start( 300 , 30 ) 

env.info('STEADFAST: Command Post 1 setup finished.')

-- Zone 2
CP2 = ZONE_CAPTURE_COALITION:New( CommandPost2, coalition.side.BLUE )
CP2:__Guard( 1 )
CP2:Mark()
  
function CP2:OnEnterGuarded( From, Event, To )
	if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
		if Coalition == coalition.side.BLUE then
			trigger.action.outText(""  .. zone2Name .. " is no longer under enemy attack.", 15)
			trigger.action.outSound("en_us_zone_defended.ogg")
			ctld.activatePickupZone("zone2pickup")
			zone2Status = zoneHeldBlue
		else
			trigger.action.outText( "Our attempt to recapture " .. zone2Name .. " has failed.  The enemy remains in control.", 15)
			trigger.action.outSound("en_us_zone_counterattack_failed.ogg")
			zone2Status = zoneHeldRed
		end
	end
self:Mark()
end
 
function CP2:OnEnterEmpty()
	-- trigger.action.outText(""  .. zone2Name .. " is now no longer held by either side.", 15)
	ctld.deactivatePickupZone("zone2pickup")
	zone2Status = zoneUnoccupied
self:Mark()
end
  
function CP2:OnEnterAttacked()
local Coalition = self:GetCoalition()
self:E({Coalition = Coalition})
	if Coalition == coalition.side.BLUE then
		trigger.action.outText( "Our forces have reported enemy contact at " .. zone2Name .. "!", 15)
		trigger.action.outSound("en_us_zone_attacked.ogg")
		zone2Status = zoneAttackedRed
	else
		trigger.action.outText( "Our forces are attempting to retake " .. zone2Name .. ".  Provide what support you can!", 15)
		trigger.action.outSound("en_us_zone_counterattacked.ogg")
		zone2Status = zoneAttackedBlue
	end
self:Mark()
end

function CP2:OnEnterCaptured()
local Coalition = self:GetCoalition()
self:E({Coalition = Coalition})
	if Coalition == coalition.side.BLUE then
		trigger.action.outText( "Our forces have captured " .. zone2Name .. " and are securing the area now!", 15)
		trigger.action.outSound("en_us_zone_captured.ogg")
		zone2Status = zoneSecuringBlue
	else
		trigger.action.outText( "The enemy has captured " .. zone2Name .. " and is attempting to secure the area.", 15)
		trigger.action.outSound("en_us_zone_lost.ogg")
		ctld.deactivatePickupZone("zone2pickup")
		zone2Status = zoneSecuringRed
	end   
CP2:__Guard( 30 )
self:Mark()
end
 
CP2:Start( 300 , 30 ) 
 
env.info('STEADFAST: Command Post 2 setup finished.')

-- Zone 3
CP3 = ZONE_CAPTURE_COALITION:New( CommandPost3, coalition.side.BLUE )
CP3:__Guard( 1 )
CP3:Mark()
  
function CP3:OnEnterGuarded( From, Event, To )
	if From ~= To then
    local Coalition = self:GetCoalition()
    self:E( { Coalition = Coalition } )
		if Coalition == coalition.side.BLUE then
			trigger.action.outText(""  .. zone3Name .. " is no longer under enemy attack.", 15)
			trigger.action.outSound("en_us_zone_defended.ogg")
			ctld.activatePickupZone("zone3pickup")
			zone3Status = zoneHeldBlue
		else
			trigger.action.outText( "Our attempt to recapture " .. zone3Name .. " has failed.  The enemy remains in control.", 15)
			trigger.action.outSound("en_us_zone_counterattack_failed.ogg")
			zone3Status = zoneHeldRed
		end
	end
self:Mark()
end
 
function CP3:OnEnterEmpty()
	-- trigger.action.outText(""  .. zone3Name .. " is now no longer held by either side.", 15)
	ctld.deactivatePickupZone("zone3pickup")
	zone3Status = zoneUnoccupied
self:Mark()
end
  
function CP3:OnEnterAttacked()
local Coalition = self:GetCoalition()
self:E({Coalition = Coalition})
	if Coalition == coalition.side.BLUE then
		trigger.action.outText( "Our forces have reported enemy contact at " .. zone3Name .. "!", 15)
		trigger.action.outSound("en_us_zone_attacked.ogg")
		zone3Status = zoneAttackedRed
	else
		trigger.action.outText( "Our forces are attempting to retake " .. zone3Name .. ".  Provide what support you can!", 15)
		trigger.action.outSound("en_us_zone_counterattacked.ogg")
		zone3Status = zoneAttackedBlue
	end
self:Mark()
end

function CP3:OnEnterCaptured()
local Coalition = self:GetCoalition()
self:E({Coalition = Coalition})
	if Coalition == coalition.side.BLUE then
		trigger.action.outText( "Our forces have captured " .. zone3Name .. " and are securing the area now!", 15)
		trigger.action.outSound("en_us_zone_captured.ogg")
		zone3Status = zoneSecuringBlue
	else
		trigger.action.outText( "The enemy has captured " .. zone3Name .. " and is attempting to secure the area.", 15)
		trigger.action.outSound("en_us_zone_lost.ogg")
		ctld.deactivatePickupZone("zone3pickup")
		zone3Status = zoneSecuringRed
	end   
CP3:__Guard( 30 )
self:Mark()
end
 
CP3:Start( 300 , 30 ) 

env.info('STEADFAST: Command Post 3 setup finished.')

-- Select one of the templates for the ground attack, spawn helos/fixed wing if enabled
function zone1Attack()
if zone1Status ~= zoneHeldRed then
	for i=1, zoneAttackQuantity do
		local zoneSelect = math.random(1,4)
		if zoneSelect == 1 then
				if STEADFAST.alertLevel == 1 then
				zone1Ground1_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone1Ground1_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone1Ground1_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone1Ground1_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone1Ground1_alert5:Spawn()
				end
			elseif zoneSelect == 2 then
				if STEADFAST.alertLevel == 1 then
				zone1Ground2_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone1Ground2_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone1Ground2_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone1Ground2_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone1Ground2_alert5:Spawn()
				end
			elseif zoneSelect == 3 then
				if STEADFAST.alertLevel == 1 then
				zone1Ground3_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone1Ground3_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone1Ground3_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone1Ground3_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone1Ground3_alert5:Spawn()
				end
			elseif zoneSelect == 4 then
				if STEADFAST.alertLevel == 1 then
				zone1Ground4_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone1Ground4_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone1Ground4_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone1Ground4_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone1Ground4_alert5:Spawn()
				end
		end
	end

	if zoneAttackHelicopters == true and STEADFAST_COMMANDER.ccRedAir == true then
		zone1AttackHelo:Spawn()
		else
	end

	if zoneAttackAircraft == true and STEADFAST_COMMANDER.ccRedAir == true then
		zone1AttackAircraft:Spawn()
		else
	end
	trigger.action.outText( "Prepare to defend!\n\nEnemy forces have been spotted gathering for an attack on " .. zone1Name .. "!", 15)
	trigger.action.outSound("en_us_attack_start.ogg")
	lastAttacked = zone1Name
	wavesLaunched = wavesLaunched + 1
	
	if STEADFAST_COMMANDER.ccRedSupport == true and alertLevelType == 'wave' then
		updateAlertLevel()
	end
else
timer.setFunctionTime(runGenerator, timer.getTime() + 30)
end
env.info('STEADFAST: Zone 1 attack creation attempted.')
end

-- Select one of the templates for the ground attack, spawn helos/fixed wing if enabled
function zone2Attack()
if zone2Status ~= zoneHeldRed then
		for i=1, zoneAttackQuantity do
		local zoneSelect = math.random(1,4)
		if zoneSelect == 1 then
				if STEADFAST.alertLevel == 1 then
				zone2Ground1_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone2Ground1_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone2Ground1_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone2Ground1_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone2Ground1_alert5:Spawn()
				end
			elseif zoneSelect == 2 then
				if STEADFAST.alertLevel == 1 then
				zone2Ground2_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone2Ground2_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone2Ground2_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone2Ground2_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone2Ground2_alert5:Spawn()
				end
			elseif zoneSelect == 3 then 
				if STEADFAST.alertLevel == 1 then
				zone2Ground3_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone2Ground3_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone2Ground3_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone2Ground3_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone2Ground3_alert5:Spawn()
				end
			elseif zoneSelect == 4 then 
				if STEADFAST.alertLevel == 1 then
				zone2Ground4_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone2Ground4_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone2Ground4_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone2Ground4_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone2Ground4_alert5:Spawn()
				end
		end
	end
	if zoneAttackHelicopters == true and STEADFAST_COMMANDER.ccRedAir == true then
		zone2AttackHelo:Spawn()
		else
	end

	if zoneAttackAircraft == true and STEADFAST_COMMANDER.ccRedAir == true then
		zone2AttackAircraft:Spawn()
		else
	end
	trigger.action.outText( "Prepare to defend!\n\nEnemy forces have been spotted gathering for an attack on " .. zone2Name .. "!", 15)
	trigger.action.outSound("en_us_attack_start.ogg")
	lastAttacked = zone2Name
	wavesLaunched = wavesLaunched + 1
	
	if STEADFAST_COMMANDER.ccRedSupport == true and alertLevelType == 'wave' then
		updateAlertLevel()
	end
else
timer.setFunctionTime(runGenerator, timer.getTime() + 30)
end
env.info('STEADFAST: Zone 2 attack creation attempted.')
end

-- Select one of the templates for the ground attack, spawn helos/fixed wing if enabled
function zone3Attack()
if zone3Status ~= zoneHeldRed then
		for i=1, zoneAttackQuantity do
		local zoneSelect = math.random(1,4)
		if zoneSelect == 1 then
				if STEADFAST.alertLevel == 1 then
				zone3Ground1_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone3Ground1_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone3Ground1_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone3Ground1_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone3Ground1_alert5:Spawn()
				end
			elseif zoneSelect == 2 then
				if STEADFAST.alertLevel == 1 then
				zone3Ground2_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone3Ground2_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone3Ground2_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone3Ground2_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone3Ground2_alert5:Spawn()
				end
			elseif zoneSelect == 3 then
				if STEADFAST.alertLevel == 1 then
				zone3Ground3_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone3Ground3_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone3Ground3_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone3Ground3_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone3Ground3_alert5:Spawn()
				end
			elseif zoneSelect == 4 then
				if STEADFAST.alertLevel == 1 then
				zone3Ground4_alert1:Spawn()
				elseif STEADFAST.alertLevel == 2 then
				zone3Ground4_alert2:Spawn()
				elseif STEADFAST.alertLevel == 3 then
				zone3Ground4_alert3:Spawn()
				elseif STEADFAST.alertLevel == 4 then
				zone3Ground4_alert4:Spawn()
				elseif STEADFAST.alertLevel == 5 then
				zone3Ground4_alert5:Spawn()
				end
		end
	end

	if zoneAttackHelicopters == true and STEADFAST_COMMANDER.ccRedAir == true then
		zone3AttackHelo:Spawn()
		else
	end

	if zoneAttackAircraft == true and STEADFAST_COMMANDER.ccRedAir == true then
		zone3AttackAircraft:Spawn()
		else
	end
	trigger.action.outText("Prepare to defend!\n\nEnemy forces have been spotted gathering for an attack on " .. zone3Name .. "!", 15)
	trigger.action.outSound("en_us_attack_start.ogg")
	lastAttacked = zone3Name
	wavesLaunched = wavesLaunched + 1
	
	if STEADFAST_COMMANDER.ccRedSupport == true and alertLevelType == 'wave' then
		updateAlertLevel()
	end
else
timer.setFunctionTime(runGenerator, timer.getTime() + 30)
end
env.info('STEADFAST: Zone 3 attack creation attempted.')
end

-- Randomly choose a zone and start an attack on it
function zoneAttackGenerate()
runGenerator = timer.scheduleFunction(zoneAttackGenerate, {}, timer.getTime() + math.random(zoneAttackTimeMin, zoneAttackTimeMax))
local zoneAttackChoice = math.random(1,3)
	if zoneAttackChoice == 1 then
	zone1Attack()
	elseif zoneAttackChoice == 2 then
	zone2Attack()
	elseif zoneAttackChoice == 3 then
	zone3Attack()
	else
	env.info( "STEADFAST: Something's gone a bit wrong in the scripting, calling off the attack!", 30)	
	timer.removeFunction(runGenerator)
	end
env.info('STEADFAST: Random zone attack generation attempted.')
end

-- Update the players periodically with the status of the zones
function borderStatusReportGlobal(individualRequest)
local reportIndividualRequest = individualRequest
	-- In case someone asks for a status report before the battle begins
	if lastAttacked == nil then
		lastAttacked = "their main base, pending an attack.  Stand by for further updates"
		else
	end	
	-- Determine if the command centers are still alive
	if STEADFAST_COMMANDER.ccRedAir == true then
		ccRedAirStatus = 'last seen around ' .. STEADFAST_COMMANDER.ccRedAirCoordinate
		else
		ccRedAirStatus = 'has been destroyed'
	end
	if STEADFAST_COMMANDER.ccRedSupport == true then
		ccRedSupportStatus = 'last seen around ' .. STEADFAST_COMMANDER.ccRedSupportCoordinates
		else
		ccRedSupportStatus = 'has been destroyed'
	end

	trigger.action.outText("BORDER STATUS REPORT:\n\nThe enemy is currently at Alert Level " .. STEADFAST.alertLevel .. "!\n\nEnemy buildup was most recently reported at " .. lastAttacked .. ".\n\nObjective " .. zone1Name .." is currently " .. zone1Status .."\nObjective " .. zone2Name .." is currently " .. zone2Status .."\nObjective " .. zone3Name .." is currently " .. zone3Status .."\n\nThe enemy air commander " .. ccRedAirStatus ..".\nThe enemy support commander " .. ccRedSupportStatus .. ".", 25 , false)
	trigger.action.outSound("en_us_situation_report.ogg")

	if missionStatusReportAutoDisplay == true and reportIndividualRequest == false then
		runStatusReportGlobal = timer.scheduleFunction(borderStatusReportGlobal, false, timer.getTime() + missionStatusReportTime)
		else
	end
	env.info('STEADFAST: Mission status report generated.')
end


-- Use CTLD to add troops to a zone
function zoneTroopRestock()
ctld.changeRemainingGroupsForPickupZone("zone1pickup", zoneRestockQuantity)
ctld.changeRemainingGroupsForPickupZone("zone2pickup", zoneRestockQuantity)
ctld.changeRemainingGroupsForPickupZone("zone3pickup", zoneRestockQuantity)
trigger.action.outText( "Additional infantry squads are available for pickup from friendly positions.", 15)
trigger.action.outSound("en_us_zone_restocked.ogg")
runTroopRestock = timer.scheduleFunction(zoneTroopRestock, {}, timer.getTime() + zoneRestockTime)
env.info('STEADFAST: Restocked troops in the zones.')
end

-- Report an increase of the alert level
function reportAlertLevel()
	if STEADFAST.alertLevel < 5 then
	trigger.action.outText( "The enemy alert level has increased.  Be prepared to face tougher opposition!\nThe enemy is now on Alert Level " .. STEADFAST.alertLevel .. "!", 15)
	trigger.action.outSound("en_us_alert_increased.ogg")
	elseif STEADFAST.alertLevel == 5 then
	trigger.action.outText( "The enemy is at maximum alert!  Be prepared to face their best units!", 15)
	trigger.action.outSound("en_us_alert_maximum.ogg")
	end
env.info('STEADFAST: Alert level report sent.')
end

-- Check to see if the criteria has been met for increasing the alert level
function updateAlertLevel()
if alertLevelType == 'wave' then
	local desiredLevel = math.floor( STEADFAST.alertLevel * alertLevelValue )
		if wavesLaunched == desiredLevel and STEADFAST.alertLevel < 5 then
			STEADFAST.alertLevel = STEADFAST.alertLevel + 1
			timer.scheduleFunction(reportAlertLevel, {}, timer.getTime() + 30)
			else
		end
	elseif alertLevelType == 'duration' and STEADFAST.alertLevel < 5 and STEADFAST_COMMANDER.ccRedSupport == true then
		STEADFAST.alertLevel = STEADFAST.alertLevel + 1
		timer.scheduleFunction(reportAlertLevel, {}, timer.getTime() + 30)
		runAlertUpdater = timer.scheduleFunction(updateAlertLevel, {}, timer.getTime() + alertLevelValue)
	end
env.info('STEADFAST: Alert level updated.')
end

 
-- Warn players of the impending attack 5 minutes before the specified start time
function missionLaunchWarning()
	trigger.action.outText("ENEMY ATTACK IMMINENT!\n\nEnemy attacks are expected to begin in approximately 5 minutes.\n\nMake your final preparations, and good luck!", 30 , false)
	trigger.action.outSound("en_us_start_warning.ogg")
end

-- Check every 60 seconds to see if the enemy holds all the objectives
function missionFailCheck()
	if zone1Status == heldRed and zone2Status == heldRed and zone3Status == heldRed then
		trigger.action.outText("The enemy has taken control of all the objectives.  This mission is a failure, return to base.", 60 , false)
		trigger.action.outSound("en_us_mission_failed.ogg")
        trigger.action.setUserFlag(1, 2)
	else
		-- Go for another status check in 60 seconds time
		runMissionFailCheck = timer.scheduleFunction(missionFailCheck, {}, timer.getTime() + 60)
	end
	env.info('STEADFAST: Routine check for mission failure conditions completed.')
end

-- Warn about mission start 5mins prior
timer.scheduleFunction(missionLaunchWarning, {}, timer.getTime() + missionPrepTime - 300)

-- Start the mission after the specified preparation time
timer.scheduleFunction(zoneAttackGenerate, {}, timer.getTime() + missionPrepTime)

-- Start restocking the zones with troop pickups, but only start the timer after the battle begins
timer.scheduleFunction(zoneTroopRestock, {}, timer.getTime() + missionPrepTime + zoneRestockTime)

-- Start checking for mission failure after the fight begins
timer.scheduleFunction(missionFailCheck, {}, timer.getTime() + missionPrepTime)

-- Start the zone status reports a few minutes after the first attack if the option is enabled
if missionStatusReportAutoDisplay == true then
timer.scheduleFunction(borderStatusReportGlobal, false, timer.getTime() + missionPrepTime + 120)
else
end

if alertLevelType == 'duration' then
timer.scheduleFunction(updateAlertLevel, {}, timer.getTime() + missionPrepTime + alertLevelValue )
end

-- Create the intel submenus and commands
-- local intelSubmenu = missionCommands.addSubMenu('Mission Intel', nil)
missionCommands.addCommand('Border Status Report', nil , borderStatusReportGlobal, true)

-- trigger.action.outText("DEBUG: Functions loaded.", 10 , false)

env.info('STEADFAST: All scripting functions successfully loaded.')