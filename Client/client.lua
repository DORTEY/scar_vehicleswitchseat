--//  scar-studios.tebex.io

local MenuPositionRight={x=1320,y=10};
local MenuPositionLeft={x=0,y=10};
local MenuPositionMenu={x=0,y=200};


if(Config.Menu.Position)then
	if(Config.Menu.Position=="left")then
		MenuPositionMenu=MenuPositionLeft;
	elseif(Config.Menu.Position=="right")then
		MenuPositionMenu=MenuPositionRight;
	end
end

local MenuMain=RageUI.CreateMenu(Config.Menu.Texts.Title,Config.Menu.Texts.SubTitle,MenuPositionMenu["x"],MenuPositionMenu["y"]);
local MenuSub=RageUI.CreateSubMenu(MenuMain,nil,nil);
local MenuSub2=RageUI.CreateSubMenu(MenuMain,nil,nil);

local UI=false;
local Cooldown=false;
local List=nil;
local ListIcon={};
local ListPassengers={};


CreateThread(function()
	while true do
		local sleep=5;

		if(UI)then
			sleep=4;
			if(IsPedInAnyVehicle(GetPlayerPed(-1),true))then
				local PlayerVEH=GetVehiclePedIsUsing(GetPlayerPed(-1));
				
				RageUI.IsVisible(MenuMain,true,true,true,function()
					for _,k in ipairs(SortedKeys(Config.Seats))do
						if(k=="Seats")then
							RageUI.ButtonWithStyle(k,nil,{RightLabel="~o~→"},true,function(_,_,Selected)
								if(Selected)then
									List=Config.Seats[k];
								end
							end,MenuSub)
						end
						if(GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()),-1)==PlayerPedId())then
							if(k=="Passengers")then
								RageUI.ButtonWithStyle(k,nil,{RightLabel="~o~→"},true,function(_,_,Selected)
									if(Selected)then
										getPassengers();
									end
								end,MenuSub2)
							end
						end
					end
				end)

				RageUI.IsVisible(MenuSub,true,true,true,function()
					for i,v in pairs(List)do
						if(not IsVehicleSeatFree(PlayerVEH,SeatNumber[tonumber(v.seat)]))then
							ListIcon[v.seat]=Config.Menu.Texts.Icons.Taken;
						else
							ListIcon[v.seat]=Config.Menu.Texts.Icons.Free;
						end
						RageUI.ButtonWithStyle(v.name,nil,{RightLabel=ListIcon[v.seat]},not Cooldown,function(_,_,Selected)
							if(Selected)then
								Cooldown=true;
								
								SetTimeout(Config.Menu.Cooldown,function()
									Cooldown=false;
								end)
								SwitchSeat(v.seat);
							end
						end)

						if(i>GetVehicleMaxNumberOfPassengers(PlayerVEH))then
							return;
						end
					end
				end)

				RageUI.IsVisible(MenuSub2,true,true,true,function()
					for i,v in pairs(ListPassengers)do
						RageUI.ButtonWithStyle(v[2],nil,{RightLabel=Config.Menu.Texts.Icons.Free},not Cooldown,function(_,_,Selected)
							if(Selected)then
								kickPassenger(v[1],v[2],PlayerVEH);
								getPassengers();
							end
						end)
					end
				end)
			else
				sleep=250;
			end
		else
			sleep=250;
		end
		Wait(sleep);
	end
end)

--0/16
function SwitchSeat(seat)
	if(seat)then
		if(IsPedInAnyVehicle(GetPlayerPed(-1),true))then
			local PlayerVEH=GetVehiclePedIsIn(GetPlayerPed(-1),false);
			if(tonumber(seat)<=GetVehicleMaxNumberOfPassengers(PlayerVEH))then
				if(IsVehicleSeatFree(PlayerVEH,SeatNumber[tonumber(seat)]))then
					SetPedIntoVehicle(PlayerPedId(),PlayerVEH,SeatNumber[tonumber(seat)]);
					Notify(Config.Menu.Texts.SeatSwitched);
				else
					Notify(Config.Menu.Texts.SeatTaken);
				end
			else
				Notify(Config.Menu.Texts.SeatDoesntExist);
			end
		end
	end
end

function getPassengers()
	ListPassengers={};
	for _,v in ipairs(GetActivePlayers())do
		if(GetVehiclePedIsIn(GetPlayerPed(v),false)==GetVehiclePedIsIn(GetPlayerPed(-1),false))then
			table.insert(ListPassengers,{v,GetPlayerServerId(v)});
		end
	end
end
function kickPassenger(ped,pedS,veh)
	if(ped and veh)then
		if(GetVehiclePedIsIn(GetPlayerPed(ped),false)==GetVehiclePedIsIn(GetPlayerPed(-1),false))then
			if(ped~=PlayerId())then
				TriggerServerEvent("Vehicle:KickOut",pedS);
			else
				Notify(Config.Menu.Texts.CantKickYourself);
			end
		end
	end
end

RegisterCommand(Config.Menu.Command,function(_,args)
	if(IsPedInAnyVehicle(GetPlayerPed(-1),true))then
		local PlayerVEH=GetVehiclePedIsIn(GetPlayerPed(-1),false);
		List={};
		ListPassengers={};
		getPassengers();

		UI=not UI;
		RageUI.Visible(MenuMain,UI);
	else
		UI=false;
		RageUI.Visible(MenuMain,UI);
	end
end,false)
RegisterKeyMapping(Config.Menu.Command,"Switch vehicle seat","keyboard",Config.Menu.Bindkey);

MenuMain.Closed=function()
	UI=false;
end