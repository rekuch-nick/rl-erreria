function getObjectAtSpot(obj, a, b){
	with(obj){
		if(xSpot == a && ySpot == b){ return id; }
	}
	return noone;
}