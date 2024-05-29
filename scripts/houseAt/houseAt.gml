function houseAt(a, b, signSprite){
	
	ww.bmap[a, b] = noone;
	ww.bmap[a+1, b] = noone;
	ww.bmap[a+2, b] = noone;
	ww.bmap[a, b+1] = noone;
	ww.bmap[a+1, b+1] = noone;
	ww.bmap[a+2, b+1] = noone;
		
	ww.fmap[a, b] = imgHouseRoofLeft;
	ww.fmap[a+1, b] = signSprite;
	ww.fmap[a+2, b] = imgHouseRoofRight;
		
	ww.fmap[a, b+1] = imgHouseLeft;
	ww.fmap[a+1, b+1] = imgDoor;
	ww.fmap[a+2, b+1] = imgHouseRight;

}