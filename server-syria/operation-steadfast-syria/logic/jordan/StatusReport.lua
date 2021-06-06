local function jordanStatusReport()
    local jordanHot = "cold"
    if FRACTION_JORDAN.isHot == true then
        jordanHot = "hot"
    end

    local targets = ""

    for _, target in pairs(BLUE_TARGETS.targets) do
        if target.isDestroyed == false then
            targets = targets .. "\n  " .. target.name .. " at " .. target.coordinates
        end
    end

    local airbases = ""
    for _, airbase in pairs(BLUE_TARGETS.airbases) do
        airbases = airbases .. "\n  " .. airbase.displayName
        if airbase.captured == true then
            airbases = airbases .. " captured"
        else
            airbases = airbases .. " not captured"
        end
    end

	trigger.action.outText("JORDAN STATUS REPORT:\n\n" .. 
        "Jordan is currently " .. jordanHot .."\n\n" ..
        "Targets to destroy:" ..
        targets .. "\n\n" ..
        "Airbases:" ..
        airbases,
        25 , false)
end

missionCommands.addCommand("Jordan Status Report",  nil, jordanStatusReport)