playerInput();







if(pressedStart && ww.state == State.play){
	ww.state = State.pause;
} else if(pressedStart && ww.state == State.pause){
	ww.state = State.play;
}








if(ww.state != State.play){ return; }

xSpeed = 0;
if(xIn != 0){ xSpeed = 10 * getDir(xIn); }
if(debug){ xSpeed *= 4; }
var xMoved = 0;
for(var i=0; i<abs(xSpeed); i++){
	xx += getDir(xSpeed);
	xMoved += getDir(xSpeed);
	if(playerInBlock()){
		xx -= getDir(xSpeed);
		xMoved -= getDir(xSpeed);
		break;
	}
}

if(xIn > 0 && image_xscale < 0){ image_xscale *= -1; }
if(xIn < 0 && image_xscale > 0){ image_xscale *= -1; }


if(!debug){

	if(playerOnGround()){
		jumps = jumpsMax;
		if(ySpeed > 0){ ySpeed = 0; }
	} else {
		ySpeed = clamp(ySpeed + 1, -64, 64);
		if(jumps >= jumpsMax){ jumps --; }
	}

	if(pressedJump && jumps > 0){
		ySpeed = jumpPow;
		jumps --;
	}

	if(ySpeed < 0 && !holdingJump){ ySpeed = 0; }
	
} else {
	ySpeed = yIn * 40;
}



var yMoved = 0;
for(var i=0; i<abs(ySpeed); i++){
	yy += getDir(ySpeed);
	yMoved += getDir(ySpeed);
	if(getDir(ySpeed) < 0 && playerInBlock() ){
		yy -= getDir(ySpeed);
		yMoved -= getDir(ySpeed);
		break;
	}
	if(getDir(ySpeed) > 0 && playerOnGround() ){
		break;
	}
}



moveEverything(xMoved, yMoved);




if(actCD > 0){ actCD --; } else {
	var use = noone;
	if(holding1 && bag[active1] != noone){ use = bag[active1]; }
	else if(holding2 && bag[active2] != noone){ use = bag[active2]; }
	else if(holding3 && bag[active3] != noone){ use = bag[active3]; }
	
	if(use != noone){
		if(use.action == Use.pick){
			
			var aa = floor(xx / 64) * 64 + 32; 
			var bb = floor(yy / 64) * 64 + 32; 
			aa += 64 * xDirHeld;
			bb += 64 * yDirHeld;
			var c = cordLogicToScreen(aa, bb);
			aa = c.a; bb = c.b;
			
			tempMight = use.might;
			var e = instance_create_depth(aa, bb, ww.layerE, use.obj);
			
			actCD = use.useCD;
		}
		
		
	}
	
	
}



//xx = 672; yy = 384;
playerNFrom();
setSpots(xx, yy);