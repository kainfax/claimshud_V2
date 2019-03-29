if(SERVER) then
	resource.AddWorkshop("1563468192") 

	return
end

local _x = {}

net.Receive("claims.hud", function( len, pl )

	_x.dferegfh = net.ReadFloat()
	_x.dfhregre3 = net.ReadFloat()
	_x.rege3r4 = net.ReadFloat()
	_x.sdfewe4w = net.ReadFloat()
	_x.dsgfsdge = net.ReadFloat()
	_x.sdgds34 = net.ReadFloat()
	_x.ghthrtrty34x = net.ReadFloat()

hook.Add("InitPostEntity", "removeChatBubble", function()
    hook.Remove("StartChat", "StartChatIndicator")
    hook.Remove("FinishChat", "EndChatIndicator")
end)

	local hideHUDElements = {
		["DarkRP_HUD"] = true, 	
		["DarkRP_PlayerInfo"] = true,
		["DarkRP_LocalPlayerHUD"] = true,
		["DarkRP_EntityDisplay"] = true,
		["DarkRP_Hungermod"] = true, 
	}

	local function hideElements(name)
		for k, v in pairs({"CHudHealth", "CHudBattery", "CHudSuitPower", "CHudDeathNotice", "CHudAmmo"}) do
			if name == v then return false end
		end
		if hideHUDElements[name] then
			return false
		end
	end
	hook.Add("HUDShouldDraw", "hideElements", hideElements)

	local height = _x.dferegfh or 0
	local lockdown = "STOP LOCKDOWN: /UNLOCKDOWN" 
	local logotext, logotext2 = "", "" --- "MY", "Community" ----- Wanna have logo infront? CTRL + F and search: claims_are_cool read it!
	local christ = "" -- NOT IN USE
	local scale = _x.dfhregre3 or 0

	surface.CreateFont("HUDMain", {font = "Coolvetica", weight = 500, bold = false, size = ScreenScale(10)}) 
	surface.CreateFont("AmmoPrim", {font = "Roboto Bold", size = ScreenScale(12)})
	surface.CreateFont("AmmoSec", {font = "Roboto Bold", size = ScreenScale(6)})

	surface.CreateFont( "hudfont", {
	font = "Coolvetica",  
	extended = false,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
	size = ScreenScale(9)
})

surface.CreateFont( "hudfontbold", {
	font = "Roboto Bold", 
	extended = false,
	size = 16,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

	height = ScrH()/height
		
	local lockdowncolor = Color(255, 0, 0) 
	local christtext = Color(255, 0, 255)
	local textcolor = Color(238, 238, 238)
	local logo = Material("materials/player.png","unlitgeneric") 
	local nameicon = Material("materials/player.png","unlitgeneric")
	local healthicon = Material("materials/heart.png","unlitgeneric")
	local armoricon = Material("materials/shield.png","unlitgeneric")
	local jobicon = Material("materials/job.png","unlitgeneric")
	local moneyicon = Material("materials/cash.png","unlitgeneric")
	local salaryicon = Material("materials/cash2.png","unlitgeneric")
	local rankicon = Material("materials/rank.png","unlitgeneric")
	local lockdownicon = Material("materials/lockdownred.png","unlitgeneric")


	local function box(x, y, w, h, color)
		surface.SetDrawColor(color || Color(0, 0, 0, 150))
		surface.DrawRect(x, y, w, h)
	end
	local wex = 0
	    hook.Add("HUDPaint", "Lockdown", function()
		    if GetGlobalBool("Darkrp_lockdown") then
		    	wex = 1 + 255 * math.abs(math.sin(CurTime() * 1))
		    	if wex > 150 then
		    		col = 255
		    	elseif wex < 150 then
		    		col = 0
		    	end
		         draw.SimpleText("LOCKDOWN HAS BEEN INITIATED","HUDMain", ScrW() * 0.50,ScrH() * 0.035 + 25, color_white,TEXT_ALIGN_CENTER) 
		         draw.SimpleText("LOCKDOWN HAS BEEN INITIATED","HUDMain", ScrW() * 0.50,ScrH() * 0.035 + 25, Color(255,0,0, col),TEXT_ALIGN_CENTER)
		         draw.SimpleText("RETURN HOME!","HUDMain", ScrW() * 0.50,ScrH() * 0.070 + 25, color_white,TEXT_ALIGN_CENTER)
		         draw.SimpleText("RETURN HOME!","HUDMain", ScrW() * 0.50,ScrH() * 0.070 + 25, Color(255,0,0, col),TEXT_ALIGN_CENTER)
		        surface.SetDrawColor(Color(0,0,0,150))
		        surface.SetMaterial(lockdownicon)

				box(0, height, ScrW(), 4, color_white)
				box(0, height, ScrW(), 4, Color(255,0,0, col) )
			end

	    end)

	

	local function img(x, y, w, h, mat, color)
		if color then
			surface.SetDrawColor(color.r ,color.g ,color.b)
		else
			surface.SetDrawColor(r or 200,g or 251,b or 255) ---  THIS COLOR ICONS 
		end
		surface.SetMaterial(mat)
		surface.DrawTexturedRect(x, y, w, h)
	end

	local function txt(t, x, y, color, f, ha, va)
		
		draw.SimpleText(t, f || "HUDMain", x, y, color or textcolor, ha || TEXT_ALIGN_CENTER, va || TEXT_ALIGN_CENTER)
	end
	local function lockdowntxt(t, x, y, f, ha, va)

		draw.SimpleText(t, f || "hudfontbold", x, y, lockdowncolor, ha || TEXT_ALIGN_CENTER, va || TEXT_ALIGN_CENTER)
	end

	local function christtext(t, x, y, f, ha, va)
		draw.SimpleText(t, f || "hudfontbold", x, y, christtext, ha || TEXT_ALIGN_CENTER, va || TEXT_ALIGN_CENTER)
	end

	local function size(t, f)
		surface.SetFont(f || "HUDMain")
		return surface.GetTextSize(t)
	end

	local function drawBar()
		box(0, 0, ScrW(), height, Color(0, 0, 0, 255))
		box(0, height - 1, ScrW(), height/20 , Color(200, 200, 200, 255)) --- JUST A TINY BAR
	end

	local function drawLogo(s)
		img(s, 3, height-6, height-6, logo)
		local w, w2 = size(logotext), size(logotext2)
		txt(logotext, s+height+w/2, height/2, Color(255,90,90))
		txt(logotext2, w + s+height+w2/2, height/2)

		surface.SetDrawColor(200,200,200,255)
		surface.DrawLine(w + s + height + w2 + s, 0, w + s + height + w2 + s, height)
		return s + height*scale + w + w2
	end

	local function drawName(s)
		local name = LocalPlayer():Nick() || ""
		local w = size(name)
		img(s+6, 6, height-12, height-12, nameicon)
		txt(name, s+height+size(name)/2, height/2, Color(255,255,255))
		surface.SetDrawColor(200,200,200,255)
		surface.DrawLine( w  + height + s + height-12-6, 0, w  + height + s+ height-12-6,  height)
		return s + height*scale + size(name)
	end

	local function drawHealth(s)
		local hp = (LocalPlayer():Health() || 0).."%"
		local w = size(hp)
		img(s+6, 6, height-12, height-12, healthicon)
		txt(hp, s+height+size(hp)/2, height/2, Color(20, 150, 20))

		surface.SetDrawColor(200,200,200,255)
		surface.DrawLine( w  + height + s + height-12-6, 0, w  + height + s+ height-12-6,  height)

		return s + height*scale + size(hp)
	end

	local function drawArmor(s)
		local armor = (LocalPlayer():Armor() || 0).."%"

		img(s+6, 6, height-12, height-12, armoricon)
		txt(armor, s+height+size(armor)/2, height/2, Color(100,100,255))
		local w = size(armor)
		surface.SetDrawColor(200,200,200,255)
		surface.DrawLine( w  + height + s + height-12-6, 0, w  + height + s+ height-12-6,  height)

		return s + height*scale + size(armor)
	end

	local function drawMoney(s)
		local muns = DarkRP.formatMoney((LocalPlayer():getDarkRPVar("money") || 0))

		img(s+6, 6, height-12, height-12, moneyicon)
		txt(muns, s+height+size(muns)/2, height/2)

		local w = size(muns)
		surface.SetDrawColor(200,200,200,255)
		surface.DrawLine( w  + height + s + height-12-6, 0, w  + height + s+ height-12-6,  height)
		return s + height*scale + size(muns)
	end

	local function drawSalary(s)
		local sal = "Salary: "..DarkRP.formatMoney((LocalPlayer():getDarkRPVar("salary") || 0))

		img(s+6, 6, height-12, height-12, salaryicon)
		txt(sal, s+height+size(sal)/2, height/2)
		local w = size(sal)
		surface.SetDrawColor(200,200,200,255)
		surface.DrawLine( w  + height + s + height-12-6, 0, w  + height + s+ height-12-6,  height)
		return s + height*scale + size(sal)
	end

	local function drawJob(s)
		local job = LocalPlayer():getDarkRPVar("job") || ""
		img(s+6, 6, height-12, height-12, jobicon)
		txt(job, s+height+size(job)/2, height/2, team.GetColor(LocalPlayer():Team()))
		local w = size(job)
		surface.SetDrawColor(200,200,200,255)
		surface.DrawLine( w  + height + s + height-12-6, 0, w  + height + s+ height-12-6,  height)
		return s + height*scale + size(job)
	end

	local function drawRank(s)
		---if(true) then return s end
		local rank = LocalPlayer():GetNWString("usergroup") -- -- EasterEgg [Christmas Event]
	--	local w = size(rank)
		--txt(christ, s+height+w/0.8, height/2)  
		--surface.DrawLine( w  + height + s + height-12-6, 0, w  + height + s+ height-12-6,  height)
		--surface.SetDrawColor(255,0,0,255)
		img(s+6, 6, height-12, height-12, rankicon) 
		txt(rank, s+height+size(rank)/2, height/2, Color(180, 0, 0))
		local w2 = size(rank)

		surface.SetDrawColor(200,200,200,255)  
		surface.DrawLine( w2  + height + s + height-12-6, 0, w2  + height + s+ height-12-6,  height)
		return s + height*scale + size(rank)
	end

	local function drawTextOflockdown()
		if GetGlobalBool("DarkRP_LockDown") then
		local w, h = size(lockdown)

		lockdowntxt(lockdown, ScrW() - w/2 - (height-h), height/2)
	end
	end

	surface.CreateFont("LawTitle", {font = "Roboto Bold", size = ScreenScale(6), weight = 400, underline = true})
	surface.CreateFont("LawMain", {font = "Roboto Bold", size = ScreenScale(5.5)})

local function drawAgenda()
        local agenda = LocalPlayer():getAgendaTable() 
        if(!agenda) then return end

        local text = LocalPlayer():getDarkRPVar("agenda") or ""

        if(!text || text == "") then return end

        box(height*(_x.rege3r4 or 0), height*(_x.sdfewe4w or 0), ScrW() / 5, ScrH() / 6, Color(0, 0, 0, 255))

        txt(agenda.Title, height*0.5 + ScrW()/16, height*1.8,  textcolor , "HUDMain")    

        text = text:gsub("//", "\n"):gsub("\\n", "\n")
        text = DarkRP.textWrap(text, "hudfontbold", ScrW() / 8)
        draw.DrawNonParsedText(text, "hudfontbold", height*0.6, height*2.1, Color(255, 255, 255, 255), 0)
	    end  

	local Laws = {}
	local function LawHUD()
		local totalHeight = 25
		for k, v in ipairs(Laws) do
			local replaceResult, replaceCount = string.gsub(v, "\n", "")
			totalHeight = totalHeight + 1 + (fn.ReverseArgs(string.gsub(v, "\n", "")) + 1 * ((replaceCount + 1) * 13))
		end

		local w, h = ScrW() / 5, ScrH() / 4
		local x, y = ScrW() - w - height * (_x.dsgfsdge or 0), height * (_x.sdgds34 or 0)

		draw.RoundedBox(0, x, y, w, totalHeight * 1.2 + 5, Color(33, 33, 33, 255))

		draw.SimpleText("Laws", "HUDMain", x + w/2, y+h/35, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)

		local col = Color(255, 255, 255, 255)
		local lastHeight = 0
		for _,v in ipairs(Laws) do
			draw.DrawText(_ .. ") " .. v, "hudfontbold", x + 5, y+h/8 + lastHeight*1.2, col)
			lastHeight = lastHeight + (fn.ReverseArgs(string.gsub(v, "\n", "")) + 1) * 13
		end
	end

	local ammoSmooth = 0
	    local function drawAmmo()
        if(!IsValid(LocalPlayer():GetActiveWeapon())) then return end
        if(LocalPlayer():GetActiveWeapon():Clip1() == NULL || LocalPlayer():GetActiveWeapon() == "Camera" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_bugbait") then return end
        if(LocalPlayer():GetActiveWeapon():Clip1() == -1) then return end

        local mag1 = LocalPlayer():GetActiveWeapon():Clip1()
        local mag1width, mag1height = surface.GetTextSize(mag1)
        ammoSmooth = Lerp(8 * FrameTime(), ammoSmooth, mag1)

        local mag2 = LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType())
        local mag2width, mag2height = surface.GetTextSize(mag2)

        local maxAmmo = LocalPlayer():GetActiveWeapon():GetMaxClip1() or 1

        local w, h =  ScrW()/16, ScrH()/18
        local x, y = ScrW() - w * 1.2, ScrH() - h * (_x.ghthrtrty34x or 0)

        box(x, y, w, h, Color(0, 0, 0, 255))
        box(x, y, math.Remap(ammoSmooth, 0, maxAmmo, 0, w), h / 20, Color(255, 0, 0, 100))

        txt(mag1, x+w/2, y+h/2,  Color(255,255,255), "AmmoPrim",TEXT_ALIGN_RIGHT)
        txt(mag2, x+w/2, y+h/2, Color(255,255,255), "AmmoSec", TEXT_ALIGN_LEFT)
    end

	timer.Create("LawHUDUpdate", 1, 0, function()
		local temp = DarkRP.getLaws()
		table.Empty(Laws)

		for k, v in pairs(temp) do
			local replaceResult = string.gsub(v, "\n", "")
			table.insert(Laws, DarkRP.textWrap(replaceResult, "DarkRPHUD1", ScrW() / 5))
		end
	end) 

	--[[local AgendaW,AgendaH = 300,100
	local function Agenda()
		local agenda = LocalPlayer():getAgendaTable()
		if not agenda then return end

		draw.RoundedBox(0, 5, HUD.H+5, AgendaW, 20, Color(0, 0, 0,255))
		draw.RoundedBoxEx(4, 5, HUD.H+25, AgendaW, AgendaH, Color(0, 0, 0, 255), false, false, true, true)

		draw.SimpleText(agenda.Title,"AgendaTitleFont",5+AgendaW/2,HUD.H+15,Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		local text = LocalPlayer():getDarkRPVar("agenda") or ""

		text = text:gsub("//", "\n"):gsub("\\n", "\n")
		text = DarkRP.textWrap(text, "DarkRPHUD1", AgendaW-25)
		draw.DrawNonParsedText(text, "DarkRPHUD1", 15, HUD.H+35, Color(255, 255, 255, 255), 0)
	end]]--

	/// claims_are_cool
/// IF YOU WANT LOGO, REMOVE THE -- INFRONT OF drawRank(drawJob(drawSalary(drawMoney(drawArmor(drawHealth(drawName(drawLogo(start)))))))). 
	hook.Add("HUDPaint", "DrawclaimsHud", function()
		local start = height/3
		drawBar()
      --drawRank(drawJob(drawSalary(drawMoney(drawArmor(drawHealth(drawName(drawLogo(start))))))))  --- Remove the -- infront. 
		drawRank(drawJob(drawSalary(drawMoney(drawArmor(drawHealth(drawName(start)))))))  /// add a -- infront of this line. and save.
		LawHUD()
		drawAmmo() 
		drawAgenda()
	end)


	end )


timer.Create("claims.hud",1,0,function()
	if IsValid(LocalPlayer()) then
		net.Start( "claims.hud")
		net.SendToServer()
		timer.Remove("claims.hud")
		end
	end)

--- overhead 
if(SERVER) then return end

local check = 500
local offset = Vector(0, 0, 85)

surface.CreateFont("NameFont", {font = "Roboto Bold", size = 100})
surface.CreateFont("healthFont", {font = "Roboto Bold", size = 80})
surface.CreateFont("TypingFont", {font = "Roboto Bold", size = 70})
surface.CreateFont("WantedFont", {font = "Roboto Bold", size = 120})
surface.CreateFont("HUDMaissn", {font = "Coolvetica", weight = 500, bold = false, size = ScreenScale(30)}) 

local voice = {}
for i=1,6 do voice[i] = Material("materials/talking-"..i..".png", "unlitgeneric") end


Material("voice/icntlk_pl"):SetFloat("$alpha", 0)
timer.Simple( 10, function()
	Material("voice/icntlk_pl"):SetFloat("$alpha", 0)
end)

timer.Simple( 1, function()
	hook.Remove("StartChat", "StartChatIndicator")
	hook.Remove("FinishChat", "EndChatIndicator")
end)

hook.Add("PlayerStartVoice", "ClaimsStartVoice", function(ply) ply._isTalking = true end)
hook.Add("PlayerEndVoice", "ClaimsEndVoice", function(ply) ply._isTalking = false end)

local function drawChatIndicator()
	if LocalPlayer()._isTalking then
		local fr = math.max( math.ceil(CurTime() % 1 * 10) - 4, 1 )
		surface.SetDrawColor(220,220,220)
		surface.SetMaterial(voice[fr])
		surface.DrawTexturedRect(ScrW()-100, ScrH()/2, 80, 80)
    end
end

hook.Add("HUDPaint","LuClaimsChatIndicator", drawChatIndicator)

local licenseIcon = Material("materials/gunlinc.png", "unlitgeneric")

local function getPlayerHealthStatus(ply)
	local healthFrac = ply:Health() / ply:GetMaxHealth()
	local hText = ""

	if healthFrac >= 2 then
		hText = "Super Healthy"
	elseif healthFrac >= 1 then
		hText = "Healthy"
	elseif healthFrac >= 0.8 then
		hText = "Slightly Injured"
	elseif healthFrac >= 0.6 then
		hText = "Injured"
	elseif healthFrac >= 0.4 then
		hText = "Hurt"
	elseif healthFrac >= 0.01 then
		hText = "Near Death"
	end

	return hText
end

local function drawEntityDisplay(ply)
	if(!IsValid(ply)) then return end
	if(ply == LocalPlayer()) then return end
	if(LocalPlayer():InVehicle()) then return end
	if(!ply:Alive()) then return end

	local distance = LocalPlayer():GetPos():Distance(ply:GetPos())

	if(distance > check) then return end

	local ang = LocalPlayer():EyeAngles()
	local pos = ply:GetPos() + offset + ang:Up()

	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), 90)

	local name = ply:Name() || ""
	local job = ply:getDarkRPVar("job") || ""
	local hText = getPlayerHealthStatus(ply) || ""

	local alpha = math.Clamp(math.Remap(distance, check/4, check, 255, 0), 0, 255)

	cam.Start3D2D(pos, Angle(0, ang.y, 90), 0.04)
		local clr = team.GetColor(ply:Team())
		clr = Color(clr.r, clr.g, clr.b, alpha)

		local hClr = Color(180,200,180)
		if hText == "Near Death" then
			hClr = Color(240,80,80)
		elseif hText == "Hurt" then
			hClr = Color(190,80,80)
		elseif hText == "Injured" then
			hClr = Color(93,135,101)
		elseif hText == "Slightly Injured" then
			hClr = Color(89,212,6)
		elseif hText == "Healthy" then
			hClr = Color(61,189,6)
		elseif hText == "Super Healthy" then
			hClr = Color(0,255,0)
		end

		draw.SimpleTextOutlined(name, "HUDMaissn", 0, 0, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0))
		draw.SimpleTextOutlined(job, "HUDMaissn", 0, 80, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0))

		if(ply:getDarkRPVar("wanted")) then
			local cin = (math.sin(CurTime() * 8) + 1) / 2
			draw.SimpleTextOutlined("WANTED", "WantedFont", 0, -100, Color(cin * 255, 0, 255 - (cin * 255), alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0))
		end

		if(ply:getDarkRPVar("HasGunlicense"))then
			surface.SetDrawColor(220, 220, 220, alpha)
			surface.SetMaterial(licenseIcon)
			surface.DrawTexturedRect(-80, 169, 160, 160)
        end

        local hp = math.Remap(ply:Health(), 0, 100, 0, 500)

        //surface.SetDrawColor(0, 0, 0, 255)
        //surface.DrawOutlinedRect(-251, 179, 502, 32)
        //draw.RoundedBox(0, -250, 180, 500, 30, Color(150, 0, 0, 255))
        //draw.RoundedBox(0, -hp/2, 180, hp, 30, Color(255, 0, 0, 255))

        local pos = -230
        if(ply:getDarkRPVar("wanted")) then
        	pos = -480
        end

		if(ply._isTalking)then
			local fr = math.max(math.ceil(CurTime() % 1 * 10) - 4, 1)
			surface.SetDrawColor(220, 220, 220, alpha)
			surface.SetMaterial(voice[fr])
			surface.DrawTexturedRect(-70, pos, 140, 140)
		end


		pos = 130

		draw.SimpleTextOutlined(hText, "healthFont", 0, pos + 25, hClr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0))

		if(ply:getDarkRPVar("HasGunlicense")) then
			pos = 330
		end


		if(ply:IsTyping())then
			local txt = "Typing"
			local amount = math.min(math.floor(CurTime() % 1 * 10), 3)

			if(amount > 0) then
				txt = txt..("."):rep(amount)
				draw.SimpleTextOutlined(txt, "TypingFont", 0, pos +10, Color(255, 255, 255, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0))
			end
		end


	cam.End3D2D()
end

MsgC( Color(240, 173, 78), "[ClaimsHUD]", Color(210, 210, 210), "Loading GUIS/Hud By ", Color(240, 173, 78) ,"Claims", Color(210, 210, 210),"(STEAM_1:0:35617107)\n" )
hook.Add("PostDrawTranslucentRenderables", "DrawNameDisplay", function() for k, v in pairs(player.GetAll()) do drawEntityDisplay(v) end end)


--- door price

if(SERVER) then return end

surface.CreateFont( "DoorPrice", {
	font = "Roboto",
	size = 96,
	weight = 0
})

surface.CreateFont( "DoorTitle", {
	font = "Roboto",
	size = 64,
	weight = 0
})

surface.CreateFont( "DoorInfo", {
	font = "Roboto",
	size = 42,
	weight = 0
})

local function drawDoor( door, al )

	local blocked = door:getKeysNonOwnable()
	local superadmin = LocalPlayer():IsSuperAdmin()
	local doorTeams = door:getKeysDoorTeams()
	local doorGroup = door:getKeysDoorGroup()
	local playerOwned = door:isKeysOwned() or table.GetFirstValue(door:getKeysCoOwners() or {}) ~= nil
	local owned = playerOwned or doorGroup or doorTeams

	if blocked then
		-- draw.SimpleTextOutlined( "Not ownable", "DoorTitle", 2, 2, Color(0,0,0, al), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0, al))
		-- draw.SimpleTextOutlined( "Not ownable", "DoorTitle", 0, 0, Color(220,220,220, al), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0, al))
	elseif not owned then
		draw.SimpleTextOutlined( DarkRP.formatMoney(GAMEMODE.Config.doorcost), "DoorPrice", 0, -68, Color(0,0,0, al), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0,0,0, al))
		draw.SimpleTextOutlined( DarkRP.formatMoney(GAMEMODE.Config.doorcost), "DoorPrice", 0, -70, Color(20,255,50, al), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0,0,0, al))

		draw.SimpleTextOutlined( "Press F2 to buy", "DoorTitle", 0, 0, Color(0,0,0, al), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0,0,0, al))
		draw.SimpleTextOutlined( "Press F2 to buy", "DoorTitle", 0, 0, Color(220,220,220, al), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0,0,0, al))
	else
		local doorInfo = {}

	    local title = door:getKeysTitle()
	    if title then
			draw.SimpleTextOutlined( title, "DoorTitle", 0, -48, Color(0,0,0, al), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0,0,0, al))
			draw.SimpleTextOutlined( title, "DoorTitle", 0, -50, Color(220,220,220, al), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0,0,0, al))
		end

		if playerOwned then
	        if door:isKeysOwned() then table.insert(doorInfo, {door:getDoorOwner():Nick(), team.GetColor(door:getDoorOwner():Team())}) end
	        for k,v in pairs(door:getKeysCoOwners() or {}) do
	            local ent = Player(k)
	            if not IsValid(ent) or not ent:IsPlayer() then continue end
	            table.insert(doorInfo, {ent:Nick(), team.GetColor(ent:Team())})
	        end

	        local allowedCoOwn = door:getKeysAllowedToOwn()
	        if allowedCoOwn and not fn.Null(allowedCoOwn) then
	            -- table.insert(doorInfo, DarkRP.getPhrase("keys_other_allowed"))

	            for k,v in pairs(allowedCoOwn) do
	                local ent = Player(k)
	                if not IsValid(ent) or not ent:IsPlayer() then continue end
	                table.insert(doorInfo, {ent:Nick(), team.GetColor(ent:Team())})
	            end
	        end
	    elseif doorGroup then
	        table.insert(doorInfo, doorGroup)
	    elseif doorTeams then
	        for k, v in pairs(doorTeams) do
	            if not v or not RPExtraTeams[k] then continue end

	            table.insert(doorInfo, {RPExtraTeams[k].name, RPExtraTeams[k].color})
	        end
	    elseif blocked and superadmin then
	        table.insert(doorInfo, DarkRP.getPhrase("keys_allow_ownership"))
	    elseif not blocked then
	        table.insert(doorInfo, DarkRP.getPhrase("keys_unowned"))
	        if superadmin then
	            table.insert(doorInfo, DarkRP.getPhrase("keys_disallow_ownership"))
	        end
	    end

		local y = 0
		for k, txt in pairs( doorInfo ) do
			draw.SimpleTextOutlined( istable(txt) and txt[1] or txt, "DoorInfo", 0, y + 2, Color(0,0,0, al), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0,0,0, al))
			draw.SimpleTextOutlined( istable(txt) and txt[1] or txt, "DoorInfo", 0, y, istable(txt) and txt[2] or Color(220,220,220, al), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0,0,0, al))

			y = y + 40
		end
	end

end

timer.Simple(0, function()
	local function uhhh( whatever )
		local door = LocalPlayer():GetEyeTrace().Entity
		local doorTeams = door:getKeysDoorTeams()
		local doorGroup = door:getKeysDoorGroup()
		local playerOwned = door:isKeysOwned() or table.GetFirstValue(door:getKeysCoOwners() or {}) ~= nil
		local blocked = door:getKeysNonOwnable()
		local owned = playerOwned or doorGroup or doorTeams
	    if IsValid(door) and door:isKeysOwnable() and door:GetPos():DistToSqr(LocalPlayer():GetPos()) < 10000 then
			if not door:IsVehicle() and not blocked and not owned then
				RunConsoleCommand("darkrp", "toggleown")
				Derma_StringRequest(DarkRP.getPhrase("set_x_title", DarkRP.getPhrase("door")), DarkRP.getPhrase("set_x_title_long", DarkRP.getPhrase("door")), "", function(text)
	                RunConsoleCommand("darkrp", "title", text)
	            end)
			else
				DarkRP.openKeysMenu()
			end
		end
	end

	GAMEMODE.ShowTeam = uhhh
	usermessage.Hook("KeysMenu", uhhh)
end)

local offset = {
	["models/props_c17/door01_left.mdl"] = -4,
}

local function DrawDoors()
	local tr = LocalPlayer():GetEyeTrace()

	local door = tr.Entity
    if IsValid(door) and not door:IsVehicle() and door:isKeysOwnable() and door:GetPos():DistToSqr(LocalPlayer():GetPos()) < 40000 then
		local al = 255
		if al > 0 then
			local maxs, mins, center = door:OBBMaxs(), door:OBBMins(), door:OBBCenter()
			local off = offset[ door:GetModel() ]
			if maxs.x - mins.x > maxs.y - mins.y then
				local pos = door:LocalToWorld( Vector( center.x, maxs.y + (off or 0.1), center.z ) )
				local ang = door:LocalToWorldAngles( Angle(0,180,90) )
				cam.Start3D2D( pos, ang, 0.1 )
					drawDoor( door, al )
				cam.End3D2D()

				local pos = door:LocalToWorld( Vector( center.x, mins.y - (off or 0.1), center.z ) )
				local ang = door:LocalToWorldAngles( Angle(0,0,90) )
				cam.Start3D2D( pos, ang, 0.1 )
					drawDoor( door, al )
				cam.End3D2D()
			else
				local pos = door:LocalToWorld( Vector( maxs.x + (off or 0.1), center.y, center.z ) )
				local ang = door:LocalToWorldAngles( Angle(0,90,90) )
				cam.Start3D2D( pos, ang, 0.1 )
					drawDoor( door, al )
				cam.End3D2D()

				local pos = door:LocalToWorld( Vector( mins.x - (off or 0.1), center.y, center.z ) )
				local ang = door:LocalToWorldAngles( Angle(0,-90,90) )
				cam.Start3D2D( pos, ang, 0.1 )
					drawDoor( door, al )
				cam.End3D2D()
			end
		end
    end

end
hook.Add( "PostDrawTranslucentRenderables", "DrawDoors", DrawDoors )
	