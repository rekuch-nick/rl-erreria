image_xscale = 4;
image_yscale = 4;

dir = choose(1, -1);
ySpeed = 0; xSpeed = 0;
grav = 1;

moveSpeed = 3;
jumpPow = -20;

thinkCD = 0; 

thinkCDMax = 30 * 5;

huntOnThink = 0;
jumpOnThink = 0;
turnOnThink = 0;

turnOnBump = 0;
jumpOnBumb = 0;

jumpAnytime = 0;

jumpInAir = 0;

jumpReverse = 0;

pushMod = 1;
xPush = 0;

hurtTime = 0;

hp = 10;
hpMax = 10;
armor = 0;

bumpMight = 6;
bumpBurns = 0;
bumpPoisons = 0;

dropChance = 0;
drop = noone;

shotKind = noone;
shotCDMax = 150; shotCD = shotCDMax;
clusterMax = 0; cluster = clusterMax; clusterCD = 10;



for(var i=0; i<10; i++){
	buff[i] = 0;
}

var c = cordScreenToLogic(x, y);
xx = c.a;
yy = c.b;

setSpots(xx, yy);

