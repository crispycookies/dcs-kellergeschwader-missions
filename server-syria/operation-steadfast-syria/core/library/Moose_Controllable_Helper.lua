MOOSE_CONTROLLABLE_HELPER = {}

function MOOSE_CONTROLLABLE_HELPER.PassContext(controllable, functionToCall, context)
 context[functionToCall](context)
end