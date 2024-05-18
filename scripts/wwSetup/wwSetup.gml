function wwSetup(){
	
	
	
	
	for(var a=0; a<W; a++){
		for(var b=0; b<H; b++){
			bgmap[a, b] = noone;
			fmap[a, b] = noone;
			pmap[a, b] = noone;
			bmap[a, b] = noone;
			
		}
	}
	
	
	
	for(var a=0; a<W/BW; a++){
		for(var b=0; b<H/BH; b++){
			biome[a, b] = Biome.pockets;
			
		}
	}
	
	
}