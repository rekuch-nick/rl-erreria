function wwRollMicroPockets(aaa, bbb){
	
	//for(var a=aa; a<aa+BW; a++){ for(var b=bb; b<bb+BH; b++){ }}
	
	
	for(var xx=5; xx<50; xx+=8){ for(var yy=5; yy<50; yy+=8){
		
		var aa = aaa * BW + xx; 
		var bb = bbb * BH + yy;
		
		for(var n=0; n<8; n++){
			var a = aa; var b = bb;
			for(var l=0; l<4; l++){
				if(inBounds(a, b)){ bmap[a, b] = noone; }
				if(choose(true, false)){
					a += choose(-1, 1);
				} else {
					b += choose(-1, 1);
				}
			}
		}
	}}

}