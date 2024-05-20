function wwOre(t, n, bbb){
	
	var tries = 0;
	while(n > 0 && tries < 2000){
		tries ++;
		
		var aa = irandom_range(0, W - 1);
		var bb = irandom_range(0, 49) + (bbb * 50);
		if(bmap[aa, bb] != imgBlockDirt){ continue; }
		
		
		var l = irandom_range(1, 4) + irandom_range(1, 4) + irandom_range(1, 4);
		var a = aa; var b = bb;
		for(var i=0; i<l; i++){
			if(inBounds(a, b) && bmap[a, b] == imgBlockDirt){
				if(bmap[a, b] == imgBlockDirt){ n --; }
				bmap[a, b] = t;
			}
			a += choose(-1, 0, 0, 1);
			b += choose(-1, 0, 0, 1);
		}
		
		
	}
	
}