if(slot == noone && ww.state != State.pause){ return; }
draw_self();
if(item != noone){
	draw_sprite_stretched(item.img, 0, x + 8, y + 8, 64, 64);
	
	if(item.canStack){
		draw_text_transformed(x + 12, y + 56, string(item.stack), .6, .6, 0);
	}
	
}


if(ww.state == State.pause){
	if(xSpot == pc.xICur && ySpot == pc.yICur){
		draw_sprite_stretched(imgItemCursor, ww.inGameSec % 2, x, y, 80, 80);
	}
	
	if(xSpot == pc.xSICur && ySpot == pc.ySICur){
		draw_set_alpha(.3);
		draw_sprite_stretched(imgItemSelected, ww.inGameSec % 2, x, y, 80, 80);
		draw_set_alpha(1);
	}
	
}

