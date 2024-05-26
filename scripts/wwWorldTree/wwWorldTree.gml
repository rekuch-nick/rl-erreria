function wwWorldTree(aaa, bbb){
	
	for(var a=aaa; a<aaa+4; a++){
		for(var b=bbb; b<H; b++){
			if(bgmap[a, b] == imgBGSky){
				bgmap[a, b] = imgBGTree;
			} else {
				break;
			}
		}
	}
}