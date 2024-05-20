function wwSetup(){
	
	
	
	
	for(var a=0; a<W; a++){
		for(var b=0; b<H; b++){
			bgmap[a, b] = noone;
			fmap[a, b] = noone;
			pmap[a, b] = noone;
			bmap[a, b] = noone;
			
			vmap[a, b] = false;
		}
	}
	
	
	
	for(var a=0; a<W/BW; a++){
		biome[a, 0] = Biome.sky;
		biome[a, 1] = Biome.surface;
		biome[a, 2] = Biome.cave;
		biome[a, 3] = Biome.cave;
		biome[a, 4] = Biome.deepCave;
		biome[a, 5] = Biome.deepCave;
		biome[a, 6] = Biome.lavaCave;
	}
	//biome[floor((W/2) / 50), 1] = Biome.home;
	
	biome[2, 3] = Biome.slime;
}