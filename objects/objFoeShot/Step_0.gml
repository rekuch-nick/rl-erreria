if(ww.state != State.play){ return; }
if(firstFrame){
	firstFrame = false;
	
	var xt = xx; var yt = yy;
	
	if(aim == Aim.snipe){ xt = pc.xx; yt = pc.yy; }
	else if(aim == Aim.xSnipe){ xt = pc.xx; }
	else if(aim == Aim.ySnipe){ yt = pc.yy; }
	else if(aim == Aim.close){ xt = pc.xx + irandom_range(-100, 100); yt = pc.yy + irandom_range(-100, 100); }
	else if(aim == Aim.wild){ xt = xx + irandom_range(-100, 100); yt = yy + irandom_range(-100, 100); }
	
	var angle = arctan2(yt - yy, xt - xx);
	xSpeed = cos(angle) * moveSpeed;
	ySpeed = sin(angle) * moveSpeed;
	
	if(lob != 0){ ySpeed = lob; }
}



x += xSpeed;
xx += xSpeed;

y += ySpeed;
yy += ySpeed;

setSpots(xx, yy);
ySpeed = clamp(ySpeed + grav, -64, 64);


if(!passWall && pointInBlock(xx, yy)){ timeCD = 0; }



timeCD --; if(timeCD < 1){
	instance_destroy();
}