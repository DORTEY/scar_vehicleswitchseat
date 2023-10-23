Config={};

Config={
    Menu={
        Bindkey = "G",--key to open the menu
        Command = "seat",--command to open the menu
		Cooldown = 1000,--the cooldown in ms between switch (in that case its 1 second)
		Position = "right",--choose between left and right
		
		Texts={
			Title = "~o~SCAR ~w~switch seat",
			SubTitle = "~o~Switch vehicle seat",

            Icons={
                Free = "💺",
                Taken = "❌",
            },

            SeatTaken = "~r~Seat is already taken!",
            SeatSwitched = "~g~Seat switched.",
            SeatDoesntExist = "~r~This seat doesnt exist!",
            CantKickYourself = "You cant kick yourself out of the vehicle",
		},
	},

    KickOutFlag = 0,--https://docs.fivem.net/natives/?_0xD3DBCE61A490BE02
}

Config.Seats={
    ["Seats"]={
        {name="Driver seat",seat=0},
        {name="Passenger seat",seat=1},
        {name="Third seat",seat=2},
        {name="Fourth seat",seat=3},
        {name="Fifth seat",seat=4},
        {name="Sixth seat",seat=5},
        {name="Seventh seat",seat=6},
        {name="Eight seat",seat=7},
        {name="Ninth seat",seat=8},
        {name="Tenth seat",seat=9},
        {name="Eleventh seat",seat=10},
        {name="Twelfth seat",seat=11},
        {name="Thirteenth seat",seat=12},
        {name="Fourteenth seat",seat=13},
        {name="Fifteenth seat",seat=14},
        {name="Sixteenth seat",seat=15},
    },
    ["Passengers"]={

    }
}


Notify=function(message)--custom notify support
	ShowNotify(message);
end