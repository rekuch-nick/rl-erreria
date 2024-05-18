image_xscale = 4; image_yscale = 4;
xx = 672; yy = 384;
xx = 200 * 64; yy = 42 * 64;
playerNFrom();
playerInput();
setSpots(xx, yy);

canDebug = true;
debug = false;


xDirHeld = 0;
yDirHeld = 0;

ySpeed = 0;
jumps = 0;
jumpsMax = 2;
jumpPow = -24;

hp = 100;
hpMax = 100;

mp = 0;
mpMax = 20;

active1 = 0;
active2 = 0;
active3 = 0;
for(var i=0; i<200; i++){
	bag[i] = noone;
}
actCD = 0;

bag[0] = getItem("Pickaxe");

for(var i=0; i<100; i++){
	mat[i] = 0;
}