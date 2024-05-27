image_xscale = 4; image_yscale = 4;
xx = 672; yy = 384;
xx = 200 * 64; yy = 82 * 64;
xx = floor(ww.W / 2) * 64;
playerNFrom();
playerInput();
setSpots(xx, yy);
//xSpotFirst = xSpot; ySpotFirst = ySpot;

inPlayMS = 0;
inPlaySec = 0;
inPlayMin = 0;
inPlayHour = 0;

canDebug = true;
debug = false;


xDirHeld = 0;
yDirHeld = 0;

ySpeed = 0;
jumps = 0;
jumpsMax = 1;
jumpPow = -24;
yPush = 0;

hp = 100;
hpMax = 100;

mp = 0;
mpMax = 20;


var aa = room_width - (80 * 9);
var bb = 0;

xICur = 0; yICur = 1;
xSICur = -1; ySICur = -1;
xHoldTime = 0; yHoldTime = 0;

onRope = false;

hud = instance_create_depth(0, 0, -1000, objBars);
for(var i=0; i<64; i++){
	bag[i] = instance_create_depth(aa, bb, -1000, objItemSlot);
	if(i == 0){ bag[i].slot = Slot.f2; bag[i].image_index = 1; }
	else if(i == 1){ bag[i].slot = Slot.f2; bag[i].image_index = 2; }
	else if(i == 2){ bag[i].slot = Slot.f3; bag[i].image_index = 3; }
	else if(i == 3){ bag[i].slot = Slot.a1; bag[i].image_index = 4; }
	else if(i == 4){ bag[i].slot = Slot.a2; bag[i].image_index = 4; }
	else if(i == 5){ bag[i].slot = Slot.a3; bag[i].image_index = 4; }
	else if(i == 6){ bag[i].slot = Slot.a4; bag[i].image_index = 4; }
	else if(i == 7){ bag[i].slot = Slot.a5; bag[i].image_index = 4; }
	
	bag[i].xSpot = floor( (aa - (room_width - (80 * 9)) ) / 80 );
	bag[i].ySpot = floor( bb / 80 );
	
	
	aa += 80;
	if(aa >= room_width - 80){ aa-= 80 * 8; bb += 80; }
}
actCD = 0;

bag[0].item = getItem("Sword");
bag[1].item = getItem("Pickaxe");
//bag[2].item = getItem("Platform"); bag[2].item.stack = 2;
//bag[2].item = getItem("Throwing Knife"); bag[2].item.stack = 20;
//bag[2].item = getItem("Bomb"); bag[2].item.stack = 20;

//bag[8].item = getItem("Wand");
//bag[9].item = getItem("Armor");
//bag[10].item = getItem("Sonic Gear");
//bag[11].item = getItem("Body Ring");
//bag[12].item = getItem("Mythril Sword");


for(var i=0; i<100; i++){
	mat[i] = 0;
	buff[i] = 0;
}
//mat[Mat.wood] = 100;
//mat[Mat.gold] = 100;
//mat[Mat.mythril] = 100;
//mat[Mat.adamantite] = 100;


hurtTime = 0;

walkFrame = 0;
walkFrameCD = 1;


playerStats();
