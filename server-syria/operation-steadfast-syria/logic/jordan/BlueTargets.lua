BLUE_TARGETS = {
    targets = {
        {
            name = "Weapon fabric",
            coordinates = "N 32°26'51\" E 36° 4'36\"",
            isDestroyed = false,
            targetGroups = {
                {
                    prefix = "jordan-weapon-fabric-1-group-",
                    destroyPercentage = 0.8,
                    target = nil
                }
            },
            targetStatics = {
                {
                    prefix = "jordan-weapon-fabric-1-static-",
                    destroyPercentage = 0.5,
                    target = nil
                }
            }
        }
    },
    airbases = {
        {
            displayName = "King Hussein Air College",
            airbaseName = "King Hussein Air College",
            captured = false
        }
    }
}

local function checkWin()
    env.info("STEADFAST: checkWin")
    local won = true
    for _, target in pairs(BLUE_TARGETS.targets) do
        if target.isDestroyed == false then
            won = false
        end
    end

    for _, airbase in pairs(BLUE_TARGETS.airbases) do
        if airbase.captured == false then
            won = false
        end
    end

    if won == true then
        trigger.action.setUserFlag(1, 2)
    end
end

local function onTargetDestroyed(targetDesc)
    local isDestroyed = true
    for _, grp in pairs(targetDesc.targetGroups) do
        if grp.target.isDestroyed == false then
            isDestroyed = false
        end
    end

    for _, static in pairs(targetDesc.targetStatics) do
        if static.target.isDestroyed == false then
            isDestroyed = false
        end
    end

    if isDestroyed == true then
        targetDesc.isDestroyed = isDestroyed
        trigger.action.outText(targetDesc.name .. " successfully destroyed", 15, false)
        checkWin()
    end
end

for _, targetDesc in pairs(BLUE_TARGETS.targets) do
    for _, targetGrp in pairs(targetDesc.targetGroups) do
        local groups = {}
        for _, grp in pairs(coalition.getGroups(coalition.side.RED)) do
            if STRING_HELPER.starts_with(grp:getName(), targetGrp.prefix) then
                table.insert(groups, grp)
            end
        end

        local target = STEADFAST_TARGET_GROUPS:New(groups, targetGrp.destroyPercentage)
        targetGrp.target = target
        function target:OnTargetDestroyed()
            onTargetDestroyed(targetDesc)
        end
    end

    for _, targetStatic in pairs(targetDesc.targetStatics) do
        local statics = {}
        for _, static in pairs(coalition.getStaticObjects(coalition.side.RED)) do
            if STRING_HELPER.starts_with(static:getName(), targetStatic.prefix) then
                table.insert(statics, static)
            end
        end

        local target = STEADFAST_TARGET_STATICS:New(statics, targetStatic.destroyPercentage)
        targetStatic.target = target
        function target:OnTargetDestroyed()
            onTargetDestroyed(targetDesc)
        end
    end
end

local eventHandler = {}
function eventHandler:onEvent(eventdata)
    if eventdata.id == world.event.S_EVENT_BASE_CAPTURED then
        local capturedName = eventdata.place:getName()
        for _, airbaseTarget in pairs(BLUE_TARGETS.airbases) do
            env.info("STEADFAST: " .. capturedName)
            if airbaseTarget.airbaseName == capturedName then
                if eventdata.place:getCoalition() == coalition.side.BLUE then
                    airbaseTarget.captured = true
                    trigger.action.outText("Airbase " .. airbaseTarget.displayName .. " captured", 15, false)
                    checkWin()
                else
                    airbaseTarget.captured = false
                    trigger.action.outText("Airbase " .. airbaseTarget.displayName .. " lost", 15, false)
                end
            end
        end
    end
end
world.addEventHandler(eventHandler)


env.info("STEADFAST: BlueTargets initialized")
