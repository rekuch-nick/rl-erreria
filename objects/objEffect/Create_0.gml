image_xscale = 4;
image_yscale = 4;
xSpeed = 0;
ySpeed = 0;
timeCD = 120;
fade = 0;
grav = 0;
txt = "";
txtCol = c_white;
txtSize = 1;
rot = 0;


//xx = pc.xx + (x - pc.x);
//yy = pc.yy + (y - pc.y);
var c = cordScreenToLogic(x, y);
xx = c.a;
yy = c.b;