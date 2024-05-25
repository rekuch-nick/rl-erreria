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

aim = Aim.snipe;
moveSpeed = 8;
might = 6;

burns = 0;
poisons = 0;