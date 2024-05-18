function creatureOnGround(){
	
	if( (yy + 33) / 64 == floor((yy + 33) / 64)){
		var b = floor((yy + 34) / 64);
		var a1 = floor((xx - 24) / 64);
		var a2 = floor((xx + 24) / 64);
		
		if( (inBounds(a1, b) && ww.pmap[a1, b] != noone) ||
			(inBounds(a2, b) && ww.pmap[a2, b] != noone) ){ 
			return true; 
		}
	}
	
	
	return pointInBlock(xx - 24, yy + 32 + 1) ||
			pointInBlock(xx + 24, yy + 32 + 1) ||
			pointInBlock(xx, yy + 32 + 1);

}