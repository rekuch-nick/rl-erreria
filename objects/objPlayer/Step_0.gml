playerInput();







if(pressedStart && ww.state == State.play){
	ww.state = State.pause;
} else if(pressedStart && ww.state == State.pause){
	xSICur = -1; ySICur = -1;
	ww.state = State.play;
}

if(pressedMap){
	xMap = clamp(xSpot - (room_width / 8), 0, (ww.W - 337) );
	yMap = clamp(ySpot - (room_height / 8), 0, (ww.H - 192) );
	//if(pc.xSpot > floor(ww.W / 2) ){ xMap = pc.xSpot - floor(ww.W / 2); }
	//xMap = clamp(xSpot - floor(ww.W/2), 0, ww.W - floor(ww.W/2));
	//yMap = clamp(ySpot - floor(ww.H/2), 0, ww.H - floor(ww.H/2));
	ww.state = ww.state == State.map ? State.play : State.map;	
	room_speed = ww.state == State.map ? 10 : 30;
}


if(ww.state == State.pause){ playerStepBag(); }
if(ww.state == State.shop){ playerStepShop(); }
if(ww.state == State.map){ playerStepMap(); }




if(ww.state != State.play){ return; }
inPlayMS ++;
if(inPlayMS >= 30){ inPlayMS = 0; inPlaySec ++; }
if(inPlaySec >= 60){ inPlaySec = 0; inPlayMin ++; }
if(inPlayMin >= 60){ inPlayMin = 0; inPlayHour ++; }

if(inPlayMS == 0){
	mp = clamp(mp + mpRegen, 0, mpMax);
	hp = clamp(hp + hpRegen, 0, hpMax);
	if(buff[Buff.regen]){ hp = clamp(hp + 5, 0, hpMax); }
}


for(var i=0; i<100; i++){
	if(buff[i] > 0){ 
		if(i == Buff.burn){ hp -= .2; }
		if(i == Buff.poison){ hp -= .2; }
		buff[i] --; 
	}
	
	
	
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


if(yPush != 0){
	ySpeed = yPush;
	yPush += getDir(yPush) * -1;
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





if(yIn < 0 && inBounds(xSpot, ySpot) && ww.fmap[xSpot, ySpot] == imgDoor){
	playerLoadShop(ww.fmap[xSpot, ySpot - 1]);
	return;
}


if(actCD > 0){ actCD --; } else {
	var use = noone; var useSlot = -1;
	if(holding1 && bag[0].item != noone){ use = bag[0].item; useSlot = 0; }
	else if(holding2 && bag[1].item != noone){ use = bag[1].item; useSlot = 1; }
	else if(holding3 && bag[2].item != noone){ use = bag[2].item; useSlot = 2; }
	
	if(use != noone){
		
		if(use.action == Use.pick){
			
			///
			var aa = floor(xx / 64) * 64 + 32;
			var bb = floor(yy / 64) * 64 + 32;
			
			for(var i=1; i<=digLen; i++){
				
				aa += (64 * xDirHeld);
				bb += (64 * yDirHeld);
				var c = cordLogicToScreen(aa, bb);
				var aal = c.a; var bbl = c.b;
			
				tempMight = use.might;
				var e = instance_create_depth(aal, bbl, ww.layerE, use.obj);
			}
			
			actCD = use.useCD;
			
		}
		
		if(use.action == Use.swing){
			if(use.mpCost <= 0 || mp >= use.mpCost){
				mp -= use.mpCost;
			
				tempMight = use.might;
				var e = instance_create_depth(x, y, ww.layerE, use.obj);
				if(image_xscale < 0){ e.rot *= -1; }
				if(use.shoot != noone){
					instance_create_depth(x, y, ww.layerE, use.shoot);
				}
				
				actCD = use.useCD;
			}
		}
		
		if(use.action == Use.placeP){
			var aa = floor(xx / 64) * 64 + 32; 
			var bb = floor(yy / 64) * 64 + 32; 
			
			if(yDirHeld < 0){ bb -= 64; } else {
				bb += 64 * 1;
				aa += 64 * getDir(image_xscale);
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


if(xIn != 0){ 
	walkFrameCD --;
	if(walkFrameCD < 1){ 
		walkFrameCD = 6; 
		walkFrame = walkFrame == 1 ? 0 : 1;
	}
	
}

if(pc.hurtTime > 0){ pc.hurtTime --; }


//xx = 672; yy = 384;
playerNFrom();
setSpots(xx, yy);