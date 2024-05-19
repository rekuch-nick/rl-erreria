function playerPassivePower(p){
	n = 0;
	
	for(var i=3; i<=7; i++){
		if(pc.bag[i].item != noone){
			for(var ii=0; ii<array_length(pc.bag[i].item.passive); ii++){
				if(pc.bag[i].item.passive[ii] == p){
					n = max(n, pc.bag[i].item.might);
				}
			}
			
			
		}
	}
	return n;
}