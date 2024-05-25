if(ww.state != State.play){ return; }
if(firstFrame){
	firstFrame = false;
	
	var xt = xx; var yt = yy;
	
	if(aim == Aim.pcFace){ xt += 500 * pc.image_xscale; }
	else if(aim == Aim.pcHold){ xt += 100 * pc.xDirHeld; yt += 100 * pc.yDirHeld; }
	
	
	var angle = arctan2(yt - yy, xt - xx);
	xSpeed = cos(angle) * moveSpeed;
	ySpeed = sin(angle) * moveSpeed;
	
	ySpeed = lob;
}



x += xSpeed;
xx += xSpeed;

y += ySpeed;
yy += ySpeed;

setSpots(xx, yy);
ySpeed = clamp(ySpeed + grav, -64, 64);
image_angle += rot;

if(xGrav > 0){
	xSpeed = clamp(xSpeed + getDir(xSpeed), -xGravMax, xGravMax);
}

if(!passWall && pointInBlock(xx, yy)){ timeCD = 0; }



timeCD --; if(timeCD < 1){
	
	
	if(object_index == objPCBomb){
		for(var a=xSpot-3; a<=xSpot+3; a++){
			for(var b=ySpot-3; b<=ySpot+3; b++){
				var dis = abs(a - xSpot) + abs(b - ySpot);
				if(dis > 3){ continue; }
				if(dis > 2 && roll(50)){ continue; }
				var c = cordLogicToScreen(a * 64 + 32, b * 64 + 32);
				instance_create_depth(c.a, c.b, ww.layerE, objEffectBlast);
			}
		}
	}
	
	
	
	
	
	
	
	instance_destroy();
}