function wwRollSurface(aa, bb){
	aa *= BW; bb *= BH;
	
	var gl = 45;
	
	for(var a=aa; a<aa+BW; a++){ for(var b=bb; b<bb+BH; b++){
			
			if(b < gl){ bmap[a, b] = noone; }
			if(b == gl){ bmap[a, b] = getBlock(imgBlockGrass); }
			if(b > gl){ bmap[a, b] = getBlock(imgBlockDirt); }
			
			
	}}
	
	
}