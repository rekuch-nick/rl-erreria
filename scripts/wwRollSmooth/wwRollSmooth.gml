function wwRollSmooth(aa, bb){
	
	aa *= BW; bb *= BH;
	
	for(var a=aa; a<aa+BW; a++){ for(var b=bb; b<bb+BH; b++){
		bmap[a, b] = choose(noone, getBlock(imgBlockDirt));
	}}
	
	for(var s=0; s<2; s++){
		for(var a=aa+1; a<aa+BW-1; a++){ for(var b=bb+1; b<bb+BH-1; b++){
			var adj = 0;
			if(!inBounds(a+1, b) || bmap[a+1, b] != noone){ adj ++; }
			if(!inBounds(a-1, b) || bmap[a-1, b] != noone){ adj ++; }
			if(!inBounds(a, b+1) || bmap[a, b+1] != noone){ adj ++; }
			if(!inBounds(a, b-1) || bmap[a, b-1] != noone){ adj ++; }
			//if(!inBounds(a-1, b-1) || bmap[a-1, b-1] != noone){ adj ++; }
			//if(!inBounds(a-1, b+1) || bmap[a-1, b+1] != noone){ adj ++; }
			//if(!inBounds(a+1, b-1) || bmap[a+1, b-1] != noone){ adj ++; }
			//if(!inBounds(a+1, b+1) || bmap[a+1, b+1] != noone){ adj ++; }
			
			if(adj > 3){ bmap[a, b] = getBlock(imgBlockDirt); }
			if(adj < 2){ bmap[a, b] = noone; }
			
			//if(adj > 5){ bmap[a, b] = getBlock(imgBlockDirt); }
			//if(adj < 4){ bmap[a, b] = noone; }
		}}
	}

}