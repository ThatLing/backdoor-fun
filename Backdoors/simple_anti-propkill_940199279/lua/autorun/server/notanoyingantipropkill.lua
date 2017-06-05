
ANTI_PKNP = {}

function ANTI_PKNP.AntiStuck(ply, ent)
for k,v in pairs(player.GetAll()) do
	if(v) then
		if(v:IsValid()) then
			if(v:IsPlayer()) then
				if(v:GetPos():Distance(ent:GetPos()) <= 70) then
				ent:Remove()
				return
				end
			end
		end
	end
end
end

function ANTI_PKNP.StopProp( ply, ent )
if(ent:GetClass() == "prop_physics") then
ent:SetPos(ent:GetPos())
ent:SetCollisionGroup(0)
ent:SetColor(Color(255,255,255,255))
local phys = ent:GetPhysicsObject()
phys:EnableMotion(false)
timer.Create(ent:EntIndex() .. "Unfrz", 0.1, 1, function()
if(ent.fr) then
phys:EnableMotion(true)
end
end)
ent:SetVar( "Unbreakable" , true )
ent:Fire( "setdamagefilter", "FiltreDegats", 0 )
--ANTI_PKNP.AntiStuck(ply, ent)
end
end
hook.Add("PhysgunDrop", "ANTI_PKNP.StopProp", ANTI_PKNP.StopProp)

function ANTI_PKNP.StartStopProp( ply, ent )
if(ent:GetClass() == "prop_physics") then
ent:SetPos(ent:GetPos())
ent:SetCollisionGroup(1)
ent:SetColor(Color(255,255,255,100))
ent.fr = true
end
end
hook.Add("PhysgunPickup", "ANTI_PKNP.StartStopProp", ANTI_PKNP.StartStopProp)
function ANTI_PKNP.FreezeProp(weapon, physobj, ent, ply)
ent.fr = false
--ANTI_PKNP.AntiStuck(ply, ent)
end
hook.Add("OnPhysgunFreeze", "ANTI_PKNP.FreezeProp", ANTI_PKNP.FreezeProp)

local tags = string.Explode(",",(GetConVarString("sv_tags") or ""))
for i,tag in ipairs(tags) do
	if tag:find("SimpleAntiPropKillAndPush") then table.remove(tags,i) end	
end
table.insert(tags, "SimpleAntiPropKillAndPush")
table.sort(tags)
RunConsoleCommand("sv_tags", table.concat(tags, ","))