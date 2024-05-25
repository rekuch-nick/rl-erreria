image_xscale = 4;
image_yscale = 4;
scroll = true;

var c = cordScreenToLogic(x, y);
xx = c.a;
yy = c.b;

setSpots(xx, yy);

passWall = false;

xSpeed = 0;
ySpeed = 0;
grav = 0;
lob = 0;
firstFrame = true;
timeCD = 300;

aim = Aim.pcFace;
moveSpeed = 8;
might = pc.tempMight;

burns = 0;
poisons = 0;

mobsHit = [];
breakOnHit = false;
rot = getDir(pc.image_xscale) * 25;

xGrav = 1;
xGravMax = 20;

push = 10;

burnChance = 0;
burnPow = 0;

poisonChance = 0;
poisonPow = 0;