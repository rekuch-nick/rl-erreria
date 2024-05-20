function featureBreak(a, b){
	if(!inBounds(a, b)){ return; }
	
	var t = ww.fmap[a, b];
	
	if( t == imgBushBot ){
		featureBreak(a, b - 1);
	}
	
	if(t == imgBush || t == imgBushBot || t == imgBushTop){
		
		var c = cordLogicToScreen(a * 64 + 32, b * 64 + 32);
		pupSpawn(c.a, c.b, getItem("Wood"));
		
	} else if(t == imgJar ){
		
		var c = cordLogicToScreen(a * 64 + 32, b * 64 + 32);
		pupSpawn(c.a, c.b, getItem(choose("Healing Potion", "Potion of Might")));
		
	} else { return; }
	
	
	
	
	ww.fmap[a, b] = noone;
}