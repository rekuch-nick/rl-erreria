if(debug){
	draw_set_alpha(.4);
	draw_circle_color(x, y, 48, c_aqua, c_white, false);
	draw_set_alpha(1);
}
draw_self();

if(debug){
	draw_text(x, y - 60, string(xSpot) + ", " + string(ySpot));
}

//draw_text(x, y - 60, string(jumps));
//draw_text(x, y - 60, string((yy+33) / 64));


if(ww.state == State.pause){
	draw_sprite_ext(imgScreenBag, 0, 0, 0, 4, 4, 0, c_white, 1);
	draw_sprite_stretched(imgPupWood, 0, 2 * 64 + 32, 2 * 64 + 32, 64, 64);
	draw_text(4 * 64, 2 * 64 + 48, string(pc.mat[Mat.wood]));
	
	draw_sprite_stretched(imgPupGel, 0, 2 * 64 + 32, 3 * 64 + 32, 64, 64);
	draw_text(4 * 64, 3 * 64 + 48, string(pc.mat[Mat.gel]));
}