function featureBreak(a, b){
	if(!inBounds(a, b)){ return; }
	
	var t = ww.fmap[a, b];
	var c = cordLogicToScreen(a * 64 + 32, b * 64 + 32);
	
	if( t == imgBushBot ){
		featureBreak(a, b - 1);
	}
	
	if(t == imgBush || t == imgBushBot || t == imgBushTop){
		
		
		pupSpawn(c.a, c.b, getItem("Wood"));
		
	} else if(t == imgJar ){
		
		
		pupSpawn(c.a, c.b, getItem(choose("Healing Potion", "Potion of Might")));
	
	} else if (t == imgBushPurp) {
		
	} else { return; }
	
	
	
	
	ww.fmap[a, b] = noone;
}