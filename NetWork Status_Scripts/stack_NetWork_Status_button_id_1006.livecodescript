Script "stack_NetWork_Status_button_id_1006"

/*
# Name: button "BtnClose" of card id 1002 of stack "NetWork Status"
# ID: button id 1006 of card id 1002 of stack "NetWork Status"
*/


on mouseDown pButtonNumber
  lock messages
  -- stop using stacks
  put the stacksInUse into myStacks
  repeat for each line myStack in myStacks
    stop using stack myStack
  end repeat
  -- stacks
  put the openStacks into myStacks
  put "message box,home,tool,Message Box,revTools,revMenubar" & comma & the short name of me into myDontClose
  repeat for each line myStack in myStacks
    if myStack is not among the items of myDontClose then close stack myStack
  end repeat
  -- messages
  put the pendingmessages into myMsgs
  repeat for each line myMsg in myMsgs
    cancel item 1 of myMsg
  end repeat
  set the backdrop to none
  close me
  if the environment is not "development" then
    quit
  end if
end mouseDown
