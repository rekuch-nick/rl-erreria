function wwRollChasm(aaa, bbb){
	
	//for(var a=aa; a<aa+BW; a++){ for(var b=bb; b<bb+BH; b++){ }}
	
	wwRollMicroPockets(aaa, bbb);
	
	return;
	
	var pm = choose(5, 6, 7, 8, 9);
	for(var p=0; p<pm; p++){
		
		var aa = aaa * BW; 
		var bb = bbb * BH;
		aa += irandom_range(5, 45);
		bb += irandom_range(15, 35);
		
		
		var w = irandom_range(4, 8);
		var h = irandom_range(20, 30);
		
		
		var x1 = floor(aa-w/2);
		var y1 = floor(bb-h/2);
		var x2 = floor(aa+w/2);
		var y2 = floor(bb+h/2);
		
		for(var a=x1; a<x2; a++){ for(var b=y1; b<y2; b++){
			if( (a != x1 && a != x2 - 1) || (b != y1 && b != y2 - 1) ){
			
						bmap[a, b] = noone;
			}
			
		
		}}
	}

}