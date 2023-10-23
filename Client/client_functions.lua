--//  scar-studios.tebex.io

function ShowNotify(text)
    BeginTextCommandThefeedPost("STRING");
    AddTextComponentSubstringPlayerName(text);
    EndTextCommandThefeedPostTicker(false,false);
end

function SortedKeys(items,sortFunction)
    local keys,len={},0;
    for k,_ in pairs(items)do
        len=len+1;
        keys[len]=k;
    end

    table.sort(keys,sortFunction);

    return keys;
end

SeatNumber={
	[0]=-1, [1]=0, [2]=1, [3]=2, [4]=3, [5]=4, [6]=5, [7]=6,
	[8]=7, [9]=8, [10]=9, [11]=10, [12]=11, [13]=12, [14]=13,
	[15]=14, [16]=15,
}