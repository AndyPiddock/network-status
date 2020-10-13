Script "stack_NetWork_Status_button_id_1003"

/*
# Name: button "BtnTest" of card id 1002 of stack "NetWork Status"
# ID: button id 1003 of card id 1002 of stack "NetWork Status"
*/


-- Sent when the mouse is released after clicking
-- pMouseButton specifies which mouse button was pressed
on mouseUp pMouseButton
   send "mouseUp" to me in 20 seconds
   
   set the backgroundColor of grc "EthernetStatus" to white
   set the backgroundColor of grc "WifiStatus" to white
   set the backgroundColor of grc "WifiConnected" to white
   set the backgroundColor of grc "EthernetConnected" to white
   set the hideConsoleWindows to true
   put shell("netsh interface show interface") into tNetWorksStatus
   
   repeat with tLines = 1 to the number of lines of tNetWorksStatus
      
      if "Ethernet" is among the words of line tLines of tNetWorksStatus then
         put word 4 of line tLines of tNetWorksStatus && word 5 of line tLines of tNetWorksStatus into fld "LblEthernetStatus"
         
         if word 2 of line tLines of tNetWorksStatus is "Connected" then
            set the backgroundColor of grc "EthernetStatus" to green
         else
            set the backgroundColor of grc "EthernetStatus" to red
         end if
         if word 1 of line tLines of tNetWorksStatus is "Enabled" then
            set the backgroundColor of grc "EthernetConnected" to green
         else
            set the backgroundColor of grc "EthernetConnected" to red
         end if
      end if 
      
      if "Wi-Fi" or "WLAN" is among the words of line tLines of tNetWorksStatus then
         put word 4 of line tLines of tNetWorksStatus && word 5 of line tLines of tNetWorksStatus into fld "LblWifiStatus"
         
         if word 2 of line tLines of tNetWorksStatus is "Connected" then
            set the backgroundColor of grc "WifiStatus" to green
         else
            set the backgroundColor of grc "WifiStatus" to red
         end if
         if word 1 of line tLines of tNetWorksStatus is "Enabled" then
            set the backgroundColor of grc "WifiConnected" to green
         else
            set the backgroundColor of grc "WifiConnected" to red
         end if
      end if 
      
   end repeat
   --answer tNetWorksStatus & Cr & CR & word 4 of line 5 of tNetWorksStatus && word 2 of line 5 of tNetWorksStatus
end mouseUp
