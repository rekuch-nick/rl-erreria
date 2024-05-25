function wwChestHouseInBiome(aaa, bbb, t){
	var bg = imgBGHouse;
	var wall = imgBlockWood;
	
	var tries = 0;
	while(tries < 50000){
		tries ++;
		var h = 4;
		var w = 5;
		var aa = irandom_range(0, 49 - w) + (aaa * 50);
		var bb = irandom_range(0, 49 - h) + (bbb * 50);
		
		var ok = true;
		var blockSpace = 0;
		var nonBlockSpace = 0;
		var botBlockSpace = 0;
		for(var a=aa; a<aa+w; a++){ for(var b=bb; b<bb+h; b++){
			if(!inBounds(a, b)){ ok = false; continue; }
			if(bgmap[a, b] == imgBGHouse){ ok = false; continue; }
			if(fmap[a, b] == imgHouseLeft){ ok = false; continue; }
			if(fmap[a, b] == imgHouseRight){ ok = false; continue; }
			if(fmap[a, b] == imgHouseRoofLeft){ ok = false; continue; }
			if(fmap[a, b] == imgHouseRoofRight){ ok = false; continue; }
			if(bmap[a, b] == noone){ nonBlockSpace ++; }
			if(bmap[a, b] != noone){ blockSpace ++; }
			if(bmap[a, b] != noone && b == bb+h-1){ botBlockSpace ++; }
		}}
		if(nonBlockSpace < 8){ ok = false; }
		if(botBlockSpace < 2){ ok = false; }
		
		
		
		//if(!inBounds(a, b + 1)){ continue; }
		//if(bmap[a, b] != noone && roll(95) ){ continue; }
		//if(bmap[a, b + 1] == noone){ continue; }
		//if(fmap[a, b] != noone){ continue; }
		
		if(ok){
			for(var a=aa; a<aa+w; a++){ for(var b=bb; b<bb+h; b++){
				bgmap[a, b] = bg;
				bmap[a, b] = noone;
				if(a == aa || a == aa+w-1 || b == bb || b == bb+h-1){
					bmap[a, b] = wall;
				}
				if(b == bb+h-1){ pmap[a, b] = imgPlatWood; }
			}}
			a = aa + floor(w / 2);
			b = bb + h - 2;
			bmap[a, b] = t;
			return;
		}
		
	}

}