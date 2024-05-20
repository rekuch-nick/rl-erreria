function blockBreak(a, b){
	if(!inBounds(a, b)){ return; }
	
	if(ww.bmap[a, b].con != noone){
		var c = cordLogicToScreen(a * 64 + 32, b * 64 + 32);
		pupSpawn(c.a, c.b, ww.bmap[a, b].con);
		//var e = instance_create_depth(c.a, c.b, ww.layerP, objPup);
		//e.item = ww.bmap[a, b].con;
		//e.mat = ww.bmap[a, b].con.mat;
		//e.sprite_index = ww.bmap[a, b].con.img;
	}
	
	
	
	ww.bmap[a, b] = noone;
	
	
	
	
	//remove features on top of block
	featureBreak(a, b-1);
	/*
	var i = 1;
	do {
		var ok = false;	
		if(inBounds(a, b-i) && ww.fmap[a, b-i] != noone){
			featureBreak(a, b-i);
			ok = true;
			i ++;
		}
	} until ( !ok ); */
}