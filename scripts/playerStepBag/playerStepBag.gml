function playerStepBag(){
	
	if(xHoldTime > 12){ xHoldTime = 1; }
	if(yHoldTime > 12){ yHoldTime = 1; }
	
	if(xIn != 0 && xHoldTime == 1){
		xICur += xIn;
		if(xICur < 0){ xICur = 7; }
		if(xICur > 7){ xICur = 0; }
	}
	
	if(yIn != 0 && yHoldTime == 1){
		yICur += yIn;
		if(yICur < 0){ yICur = 7; }
		if(yICur > 7){ yICur = 0; }
	}
	
	if(pressedJump){
		
		if(xSICur == -1){
			var si = getObjectAtSpot(objItemSlot, xICur, yICur);
			if(si != noone){
				selectedItem = getObjectAtSpot(objItemSlot, xICur, yICur);
				xSICur = xICur;
				ySICur = yICur;
			}
		} else {
			if( (yICur != 0 ) ||
						(xICur <= 2 && selectedItem.item.action != noone) ||
						(xICur >= 3 && array_length(selectedItem.item.passive) > 0) ){
			
				var si = getObjectAtSpot(objItemSlot, xICur, yICur);
				var i1 = si.item;
				si.item = selectedItem.item;
				selectedItem.item = i1;
			}
			
			
			xSICur = -1; ySICur = -1;
			playerStats();
		}
	}
	
	if(pressed1){
		if(xSICur == -1){
			
		} else {
			xSICur = -1; ySICur = -1;
		}
	}
	
}