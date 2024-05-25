function itemOnGround(){
	
	if( (yy + 17) / 64 == floor((yy + 17) / 64)){
		var b = floor((yy + 17) / 64);
		var a1 = floor((xx - 16) / 64);
		var a2 = floor((xx + 16) / 64);
		
		if( (inBounds(a1, b) && ww.pmap[a1, b] != noone) ||
			(inBounds(a2, b) && ww.pmap[a2, b] != noone) ){ 
			return true; 
		}
	}
	
	
	return pointInBlock(xx - 16, yy + 17 + 1) ||
			pointInBlock(xx + 16, yy + 17 + 1) ||
			pointInBlock(xx, yy + 17 + 1);

}