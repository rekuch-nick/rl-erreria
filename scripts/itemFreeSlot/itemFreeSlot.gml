function itemFreeSlot(){
	for(var i=8; i<64; i++){
		if(pc.bag[i].item == noone){ return i; }
	}
	return -1;
}