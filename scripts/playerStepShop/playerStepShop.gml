function playerStepShop(){
	
	
	if(yHoldTime > 12){ yHoldTime = 1; }
	
	
	if(yIn != 0 && yHoldTime == 1){
		cur += yIn;
		if(cur < 0){ cur = array_length(sTxt) - 1; }
		if(cur > array_length(sTxt) - 1){ cur = 0; }
	}
	
	if(pressedStart){
		
		ww.state = State.play;
		return;
	}
	
	if(pressedJump){
		
		if(sItm[cur] == noone){
			
			yy -= 2;
			moveEverything(0, 2)
			jumps = 0;
			ww.state = State.play;
			
		} else {
			
			var canMake = true;
			var ii = sItm[cur];
			if(ii.makeWith1 != noone && mat[ii.makeWith1] < ii.makeCost1){ canMake = false; }
			if(ii.makeWith2 != noone && mat[ii.makeWith2] < ii.makeCost2){ canMake = false; }
			if(ii.makeReq != noone && itemInSlot(ii.makeReq) == -1){ canMake = false; }
			if(canMake){
				if(ii.makeWith1 != noone){ mat[ii.makeWith1] -= ii.makeCost1; }
				if(ii.makeWith2 != noone){ mat[ii.makeWith2] -= ii.makeCost2; }
				if(ii.makeReq != noone){
					pc.bag[itemInSlot(ii.makeReq)].item = noone;
				}
				pupSpawn(x, y - 64, getItem(ii.nam));
			}
		}
		
		
	}
	
	
}