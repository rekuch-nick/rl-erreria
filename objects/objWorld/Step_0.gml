if(state == State.gen){
	wwRoll();
	state = State.play;
}







if(state == State.play){
	
	if(irandom_range(1, 120) == 1 && instance_number(objMob) < 6){
		var tries = 0;
		while(tries < 100){
			tries ++;
			var a = pc.xSpot + irandom_range(-10, 10);
			var b = pc.ySpot + irandom_range(-8, 8);
			if(inBounds(a, b)){
				if(ww.bmap[a, b] == noone){
					var c = cordLogicToScreen(a * 64 + 32, b * 64 + 32);
					var e = instance_create_depth(c.a, c.b, ww.layerM, objEffectMobSpawn);
					break;
				}
			}
		}
		
	}
	
	
	
}