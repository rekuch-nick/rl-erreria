if(ww.state != State.play){ return; }



if(xSpeed != 0){
	
	for(var i=0; i<abs(ySpeed); i++){
		x += getDir(xSpeed);
		xx += getDir(xSpeed);
		if(pointInBlock(xx, yy)){
			x -= getDir(xSpeed);
			xx -= getDir(xSpeed);
			break;
		}
	}
	
	if(xSpeed < 0){ xSpeed ++; }
	if(xSpeed > 0){ xSpeed --; }
	
}


if( !itemOnGround() ){
	ySpeed = clamp(ySpeed + 1, -128, 128);
} else {
	if(ySpeed > 0){ ySpeed = 0; }
}


if(ySpeed != 0){
	for(var i=0; i<abs(ySpeed); i++){
		y += getDir(ySpeed);
		yy += getDir(ySpeed);
		if(ySpeed < 0 && pointInBlock(xx, yy)){
			y -= getDir(ySpeed);
			yy -= getDir(ySpeed);
			break;
		}
		if(ySpeed > 0 && itemOnGround() ){
			if(bounce > 0){
				bounce --;
				ySpeed = bouncePow;
				bouncePow = floor(bouncePow / 2);
			} else {
				ySpeed = 0;
			}
			break;
		}
	}
}

if(got){
	
	if(mat != noone){
		pc.mat[mat] += amnt;
	} else if(item.canStack && itemInSlot(item.nam) != -1){
		pc.bag[itemInSlot(item.nam)].item.stack += item.stack;
	} else if(!item.canStack && itemInSlot(item.nam) != -1){
		pc.mat[item.matCore] += 1;
	} else if(addShop(sprite_index)) {
	} else {
		var n = itemFreeSlot();
		if(n != -1){
			pc.bag[n].item = item;
		}
	}
	
	var e = instance_create_depth(x, y, ww.layerE, objEffect);
	e.ySpeed = -3;
	e.sprite_index = sprite_index;
	e.fade = .03;
	
	instance_destroy();
	return;
}



if(x > room_width * 2 || x < -room_width ||
	y > room_height * 2 || y < -room_height ){
		
	instance_destroy();
}