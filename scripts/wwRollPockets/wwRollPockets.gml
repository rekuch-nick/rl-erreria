function wwRollPockets(aaa, bbb){
	
	//for(var a=aa; a<aa+BW; a++){ for(var b=bb; b<bb+BH; b++){ }}
	
	var pm = choose(7, 8, 9);
	for(var p=0; p<pm; p++){
		
		var aa = aaa * BW; 
		var bb = bbb * BH;
		aa += irandom_range(5, 45);
		bb += irandom_range(5, 45);
		
		for(var n=0; n<12; n++){
			var a = aa; var b = bb;
			for(var l=0; l<22; l++){
				if(inBounds(a, b)){ bmap[a, b] = noone; }
				if(choose(true, false)){
					a += choose(-1, 1);
				} else {
					b += choose(-1, 1);
				}
			}
		}
	}

}