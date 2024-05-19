playerInput();







if(pressedStart && ww.state == State.play){
	ww.state = State.pause;
} else if(pressedStart && ww.state == State.pause){
	ww.state = State.play;
}



if(ww.state == State.pause){ playerStepBag(); }




if(ww.state != State.play){ return; }
inPlayMS ++;
if(inPlayMS >= 30){ inPlayMS = 0; inPlaySec ++; }
if(inPlaySec >= 60){ inPlaySec = 0; inPlayMin ++; }
if(inPlayMin >= 60){ inPlayMin = 0; inPlayHour ++; }

if(inPlayMS == 0){
	mp = clamp(mp + mpRegen, 0, mpMax);
}



xSpeed = 0;
if(xIn != 0){ xSpeed = moveSpeed * getDir(xIn); }
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
	var use = noone; var useSlot = -1;
	if(holding1 && bag[0].item != noone){ use = bag[0].item; useSlot = 0; }
	else if(holding2 && bag[1].item != noone){ use = bag[1].item; useSlot = 1; }
	else if(holding3 && bag[2].item != noone){ use = bag[2].item; useSlot = 2; }
	
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
		
		if(use.action == Use.swing){
			tempMight = use.might;
			var e = instance_create_depth(x, y, ww.layerE, use.obj);
			if(image_xscale < 0){ e.rot *= -1; }
			actCD = use.useCD;
		}
		
		if(use.action == Use.placeP){
			var aa = floor(xx / 64) * 64 + 32; 
			var bb = floor(yy / 64) * 64 + 32; 
			aa += 64 * getDir(image_xscale);
			if(yDirHeld < 0){ bb -= 64; } else {
				bb += 64 * 1;
			}
			
			var c = cordLogicToScreen(aa, bb);
			//aa = c.a; bb = c.b;
			
			var xt = floor(aa/64); var yt = floor(bb/64);
			if(inBounds(xt, yt) && ww.pmap[xt, yt] == noone && ww.bmap[xt, yt] == noone){
				ww.pmap[xt, yt] = use.obj;
				actCD = use.useCD;
			}
		}
		
		
		if(actCD > 0){ // the item was used
			if(use.consumeOnUse){
				use.stack --;
				if(use.stack < 1){
					bag[useSlot].item = noone;
				}
			}
		}
		
	}
	
	
}



if(pc.hurtTime > 0){ pc.hurtTime --; }


//xx = 672; yy = 384;
playerNFrom();
setSpots(xx, yy);