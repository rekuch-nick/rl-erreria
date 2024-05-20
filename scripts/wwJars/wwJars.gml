function wwJars(n){
	
	var tries = 0;
	while(tries < 500000 && n > 0){
		tries ++;
		var a = irandom_range(0, W - 1);
		var b = irandom_range(0, H - 3);
		
		if(bmap[a, b] != noone){ continue; }
		if(fmap[a, b] != noone){ continue; }
		if(!inBounds(a, b + 1) || bmap[a, b + 1] == noone){ continue; }
		
		var jarsNearby = 0;
		for(var aa=a-4; aa<a+5; aa++){ for(var bb=b-2; bb<b+3; bb++){
			if(!inBounds(aa, bb)){ continue; }
			if(fmap[aa, bb] == imgJar){ jarsNearby ++; }
		}}
		
		if(tries > 200 && jarsNearby < 1 && roll(95)){ continue; }
		
		
		fmap[a, b] = imgJar;
		n --;
	}
	
	
}