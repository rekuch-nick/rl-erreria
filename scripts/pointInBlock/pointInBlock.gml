function pointInBlock(a, b){
	var aa = floor(a / 64);
	var bb = floor(b / 64);
	if(!inBounds(aa, bb)){ return true; }
	return ww.bmap[aa, bb] != noone;
}