function pointInPlat(a, b){
	var aa = floor(a / 64);
	var bb = floor(b / 64);
	
	if(a != aa || b != bb){ return false; }
	if(!inBounds(aa, bb)){ return true; }
	return ww.pmap[aa, bb] != noone;
}




