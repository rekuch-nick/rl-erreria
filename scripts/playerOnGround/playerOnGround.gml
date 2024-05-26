function playerOnGround(){
	
	if(pc.debug){ return false; }
	
	if(pc.onRope){ return true; }
	
	if(pc.yIn <= 0 && (pc.yy + 33) / 64 == floor((pc.yy + 33) / 64)){
		var b = floor((pc.yy + 34) / 64);
		var a1 = floor((pc.xx - 24) / 64);
		var a2 = floor((pc.xx + 24) / 64);
		
		if( (inBounds(a1, b) && ww.pmap[a1, b] != noone) ||
			(inBounds(a2, b) && ww.pmap[a2, b] != noone) ){ 
			return true; 
		}
	}
	
	return pointInBlock(pc.xx - 24, pc.yy + 32 + 1) ||
			pointInBlock(pc.xx + 24, pc.yy + 32 + 1) ||
			pointInBlock(pc.xx, pc.yy + 32 + 1);

}