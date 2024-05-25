function wwRoll(){
	
	
	//var s = "123";
	val = 13;
	//for(var i=0; i<string_length(s); i++){
	//	var v = ord(string_char_at(s, i));
	//	val += v;
	//}
	
	
	
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
			//vmap[a, b] = true;
		}
		bmap[a, gl] = imgBlockGrass;
		//vmap[a, gl] = true;
		
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
		var t = b >= 93 ? imgBlockDirtUnbreakable : imgBlockSky;
		t = imgBlockDirtUnbreakable;
		bmap[a, b] = t; //
	}}
	for(var a=W-xBuffer; a<W; a++){ for(var b=0; b<H; b++){  
		var t = b >= 93 ? imgBlockDirtUnbreakable : imgBlockSky;
		t = imgBlockDirtUnbreakable;
		bmap[a, b] = t; //
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
	shop[imgHouseSignPick] = [ getItem("Gold Pickaxe"), getItem("Mythril Pickaxe"), getItem("Adamantite Pick"), noone ];
	
	shop[imgHouseSignGoldsmith] = [ getItem("Gold Pickaxe"), getItem("Golden Sword"), getItem("Golden Armor"), noone ];
	shop[imgHouseSignGel] = [ getItem("Torch"), getItem("Bomb"), getItem("Gel Sword"), noone ];
	shop[imgHouseSignPots] = [ getItem("Healing Potion"), getItem("Potion of Might"), getItem("Stoneskin Potion"), noone ];
	
	shop[imgHouseSignMythril] = [ getItem("Mythril Pickaxe"), getItem("Mythril Sword"), getItem("Mythril Armor"), noone ];
	shop[imgHouseSignNails] = [ getItem("Hop n Tops"), getItem("Sonic Gear"), getItem("Shield Drape"), noone ];
	shop[imgHouseSignHats] = [ getItem("Golden Helm"), getItem("Feather Cap"), getItem("Miner's Rag"), noone ];
	
	
	houses1 = [imgHouseSignGoldsmith, imgHouseSignGoldsmith, imgHouseSignGoldsmith, imgHouseSignGel, imgHouseSignGel, imgHouseSignGel, imgHouseSignPots, imgHouseSignPots];
	array_shuffle(houses1);
	for(var i=0; i<8; i++){ wwHouseInBiome(i, 2, houses1[i]); }
	
	houses2 = [imgHouseSignMythril, imgHouseSignMythril, imgHouseSignMythril, imgHouseSignNails, imgHouseSignNails, imgHouseSignNails, imgHouseSignHats, imgHouseSignHats];
	array_shuffle(houses2);
	for(var i=0; i<8; i++){ wwHouseInBiome(i, 3, houses2[i]); }
	
	
	
	
	
	
	for(var a=0; a<W/BW; a++){
		wwChestHouseInBiome(a, 2, imgBlockChest);
		wwChestHouseInBiome(a, 2, imgBlockChest);
	}
	
	
	
	wwJars(500);
	
	
	wwOre(imgBlockGold, 1000, 2);
	wwOre(imgBlockGold, 500, 3); wwOre(imgBlockMythril, 500, 3);
	wwOre(imgBlockMythril, 1000, 4);
	wwOre(imgBlockAdamantite, 800, 5);
	
	

	
	
	//replace dirt
	for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
		xB = floor(a / 50); yB = floor(b / 50);
		if(bmap[a, b] == imgBlockDirt){
			
			if(biome[xB, yB] == Biome.cave && roll( (b-100) / 2)){ bmap[a, b] = imgBlockDirtRock; }
			if(biome[xB, yB] == Biome.deepCave){ bmap[a, b] = imgBlockRock; }
			if(biome[xB, yB] == Biome.lavaCave){ bmap[a, b] = imgBlockRock; }
			
			if(biome[xB, yB] == Biome.slime && roll(30)){ bmap[a, b] = imgBlockSlime; }
			
			if(biome[xB, yB] == Biome.lice && roll(30)){ bmap[a, b] = imgBlockDirtEgg; }
			
			
			if(biome[xB, yB] == Biome.purp && bmap[a, b-1] == noone){ bmap[a, b] = imgBlockGrassPurp; }
		}
		
		
		if(biome[xB, yB] == Biome.specs && roll(60)){ bgmap[a, b] = imgBGCaveSpecs; }
		if(biome[xB, yB] == Biome.slime && roll(40)){ bgmap[a, b] = imgBGCaveSlime; }
	}}
	
	
	//plants
	for(var a=0; a<W; a++){ for(var b=2; b<H; b++){
		xB = floor(a / 50); yB = floor(b / 50);
		
		if(bmap[a, b] == imgBlockGrass && fmap[a, b - 1] == noone){
			if(irandom_range(0, 4) == 1){ 
				fmap[a, b - 1] = imgBush;
			} else if(irandom_range(0, 2) == 1){ 
				fmap[a, b - 1] = imgBushBot; 
				fmap[a, b - 2] = imgBushTop; 
			}
		}
		
		
		if(bmap[a, b] == imgBlockGrassPurp && fmap[a, b - 1] == noone){
			if(irandom_range(0, 4) == 1){ 
				fmap[a, b - 1] = imgBushPurp;
			}
		}
		
	}}
	
	
	
	//load blocks
	for(var b=0; b<H; b++){ for(var a=0; a<W; a++){ 
		if(bmap[a, b] != noone){ bmap[a, b] = getBlock(bmap[a, b]); }
	}}
	

	
}