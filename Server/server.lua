--//  scar-studios.tebex.io

RegisterServerEvent("Vehicle:KickOut")
AddEventHandler("Vehicle:KickOut",function(ped,pedS)
	TaskLeaveAnyVehicle(pedS,true,Config.KickOutFlag);
end)