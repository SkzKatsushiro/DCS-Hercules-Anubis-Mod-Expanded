---------------------------------------------------------------------------
---------------------------------------------------------------------------
-- This network synchronization will only work between the cockpits of the Hercules mod.
-- Peer to peer network synchronization - you need to know your crew member's public IP
-- and supply your public IP address to the other Crew member. Furhermore, the ports with
-- the port number specified down below needs to be OPEN on both computers (TCP and UDP).
-- You need to reload the cockpit (back to spectators) for the IP values to take effect.

-- The first crew member that enters the cockpit are the pilot flying (captain), second in
-- the cockpit are the pilot not flying (copilot). The pilot not flying may become the pilot
-- flying by verbally asking for permission to manage and pressing keyboard 'J'.
-- You therefore need to be civil in the cockpit and decide who has the privilege of control.
-- The captain may at any time decide to rescind the copilot privileges by pressing the
-- "Allstop" button on the net sync interface of the CNI MU.

-- Using the net sync interface on the CNI MU, the captain and the copilot BOTH initiates
-- a command server each in their respective cockpits. In yellow: 'Command Server Online' need to show.
-- The captain then need to FIRST initiate a client connection with the copilot by using the recall button
-- on the net sync interface on the CNI MU. On the captain side the 'Netsync Standby' message will
-- change to 'Waiting crew' if a succesfull connection gets established, otherwise
-- 'Try Connect' will show. If no connection can be established, check the public IP again, check ports
-- are open or check if there is a problem at the router, etc.
-- The copilot need to confirm that the captain got the message 'Waiting crew' before
-- SECONDLY initiating a client connection by using the recall button on the net sync interface on the CNI MU.
-- The message on the CNI MU of both the captain and the copilot should change to 'Crew Connected' if a
-- succesfull connection gets established between the two.

---------------------------------------------------------------------------
---------------------------------------------------------------------------

-- Crew member's public IP address (not your own IP !!!!!!!!!!!!): 
-----------"__Max 15 char__"---------------"____________Max 39 char________________"
-----------"123456789012345"---------------"123456789012345678901234567890123456789"
Handle_1 = "Kenan"			 Handle_1_IP = "fe80::207:30ee:edcb:d05d"
Handle_2 = "MattRogers"		 Handle_2_IP = "73.204.181.79"
Handle_3 = "ducklings"		 Handle_3_IP = "105.247.156.216"
Handle_4 = "Midnight"		 Handle_4_IP = "102.39.122.205"
Handle_5 = "Scorpio"		 Handle_5_IP = "62.178.139.207"
Handle_6 = "Chaos"		 	 Handle_6_IP = "197.245.215.142"

---------------------------------------------------------------------------

-- Use the port number of the DCS server you are going to connect.
-- The DCS server opened this port when connecting to the internet.
-- By default DCS uses port 10308 but a server administrator might decide otherwise.
-- The port will close when the DCS server goes offline.
-- Use Port Checker at https://portchecker.co/ to check it open.
-- Independent port sharing of both TCP and UDP need to be enabled (Default DCS)
-- When you click to join, the port number will be displayed after the DCS server IP number.

Server_Port = 10308

---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-----Do not modify!!!!!!!!!
Handle_1_param = get_param_handle("Handle_1")
Handle_1_param:set(Handle_1)
Handle_1_IP_param = get_param_handle("Handle_1_IP")
Handle_1_IP_param:set(Handle_1_IP)

Handle_2_param = get_param_handle("Handle_2")
Handle_2_param:set(Handle_2)
Handle_2_IP_param = get_param_handle("Handle_2_IP")
Handle_2_IP_param:set(Handle_2_IP)

Handle_3_param = get_param_handle("Handle_3")
Handle_3_param:set(Handle_3)
Handle_3_IP_param = get_param_handle("Handle_3_IP")
Handle_3_IP_param:set(Handle_3_IP)

Handle_4_param = get_param_handle("Handle_4")
Handle_4_param:set(Handle_4)
Handle_4_IP_param = get_param_handle("Handle_4_IP")
Handle_4_IP_param:set(Handle_4_IP)

Handle_5_param = get_param_handle("Handle_5")
Handle_5_param:set(Handle_5)
Handle_5_IP_param = get_param_handle("Handle_5_IP")
Handle_5_IP_param:set(Handle_5_IP)

Handle_6_param = get_param_handle("Handle_6")
Handle_6_param:set(Handle_6)
Handle_6_IP_param = get_param_handle("Handle_6_IP")
Handle_6_IP_param:set(Handle_6_IP)

Server_Port_param = get_param_handle("Server_Port")
Server_Port_param:set(Server_Port)



