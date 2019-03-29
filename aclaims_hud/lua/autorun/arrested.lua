if(SERVER)then
    hook.Add("playerArrested", "darkrp_workaround", function(pl, time, arrester)
        pl:SetNWInt("arrest_End", CurTime() + time);
    end)
elseif(CLIENT)then
    hook.Add("HUDPaint", "draw_ArrestTIme", function()
        if(LocalPlayer().getDarkRPVar && !LocalPlayer():getDarkRPVar("Arrested"))then return; end
 
        local s = string.ToMinutesSeconds( LocalPlayer():GetNWInt("arrest_End", CurTime()) - CurTime());
        draw.SimpleText( "Time remaining: " .. s, "default", 2, ScrH() / 2, color_grey, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
    end)
end

MsgC( Color(240, 173, 78), "[ClaimsHUD]", Color(210, 210, 210), "Loading GUIS/Hud By ", Color(240, 173, 78) ,"Claims", Color(210, 210, 210),"(STEAM_1:0:35617107)\n" )