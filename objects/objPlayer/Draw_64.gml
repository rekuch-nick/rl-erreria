



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


if(ww.state == State.map){
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	
	for(var a=0; a<ww.W; a++){ for(var b=0; b<ww.H; b++){
		var c = c_black;
		if(ww.bmap[a, b] != noone){ 
			c = c_orange;
		
			if(ww.bmap[a, b].img == imgDoor || ww.bmap[a, b].img == imgBlockChest){
				c = c_lime;
			}
			if(ww.fmap[a, b] == imgJar ){
				c = c_grey;
			}
		}
		
		if(pc.xSpot == a && pc.ySpot == b){
			c = c_white;
			if(ww.inGameMS % 2 == 1){ c = c_aqua; }
		}
		
		draw_rectangle_color(a*2, b*2, a*2 + 1, b*2 + 1, c, c, c, c, 0);
	}}
	
	
}
	


