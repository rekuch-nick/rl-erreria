event_inherited();

rot = -25;
timeCD = 10;


setSpots(xx, yy);
if(inBounds(xSpot, ySpot)){
	if(ww.bmap[xSpot, ySpot] != noone){
		var t = ww.bmap[xSpot, ySpot];
		if(t.damMax != -1){
			if(pc.tempMight >= t.minMight){
				t.dam += pc.tempMight;
			
			
				if(t.dam >= t.damMax){
					blockBreak(xSpot, ySpot);
				}
			}
		}
	}
}