function playerLoadShop(s){
	
	
	ww.state = State.shop;
	cur = 0;
	
	
	
	for(var i=0; i<array_length(ww.shop[s]) - 1; i++){
		sTxt[i] = ww.shop[s][i].nam;
		sItm[i] = ww.shop[s][i];
	}
	
	sTxt[array_length(ww.shop[s]) - 1] = "Exit"; 
	sItm[array_length(ww.shop[s]) - 1] = noone;
}