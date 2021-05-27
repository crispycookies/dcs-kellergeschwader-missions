STRING_HELPER = {}

function STRING_HELPER.starts_with(str, start)
   str = tostring(str)
   start = tostring(start)
   return string.sub(str, 1, string.len(start)) == start
 end
 
 function STRING_HELPER.ends_with(str, ending)
   str = tostring(str)
   ending = tostring(ending)
   return ending == "" or string.sub(str, -string.len(ending)) == ending
 end

 MOOSE_CONTROLLABLE_HELPER = {}

 function MOOSE_CONTROLLABLE_HELPER.PassContext(controllable, functionToCall, context)
  context[functionToCall](context)
 end