function wwChestInBiome(aaa, bbb, t){
	
	
	var tries = 0;
	while(tries < 50000){
		tries ++;
		var a = irandom_range(0, 49) + (aaa * 50);
		var b = irandom_range(0, 49) + (bbb * 50);
		
		if(!inBounds(a, b + 1)){ continue; }
		if(bmap[a, b] != noone && roll(95) ){ continue; }
		if(bmap[a, b + 1] == noone){ continue; }
		if(fmap[a, b] != noone){ continue; }
		
		
		
		bmap[a, b] = t;
		pmap[a, b + 1] = imgPlatWood;
		return;
	}

}