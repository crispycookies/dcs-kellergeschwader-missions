-- MOOSE Spawn Definitions for groups


-- Set templates for all the different alert levels
-- Levels 2 & 4 are "intermediate" levels that mix the level 3 pool with the level below and above
ground_templates_alert1 = { 
'RedGroundForces-AlertL 1',
'RedGroundForces-AlertL 2',
'RedGroundForces-AlertL 3',
}

ground_templates_alert2 = { 
'RedGroundForces-AlertL 1',
'RedGroundForces-AlertL 2',
'RedGroundForces-AlertL 3',
'RedGroundForces-AlertM 1',
'RedGroundForces-AlertM 2',
'RedGroundForces-AlertM 3',
}

ground_templates_alert3 = { 
'RedGroundForces-AlertM 1',
'RedGroundForces-AlertM 2',
'RedGroundForces-AlertM 3',
}

ground_templates_alert4 = { 
'RedGroundForces-AlertM 1',
'RedGroundForces-AlertM 2',
'RedGroundForces-AlertM 3', 
'RedGroundForces-AlertH 1',
'RedGroundForces-AlertH 2',
'RedGroundForces-AlertH 3',
} 

ground_templates_alert5 = { 
'RedGroundForces-AlertH 1',
'RedGroundForces-AlertH 2',
'RedGroundForces-AlertH 3',
}

-- ALERT 1
-- Spawns for Zone 1
zone1Ground1_alert1=SPAWN:New('zone1GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground2_alert1=SPAWN:New('zone1GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground3_alert1=SPAWN:New('zone1GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground4_alert1=SPAWN:New('zone1GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
		
-- Spawns for Zone 2
zone2Ground1_alert1=SPAWN:New('zone2GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground2_alert1=SPAWN:New('zone2GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground3_alert1=SPAWN:New('zone2GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground4_alert1=SPAWN:New('zone2GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)

-- Spawns for Zone 3
zone3Ground1_alert1=SPAWN:New('zone3GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground2_alert1=SPAWN:New('zone3GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground3_alert1=SPAWN:New('zone3GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground4_alert1=SPAWN:New('zone3GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert1)
	:InitRandomizePosition(true, 50, 200)
	
-- ALERT 2
-- Spawns for Zone 1
zone1Ground1_alert2=SPAWN:New('zone1GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground2_alert2=SPAWN:New('zone1GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground3_alert2=SPAWN:New('zone1GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground4_alert2=SPAWN:New('zone1GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
		
-- Spawns for Zone 2
zone2Ground1_alert2=SPAWN:New('zone2GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground2_alert2=SPAWN:New('zone2GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground3_alert2=SPAWN:New('zone2GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground4_alert2=SPAWN:New('zone2GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)

-- Spawns for Zone 3
zone3Ground1_alert2=SPAWN:New('zone3GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground2_alert2=SPAWN:New('zone3GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground3_alert2=SPAWN:New('zone3GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground4_alert2=SPAWN:New('zone3GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert2)
	:InitRandomizePosition(true, 50, 200)
	
-- ALERT 3
-- Spawns for Zone 1
zone1Ground1_alert3=SPAWN:New('zone1GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground2_alert3=SPAWN:New('zone1GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground3_alert3=SPAWN:New('zone1GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground4_alert3=SPAWN:New('zone1GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
		
-- Spawns for Zone 2
zone2Ground1_alert3=SPAWN:New('zone2GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground2_alert3=SPAWN:New('zone2GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground3_alert3=SPAWN:New('zone2GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground4_alert3=SPAWN:New('zone2GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)

-- Spawns for Zone 3
zone3Ground1_alert3=SPAWN:New('zone3GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground2_alert3=SPAWN:New('zone3GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground3_alert3=SPAWN:New('zone3GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground4_alert3=SPAWN:New('zone3GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert3)
	:InitRandomizePosition(true, 50, 200)
	
-- ALERT 4
-- Spawns for Zone 1
zone1Ground1_alert4=SPAWN:New('zone1GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground2_alert4=SPAWN:New('zone1GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground3_alert4=SPAWN:New('zone1GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground4_alert4=SPAWN:New('zone1GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
		
-- Spawns for Zone 2
zone2Ground1_alert4=SPAWN:New('zone2GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground2_alert4=SPAWN:New('zone2GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground3_alert4=SPAWN:New('zone2GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground4_alert4=SPAWN:New('zone2GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)

-- Spawns for Zone 3
zone3Ground1_alert4=SPAWN:New('zone3GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground2_alert4=SPAWN:New('zone3GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground3_alert4=SPAWN:New('zone3GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground4_alert4=SPAWN:New('zone3GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert4)
	:InitRandomizePosition(true, 50, 200)
	
-- ALERT 5
-- Spawns for Zone 1
zone1Ground1_alert5=SPAWN:New('zone1GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground2_alert5=SPAWN:New('zone1GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground3_alert5=SPAWN:New('zone1GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
	
zone1Ground4_alert5=SPAWN:New('zone1GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
		
-- Spawns for Zone 2
zone2Ground1_alert5=SPAWN:New('zone2GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground2_alert5=SPAWN:New('zone2GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground3_alert5=SPAWN:New('zone2GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
	
zone2Ground4_alert5=SPAWN:New('zone2GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)

-- Spawns for Zone 3
zone3Ground1_alert5=SPAWN:New('zone3GroundForces1')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground2_alert5=SPAWN:New('zone3GroundForces2')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground3_alert5=SPAWN:New('zone3GroundForces3')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
	
zone3Ground4_alert5=SPAWN:New('zone3GroundForces4')
	:InitRandomizeTemplate(ground_templates_alert5)
	:InitRandomizePosition(true, 50, 200)
		
-- Spawns for Zone 1 attack helicopters
zone1AttackHelo=SPAWN:New('zone1AttackHelo')
	:InitRandomizeTemplatePrefixes('RedAttackHelo')
	:InitCleanUp(60)
	:InitLimit( 4, 0 )
	
-- Spawns for Zone 2 attack helicopters
zone2AttackHelo=SPAWN:New('zone2AttackHelo')
	:InitRandomizeTemplatePrefixes('RedAttackHelo')
	:InitCleanUp(60)
	:InitLimit( 4, 0 )
	
-- Spawns for Zone 3 attack helicopters
zone3AttackHelo=SPAWN:New('zone3AttackHelo')
	:InitRandomizeTemplatePrefixes('RedAttackHelo')
	:InitCleanUp(60)
	:InitLimit( 4, 0 )

-- Spawns for Zone 1 attack aircraft
zone1AttackAircraft=SPAWN:New('zone1AttackAircraft')
	:InitRandomizeTemplatePrefixes('RedAttackAircraft')
	:InitCleanUp(60)
	:InitLimit( 4, 0 )

-- Spawns for Zone 2 attack aircraft
zone2AttackAircraft=SPAWN:New('zone2AttackAircraft')
	:InitRandomizeTemplatePrefixes('RedAttackAircraft')	
	:InitCleanUp(60)
	:InitLimit( 4, 0 )

-- Spawns for Zone 3 attack aircraft
zone3AttackAircraft=SPAWN:New('zone3AttackAircraft')
	:InitRandomizeTemplatePrefixes('RedAttackAircraft')
	:InitCleanUp(60)
	:InitLimit( 4, 0 )

if supportArty == true then
-- Zone 1 Support Artillery
zone1Arty=SPAWN:New('zone1arty1')
	:InitRandomizeTemplatePrefixes('RedGroundForces-Arty')
	:InitRandomizePosition(true, 50, 200)
	:InitLimit( 4, 0 )
	:InitDelayOn()
	:SpawnScheduled( supportArtySpawnTime , 0.7 )
	
-- Zone 2 Support Artillery
zone2Arty=SPAWN:New('zone2arty1')
	:InitRandomizeTemplatePrefixes('RedGroundForces-Arty')
	:InitRandomizePosition(true, 50, 200)
	:InitLimit( 4, 0 )
	:InitDelayOn()
	:SpawnScheduled( supportArtySpawnTime , 0.7 )
	
-- Zone 3 Support Artillery
zone3Arty=SPAWN:New('zone3arty1')
	:InitRandomizeTemplatePrefixes('RedGroundForces-Arty')
	:InitRandomizePosition(true, 50, 200)
	:InitLimit( 4, 0 )
	:InitDelayOn()
	:SpawnScheduled( supportArtySpawnTime , 0.7 )
	else
end