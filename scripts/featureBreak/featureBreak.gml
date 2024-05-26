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
		
		
		pupSpawn(c.a, c.b, getConsumable());
		//pupSpawn(c.a, c.b, getItem(choose("Platform", "Healing Potion", "Potion of Might", "Shine Potion", "Stoneskin Potion")));
	
	} else if (t == imgBushPurp) {
		pupSpawn(c.a, c.b, getItem("Tar"));
	} else if (t == imgBushCrystal) {
		pupSpawn(c.a, c.b, getItem("Crystal"));
		
	} else { return; }
	
	
	
	
	ww.fmap[a, b] = noone;
}