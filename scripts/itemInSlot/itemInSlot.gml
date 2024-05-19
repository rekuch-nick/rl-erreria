function itemInSlot(val){
	
	for(var i=0; i<64; i++){
		if(pc.bag[i].item != noone && pc.bag[i].item.nam == val){
			return i;
		}
	}
	
	return -1;
}