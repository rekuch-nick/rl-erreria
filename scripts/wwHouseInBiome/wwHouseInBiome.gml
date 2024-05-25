function wwHouseInBiome(aaa, bbb, signSprite){
	
	
	var tries = 0;
	while(tries < 10000){
		tries ++;
		var ok = true;
		
		var aa = irandom_range(0, 49);
		var bb = irandom_range(0, 47);
		
		var a = aa + (aaa * 50);
		var b = bb + (bbb * 50);
		
		//if(bmap[a, b] == imgBlockDirtUnbreakable){ continue; }
		//if(bmap[a + 2, b] == imgBlockDirtUnbreakable){ continue; }
		
		//if(bmap[a, b+2] == noone){ continue; } //
		
		
		var blocks = 0;
		var spaces = 0;
		for(var xx=a; xx<=a+2; xx++){ for(var yy=b; yy<=b+2; yy++){ 
			if(bmap[xx, yy] == noone){ spaces ++; }
			if(bmap[xx, yy] != noone){ blocks ++; }
			if(bmap[xx, yy] == imgBlockDirtUnbreakable){ ok = false; break }
		}}
		if(blocks < 2){ ok = false; }
		if(spaces < 2){ ok = false; }
		
		
		if(ok){
		
		
		
		
			bmap[a, b+2] = imgBlockDirtUnbreakable;
			bmap[a+1, b+2] = imgBlockDirtUnbreakable;
			bmap[a+2, b+2] = imgBlockDirtUnbreakable;
		
			bmap[a, b] = noone;
			bmap[a+1, b] = noone;
			bmap[a+2, b] = noone;
			bmap[a, b+1] = noone;
			bmap[a+1, b+1] = noone;
			bmap[a+2, b+1] = noone;
		
			fmap[a, b] = imgHouseRoofLeft;
			fmap[a+1, b] = signSprite;
			fmap[a+2, b] = imgHouseRoofRight;
		
			fmap[a, b+1] = imgHouseLeft;
			fmap[a+1, b+1] = imgDoor;
			fmap[a+2, b+1] = imgHouseRight;
		
			return;
		}
	}
	
	
}