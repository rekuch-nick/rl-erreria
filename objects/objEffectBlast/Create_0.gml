event_inherited();


timeCD = 10;


setSpots(xx, yy);
if(inBounds(xSpot, ySpot)){
	if(ww.bmap[xSpot, ySpot] != noone){
		var t = ww.bmap[xSpot, ySpot];
		if(t.damMax != -1){
			if(100 >= t.minMight){
				t.dam += 100;
			
			
				if(t.dam >= t.damMax){
					blockBreak(xSpot, ySpot);
				}
			}
		}
	}
	
	featureBreak(xSpot, ySpot);
}