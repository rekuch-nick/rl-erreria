function creatureInBlock(){
	
	return pointInBlock(xx - 24, yy + 32) ||
			pointInBlock(xx + 24, yy + 32) ||
			pointInBlock(xx - 24, yy - 16) ||
			pointInBlock(xx + 24, yy - 16);

}