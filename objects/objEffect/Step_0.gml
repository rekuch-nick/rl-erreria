

x += xSpeed;
y += ySpeed;
ySpeed += grav;

image_angle += rot;
image_alpha -= fade;

timeCD --;
if(timeCD < 1 || image_alpha < 0){
	instance_destroy();
}