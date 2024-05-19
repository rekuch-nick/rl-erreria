function featureBreak(a, b){
	if(!inBounds(a, b)){ return; }
	
	var t = ww.fmap[a, b];
	if(t == imgBush || t == imgBushBot || t == imgBushTop){
		
		var c = cordLogicToScreen(a * 64 + 32, b * 64 + 32);
		pupSpawn(c.a, c.b, getItem("Wood"));
		//var e = instance_create_depth(c.a, c.b, ww.layerP, objPup);
		//e.mat = Mat.wood;
		//e.sprite_index = imgPupWood;
		
		
	}
	
	
	ww.fmap[a, b] = noone;
}