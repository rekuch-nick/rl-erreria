function moveEverything(a, b){
	
	with(objEffect){ 
		if(!scroll){ continue; }
		x -= a; y -= b; 
	}
	with(objMob){ x -= a; y -= b; }
	with(objPup){ x -= a; y -= b; }
	
	
}