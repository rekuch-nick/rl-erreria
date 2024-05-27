function houseAt(a, b, signSprite){
	
	bmap[a, b] = noone;
	bmap[a+1, b] = noone;
	bmap[a+2, b] = noone;
	bmap[a, b+1] = noone;
	bmap[a+1, b+1] = noone;
	bmap[a+2, b+1] = noone;
		
	fmap[a, b] = imgHouseRoofLeft;
	fmap[a+1, b] = signSprite;
	fmap[a+2, b] = imgHouseRoofRight;
		
	fmap[a, b+1] = imgHouseLeft;
	fmap[a+1, b+1] = imgDoor;
	fmap[a+2, b+1] = imgHouseRight;

}