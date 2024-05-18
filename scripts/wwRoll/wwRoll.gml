function wwRoll(){
	
	wwSetup();
	for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
		bgmap[a, b] = noone;
		fmap[a, b] = noone;
		pmap[a, b] = noone;
		bmap[a, b] = imgBlockDirt;
	}}
	
	
	
	
	
	
	var gl = 47;
	for(var a=0; a<W; a++){
		gl = clamp(gl + choose(0, 0, 0, 1, -1), 44, 49);
		for(var b=0; b<gl; b++){ 
			bmap[a, b] = noone; 
		}
		bmap[a, gl] = imgBlockGrass;
		if(irandom_range(0, 4) == 1){ 
			fmap[a, gl - 1] = imgBush;
		} else if(irandom_range(0, 2) == 1){ 
				fmap[a, gl - 1] = imgBushBot; 
				fmap[a, gl - 2] = imgBushTop; 
		}
	}
	
	
	
	
	var caveTop = 51;
	for(var a=0; a<W; a++){ for(var b=0; b<caveTop; b++){
		bgmap[a, b] = imgBGSky;
	}}
	for(var a=0; a<W; a++){
		pmap[a, caveTop] = imgPlatCave;
	}
	
	
	for(var a=0; a<W; a++){ for(var b=caveTop; b<H; b++){
		bmap[a, b] = choose(noone, imgBlockDirt);
	}}
	for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
			tempMap[a, b] = bmap[a, b];
	}}
	
	for(var s=0; s<2; s++){
		for(var a=0; a<W; a++){ for(var b=caveTop; b<H; b++){
			var adj = 0; var space = 0;
			for(var xx=a-1; xx<=a+1; xx++){ for(var yy=b-1; yy<=b+1; yy++){
				if(!inBounds(xx, yy)){ continue; }
				if(bmap[xx, yy] == noone){ space ++; } else { adj ++; }
			}}
			if(adj > space){
				tempMap[a, b] = imgBlockDirt;
			} else {
				tempMap[a, b] = noone;
			}
			
			
		}}
		for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
			bmap[a, b] = tempMap[a, b];
		}}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
		if(bmap[a, b] != noone){ bmap[a, b] = getBlock(bmap[a, b]); }
	}}
	
	
	
	/*
	
	
	for(var a=0; a<W/BW; a++){
		for(var b=0; b<H/BH; b++){
			biome[a, b] = Biome.pockets;
		}
	}
	for(var a=0; a<=W/BW; a++){
		biome[a, 0] = Biome.surface;
	}
	biome[4, 1] = Biome.chasm;
	biome[4, 2] = Biome.smooth;
	
	
	
	
	
	for(var a=0; a<W/BW; a++){ for(var b=0; b<H/BH; b++){
		
		if(biome[a, b] == Biome.surface){ wwRollSurface(a, b); }
		if(biome[a, b] == Biome.pockets){ wwRollPockets(a, b); }
		if(biome[a, b] == Biome.smooth){ wwRollSmooth(a, b); }
		if(biome[a, b] == Biome.chasm){ wwRollChasm(a, b); }

		
	}}
	
	*/
	
	
	//standard replace
	/*
	for(var a=0; a<W; a++){
		for(var b=0; b<H; b++){
			
			
			
			/*
			if(b > groundLevel[a]){
				bmap[a, b] = getBlock(imgBlockDirt);
				if(roll(b)){ bmap[a, b] = getBlock(imgBlockDirtRock); }
				
				
				if(a < 11 || a >= W - 11){
					bmap[a, b] = getBlock(imgBlockDirtUnbreakable);
				}
			}*//*
			if(b > groundLevel[a]){
				bmap[a, b] = getBlock(imgBlockDirt);
				if(roll(b)){ bmap[a, b] = getBlock(imgBlockDirtRock); }
				
				
				if(a < 11 || a >= W - 11){
					bmap[a, b] = getBlock(imgBlockDirtUnbreakable);
				}
			}*/
			
		//}
	//}
	
	
}