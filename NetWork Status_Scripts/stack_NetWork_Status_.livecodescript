Script "stack_NetWork_Status_"

/*
# Name: stack "NetWork Status"
# ID: stack "NetWork Status"
*/

--allows for non windowed stack to be dragged
local sgLeftOffset
local sgTopOffset
local sgDragging

on mouseDown
   put item 1 of the mouseLoc into sgLeftOffset
   put item 2 of the mouseLoc into sgTopOffset
   put true into sgDragging
end mouseDown

on mouseMove
   lock screen
   if sgDragging is true then
      set the left of this stack to item 1 of globalloc(the mouseLoc) - sgLeftOffset
      set the top of this stack to item 2 of globalloc(the mouseLoc) - sgTopOffset
   end if
   unlock screen
end mouseMove

on mouseRelease
   put false into sgDragging
end mouseRelease

on mouseUp
  put false into sgDragging
end mouseUp
