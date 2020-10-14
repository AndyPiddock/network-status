Script "stack_NetWork_Status_button_id_1003"

/*
# Name: button "BtnTest" of card id 1002 of stack "NetWork Status"
# ID: button id 1003 of card id 1002 of stack "NetWork Status"
*/


on mouseUp pMouseButton
   --start the loop
   send "mouseUp" to me in 20 seconds

   --reset indicator graphic background colors between each test
   set the backgroundColor of grc "EthernetStatus" to white
   set the backgroundColor of grc "WifiStatus" to white
   set the backgroundColor of grc "WifiConnected" to white
   set the backgroundColor of grc "EthernetConnected" to white

   --make sure the consule/command window is hidden
   set the hideConsoleWindows to true

   --do the shell cmd
   put shell("netsh interface show interface") into tNetWorksStatus
   
   --get all the data from the shell result and set a loop to iterate through each returned line
   repeat with tLines = 1 to the number of lines of tNetWorksStatus
      
      --determine the ethernet enabled and connected status and update the indicator graphics accordingly
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
      
      --determine the wifi enabled and connected status and update the indicator graphics accordingly
      --the wifi connection name is normally Wi-Fi or WLAN so just searching if the line contains a W should be ok
      if "W" is among the chars of line tLines of tNetWorksStatus then
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

end mouseUp
