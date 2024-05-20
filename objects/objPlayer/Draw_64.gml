



if(ww.state == State.pause){
	
	
	var i = getObjectAtSpot(objItemSlot, xICur, yICur).item;
	if(i != noone){
		var aa = 64 * 9 + 48;
		var bb = yICur > 3 ? 0: 360;
		draw_rectangle_color(aa, bb, aa + 640, bb + 64 * 4 + 24, c_black, c_black, c_black, c_black, false);
		//draw_text(aa + 4, bb + 4, i.desc);
		draw_text_ext(aa + 4, bb + 4, i.desc, 30, 620);
	}
	
	
}

if(ww.state == State.shop){
	draw_sprite_ext(imgScreenShop, 0, 0, 0, 4, 4, 0, c_white, 1);
	
	for(var i=0; i<array_length(sTxt); i++){
		draw_text(850, 100 + (i * 160), sTxt[i]);
		if(sItm[i] != noone){
			if(sItm[i].makeWith1 != noone){
				draw_sprite_stretched(matImage(sItm[i].makeWith1), 0, 850, 130 + (i * 160), 64, 64);
				draw_text(930, 150 + (i * 160), sItm[i].makeCost1);
			}
			if(sItm[i].makeWith2 != noone){
				draw_sprite_stretched(matImage(sItm[i].makeWith2), 0, 1020, 130 + (i * 160), 64, 64);
				draw_text(1100, 150 + (i * 160), sItm[i].makeCost2);
			}
		}
	}
	
	draw_sprite_stretched(imgShopCur, inPlaySec % 2, 820, 94 + (cur * 160), 32, 32);
}
