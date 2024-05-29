function addShop(ii){
	
	if(ii == imgBookGel){
		houseAt(ww.xHome + 4, ww.yHome + 5, imgHouseSignGel);
		
		ww.gotBookGel = true;
		return true;	
	}
	
	
	if(ii == imgBookGold){
		houseAt(ww.xHome + 16, ww.yHome + 5, imgHouseSignGoldsmith);
		
		ww.gotBookGold = true;
		return true;	
	}
	
	
	return false;
}




