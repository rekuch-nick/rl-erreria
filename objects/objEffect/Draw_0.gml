
if(txt != ""){
	draw_set_halign(fa_center);
	draw_text_transformed_color(x, y, txt, txtSize, txtSize, image_angle, txtCol,txtCol, txtCol, txtCol, image_alpha);
	draw_set_halign(fa_left);
}

draw_self();