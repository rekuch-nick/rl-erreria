function playerInBlock(){
	
	if(pc.debug){ return false; }
	
	return pointInBlock(pc.xx - 24, pc.yy + 32) ||
			pointInBlock(pc.xx + 24, pc.yy + 32) ||
			pointInBlock(pc.xx - 24, pc.yy - 16) ||
			pointInBlock(pc.xx + 24, pc.yy - 16);
	
	
	
}