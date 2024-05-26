function wwSkyIslandInBiome(aaa, bbb){
	
	
	
	
	var tries = 0;
	while(tries < 500){
		tries ++;
		var h = 10;
		var w = 20;
		var aa = irandom_range(0, 49 - w) + (aaa * 50);
		var bb = irandom_range(0, 49 - h) + (bbb * 50);
		
		var ok = true;
		
		for(var a=aa; a<aa+w; a++){ for(var b=bb; b<bb+h; b++){
			if(!inBounds(a, b)){ ok = false; continue; }
			if(bmap[a, b] != noone){ ok = false; continue; }
		}}
		
		
		
		if(ok){
			for(var a=aa; a<aa+w; a++){ 
				
				for(var b=bb+4-4; b<bb+4; b++){
					bmap[a, b] = imgBlockDirt;
					if(roll(25)){ break; }
				}
				
				
				
			}
			return;
		}
		
	}


}