function wwHomeCastle(){
	
	
	
	var w = 20; var h = 11;
	var aa = floor(W/2) - floor(w/2);
	//var bb = 79;
	var bb = glHome - 10 - 4;
	
	xHome = aa;
	yHome = bb;
	
	for(var a=aa; a<aa+w; a++){ for(var b=bb; b<bb+h; b++){
		bgmap[a, b] = imgBGCastle;
		if(b == bb){ bgmap[a, b] = imgBGCastleTop; }
		
		bmap[a, b] = noone;
		if(b == bb + h - 1){ bmap[a, b] = imgBlockCastle; }
		if(b == bb + 1){ bmap[a, b] = imgBlockCastle; }
		if( (a == aa || a == aa + w - 1) && b > bb && b < bb + h - 3){
			bmap[a, b] = imgBlockCastle;
		}
	}}
	for(var a=aa+1; a<aa+w-1; a++){
		if(a == aa + 8){ a += 4; }
		pmap[a, bb + 4] = imgPlatHome;
		pmap[a, bb + 7] = imgPlatHome;
	}
	for(var a=aa; a<aa+w; a++){ for(var b=bb+h; b<100; b++){
		if(bmap[a, b] == noone){ bmap[a, b] = imgBlockDirt; }
	}}
	houseAt(aa + 1, bb + 5, imgHouseSignWoodwork);
	//houseAt(aa + 4, bb + 5, imgHouseSignGel);
	//houseAt(aa + 7, bb + 4, imgHouseSignWoodwork);
	
	//houseAt(aa + 10, bb + 4, imgHouseSignWoodwork);
	houseAt(aa + 13, bb + 5, imgHouseSignPick);
	//houseAt(aa + 16, bb + 5, imgHouseSignGoldsmith);
	
	
	//houseAt(aa + 4, bb + 2, imgHouseSignGel);

}