util.AddNetworkString("claims.hud")

local _ = {}

_.hudHeight = 30
_.hudScale = 1.6
_.drawAgenda1 = 0.5
_.drawAgenda2 = 1.5
_.lawHud1 = 0.2
_.lawHud2 = 1.2
_.ammo1 = 1.2

net.Receive( "claims.hud", function( len, ply )
	--if true then return end
	if ( IsValid( ply ) and ply:IsPlayer() ) then
		net.Start("claims.hud")
		net.WriteFloat(_.hudHeight)
		net.WriteFloat(_.hudScale)
		net.WriteFloat(_.drawAgenda1)
		net.WriteFloat(_.drawAgenda2)
		net.WriteFloat(_.lawHud1)
		net.WriteFloat(_.lawHud2)
		net.WriteFloat(_.ammo1)
		net.Send(ply)
		end
end )