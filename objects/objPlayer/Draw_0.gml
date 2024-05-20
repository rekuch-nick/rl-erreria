if(debug){
	draw_set_alpha(.4);
	draw_circle_color(x, y, 48, c_aqua, c_white, false);
	draw_set_alpha(1);
}

var f = 0; image_alpha = 1;
if(pc.hurtTime > 0){ f = 4; image_alpha = random_range(.5, 1); }
image_index = f;

draw_self();

if(debug){
	draw_text(x, y - 60, string(xSpot) + ", " + string(ySpot));
}

//draw_text(x, y - 60, string(jumps));
//draw_text(x, y - 60, string((yy+33) / 64));


if(ww.state == State.pause || ww.state == State.shop){
	draw_sprite_ext(imgScreenBag, 0, 0, 0, 4, 4, 0, c_white, 1);
	
	var aa = 2 * 64 + 32; var bb = 2 * 64 + 32;
	for(var i=0; i<6; i++){
		if(pc.mat[i] > 0){
			draw_sprite_stretched(matImage(i), 0, aa, bb, 64, 64);
			draw_text(aa + 96, bb + 16, string(pc.mat[i]));
			bb += 64;
		}
	}
	
	
	
	
}