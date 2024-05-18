if(ww.state != State.play){ return; }
image_alpha = random_range(0, 1);
image_angle = choose(0, 90, 180, -90);
if(timeCD == 1){
	instance_create_depth(x, y, ww.layerM, mob);
}

event_inherited();