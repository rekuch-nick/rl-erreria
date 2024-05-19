if(ww.state != State.play){ return; }







thinkCD --; if(thinkCD < 1){
	thinkCD = thinkCDMax;
	
	if(roll(turnOnThink)){ dir *= -1; }
	if(roll(jumpOnThink) && (creatureOnGround() || roll(jumpInAir)) ){ ySpeed = jumpPow; }
	if(roll(huntOnThink)){ 
		if(xx > pc.xx){ dir = -1; }
		if(xx < pc.xx){ dir = 1; }
	}
	
}




var bump = false;
xSpeed = moveSpeed * dir;
if(xPush != 0){
	xSpeed = xPush;
	if(xPush > 0){ xPush --; }
	if(xPush < 0){ xPush ++; }
	if(abs(xPush) < 1){ xPush = 0; }
}
for(var i=0; i<abs(xSpeed); i++){
	xx += getDir(xSpeed);
	x += getDir(xSpeed);
	if(creatureInBlock()){
		xx -= getDir(xSpeed);
		x -= getDir(xSpeed);
		bump = true;
		break;
	}
}

if(bump){
	if(roll(jumpOnBumb) && (creatureOnGround() || roll(jumpInAir)) ){ ySpeed = jumpPow; }
	else if(roll(turnOnBump)){ dir *= -1; }
}





if(roll(jumpAnytime) && (creatureOnGround() || roll(jumpInAir)) ){ ySpeed = jumpPow; }


if(creatureOnGround()){
	if(ySpeed > 0){ ySpeed = 0; }
} else {
	ySpeed = clamp(ySpeed + grav, -64, 64);
}



for(var i=0; i<abs(ySpeed); i++){
	yy += getDir(ySpeed);
	y += getDir(ySpeed);
	if(getDir(ySpeed) < 0 && creatureInBlock() ){
		yy -= getDir(ySpeed);
		y -= getDir(ySpeed);
		break;
	}
	if(getDir(ySpeed) > 0 && creatureOnGround() ){
		break;
	}
}






if(dir < 0 && image_xscale > 0){ image_xscale *= -1; }
if(dir > 0 && image_xscale < 0){ image_xscale *= -1; }

if(hurtTime > 0){ hurtTime --; }


setSpots(xx, yy);

if(x > room_width * 2 || x < -room_width ||
	y > room_height * 2 || y < -room_height ){
		
	instance_destroy();
}

if(hp < 1){
	
	instance_destroy();
	if(drop != noone && roll(dropChance)){
		pupSpawn(x, y, drop);
	}
}
