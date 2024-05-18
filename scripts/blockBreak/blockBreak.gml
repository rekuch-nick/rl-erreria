function blockBreak(a, b){
	if(!inBounds(a, b)){ return; }
	
	ww.bmap[a, b] = noone;
	
	var i = 1;
	do {
		var ok = false;	
		if(inBounds(a, b-i) && ww.fmap[a, b-i] != noone){
			ww.fmap[a, b-i] = noone;
			ok = true;
			i ++;
		}
	} until ( !ok );
}