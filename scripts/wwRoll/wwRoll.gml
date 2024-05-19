function wwRoll(){
	
	
	var s = "123";
	val = 0;
	for(var i=0; i<string_length(s); i++){
		var v = ord(string_char_at(s, i));
		val += v;
	}
	
	
	
	random_set_seed(val);
	
	wwSetup();
	for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
		bgmap[a, b] = noone;
		fmap[a, b] = noone;
		pmap[a, b] = noone;
		bmap[a, b] = imgBlockDirt;
	}}
	
	
	
	
	
	
	var gl = 97;
	for(var a=0; a<W; a++){
		gl = clamp(gl + choose(0, 0, 0, 1, -1), 94, 99);
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
	
	
	
	
	var caveTop = 101;
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
	
	for(var s=0; s<3; s++){
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
	
	
	
	
	for(var a=0; a<W; a++){
		bmap[a, 349] = imgBlockLava;
	}
	
	
	
	//replace dirt
	for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
		xB = floor(a / 50); yB = floor(b / 50);
		if(bmap[a, b] == imgBlockDirt){
			
			if(biome[xB, yB] == Biome.cave && roll( (b-100) / 2)){ bmap[a, b] = imgBlockDirtRock; }
			if(biome[xB, yB] == Biome.deepCave){ bmap[a, b] = imgBlockRock; }
			if(biome[xB, yB] == Biome.lavaCave){ bmap[a, b] = imgBlockRock; }
			
			if(biome[xB, yB] == Biome.slime && roll(30)){ bmap[a, b] = imgBlockSlime; }
		}
	}}
	
	
	
	
	
	
	
	for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
		if(bmap[a, b] != noone){ bmap[a, b] = getBlock(bmap[a, b]); }
	}}
	
	
	
}