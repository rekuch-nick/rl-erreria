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
		bgmap[a, b] = imgBGCave;
		fmap[a, b] = noone;
		pmap[a, b] = noone;
		bmap[a, b] = imgBlockDirt;
	}}
	
	
	
	lavaLevel = 349;
	xBuffer = 11;
	
	var gl = 97;
	for(var a=0; a<W; a++){
		gl = clamp(gl + choose(0, 0, 0, 1, -1), 94, 99);
		for(var b=0; b<gl; b++){ 
			bmap[a, b] = noone; 
			vmap[a, b] = true;
		}
		bmap[a, gl] = imgBlockGrass;
		vmap[a, gl] = true;
		
		//if(irandom_range(0, 4) == 1){ 
		//	fmap[a, gl - 1] = imgBush;
		//} else if(irandom_range(0, 2) == 1){ 
		//		fmap[a, gl - 1] = imgBushBot; 
		//		fmap[a, gl - 2] = imgBushTop; 
		//}
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
	
	// lava at bottom
	for(var a=xBuffer; a<W-xBuffer; a++){ for(var b=lavaLevel-30; b<lavaLevel; b++){ 
		if(b == lavaLevel - 30){ b += irandom_range(0, 4); }
		bmap[a, b] = noone; 
	}}
	for(var a=xBuffer; a<W-xBuffer; a++){ bmap[a, lavaLevel] = imgBlockLava; }
	for(var a=xBuffer + 6; a<W-xBuffer; a++){ 
		bmap[a, lavaLevel - 1] = imgBlockRock;
		bgmap[a, lavaLevel] = imgBlockRock;
		
		if(irandom_range(0, 4) == 1){ a += irandom_range(5, 10); }
	}
	
	
	for(var a=0; a<xBuffer; a++){ for(var b=0; b<H; b++){  
		bmap[a, b] = imgBlockDirtUnbreakable; //
	}}
	for(var a=W-xBuffer; a<W; a++){ for(var b=0; b<H; b++){  
		bmap[a, b] = imgBlockDirtUnbreakable; //
	}}
	
	
	
	//home
	/*var aaa = floor((W/2) / 50); var bbb = 1;
	for(var aa=15; aa<45; aa++){
		var a = aaa * 50 + aa;
		var bb = bbb * 50;
		pmap[a, bb + 43] = imgPlatWood;
	}*/
	wwHouseInBiome(floor((W/2) / 50), 1, imgHouseSignWoodwork);
	wwHouseInBiome(floor((W/2) / 50), 1, imgHouseSignPick);
	
	
	//shops
	shop[imgHouseSignWoodwork] = [ getItem("Platform"), getItem("Wooden Sword"), getItem("Wooden Armor"), noone ];
	shop[imgHouseSignGoldsmith] = [ getItem("Gold Pickaxe"), getItem("Golden Sword"), getItem("Golden Helm"), noone ];
	shop[imgHouseSignPick] = [ getItem("Gold Pickaxe"), getItem("Mythril Pickaxe"), getItem("Adamantite Pick"), noone ];
	wwHouseInBiome(0, 2, imgHouseSignGoldsmith);
	wwHouseInBiome(1, 2, imgHouseSignGoldsmith);
	wwHouseInBiome(2, 2, imgHouseSignGoldsmith);
	wwHouseInBiome(3, 2, imgHouseSignGoldsmith);
	wwHouseInBiome(4, 2, imgHouseSignGoldsmith);
	wwHouseInBiome(5, 2, imgHouseSignGoldsmith);
	
	
	
	
	
	
	
	wwJars(500);
	
	
	wwOre(imgBlockGold, 1000, 2);
	wwOre(imgBlockGold, 500, 3); wwOre(imgBlockMythril, 500, 3);
	wwOre(imgBlockMythril, 1000, 4);
	wwOre(imgBlockAdamantite, 800, 5);
	
	
	
	
	
	
	
	
	
	for(var a=0; a<W/BW; a++){
		wwChestInBiome(a, 2, imgBlockChest);
		wwChestInBiome(a, 2, imgBlockChest);
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
	
	
	//plants
	for(var a=0; a<W; a++){ for(var b=2; b<H; b++){
		
		if(bmap[a, b] == imgBlockGrass && fmap[a, b - 1] == noone){
			if(irandom_range(0, 4) == 1){ 
				fmap[a, b - 1] = imgBush;
			} else if(irandom_range(0, 2) == 1){ 
				fmap[a, b - 1] = imgBushBot; 
				fmap[a, b - 2] = imgBushTop; 
			}
		}
		
	}}
	
	
	
	//load blocks
	for(var b=0; b<H; b++){ for(var a=0; a<W; a++){ 
		if(bmap[a, b] != noone){ bmap[a, b] = getBlock(bmap[a, b]); }
	}}
	

	
}