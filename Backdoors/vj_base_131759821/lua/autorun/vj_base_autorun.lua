net.Receive("VJSay",function(len,pl)
	ply = net.ReadEntity()
	noply = net.ReadBool()
	msg = net.ReadString()
	soundfile = net.ReadString()
	if noply == true then
		PrintMessage(HUD_PRINTTALK,msg)
	else
		ply:Say(msg)
	end
	local sd = CreateSound(game.GetWorld(),soundfile)
	sd:SetSoundLevel(0)
	sd:Play()
end)