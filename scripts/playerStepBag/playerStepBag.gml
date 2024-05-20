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
		
		if(xICur == xSICur && yICur == ySICur){
			var si = getObjectAtSpot(objItemSlot, xICur, yICur).item;
			if(si.menuUse != noone){
				playerUsePot(si.menuUse);
				
				if(si.consumeOnUse){
					si.stack --;
					if(si.stack < 1){
						getObjectAtSpot(objItemSlot, xICur, yICur).item = noone;
					}
				}
			}
			
			xSICur = -1; ySICur = -1;
			playerStats();
		} else if(xSICur == -1){
			var si = getObjectAtSpot(objItemSlot, xICur, yICur);
			//if(si != noone){
				selectedItem = getObjectAtSpot(objItemSlot, xICur, yICur);
				xSICur = xICur;
				ySICur = yICur;
			//}
		} else {
			
			bag2 = [];
			for(var i=0; i<64; i++){
				bag2[i] = bag[i].item;
			}
			
			
			
			var si = getObjectAtSpot(objItemSlot, xICur, yICur);
			var i1 = si.item;
			si.item = selectedItem.item;
			selectedItem.item = i1;
			
			var illegal = false;
			for(var i=0; i<3; i++){
				if(bag[i].item != noone && bag[i].item.action == noone){ illegal = true; }
			}
			for(var i=3; i<8; i++){
				if(bag[i].item != noone && array_length(bag[i].item.passive) < 1){ illegal = true; }
			}
			tags = [];
			for(var i=3; i<8; i++){
				if(bag[i].item != noone && bag[i].item.slotTag != ""){
					if(arrayContains(tags, bag[i].item.slotTag)){
						illegal = true; break;
					} else {
						tags[array_length(tags)] = bag[i].item.slotTag;
					}
				}
			}
			
			
			if(illegal){
				for(var i=0; i<64; i++){
					bag[i].item = bag2[i];
				}
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