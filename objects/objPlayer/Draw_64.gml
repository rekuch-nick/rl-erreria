



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
			if(sItm[i].makeReq != noone){
				draw_sprite_stretched(getItem(sItm[i].makeReq).img, 0, 1020, 130 + (i * 160), 64, 64);
			}
		}
	}
	
	draw_sprite_stretched(imgShopCur, inPlaySec % 2, 820, 94 + (cur * 160), 32, 32);
}


if(ww.state == State.map){
	
	
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	
	
	
	for(var a=0; a<ww.W; a++){ for(var b=0; b<ww.H; b++){
		var c = c_black;
		var cc = noone;
		
		if(!debug && !ww.vmap[a, b]){ continue; }
		
		if(ww.bgmap[a, b] == imgBGSky){ c = c_blue; }
		
		if(ww.bmap[a, b] != noone){ 
			c = c_dkgray;
		
			if(ww.bmap[a, b].img == imgBlockChest){ c = c_lime; }
			
			//if(ww.bmap[a, b].img == imgBlockRock){ c = c_dkgray; }
			
			if(ww.bmap[a, b].img == imgBlockLava){ c = c_maroon; }
			
			if(ww.bmap[a, b].img == imgBlockGold){ cc = c_yellow; }
			if(ww.bmap[a, b].img == imgBlockMythril){ cc = c_aqua; }
			if(ww.bmap[a, b].img == imgBlockAdamantite){ cc = c_fuchsia; }
			
			if(ww.bmap[a, b].img == imgBlockSlime){ cc = c_green; }
			if(ww.bmap[a, b].img == imgBlockDirtEgg){ cc = c_grey; }
			
			
		}
		
		if(ww.fmap[a, b] == imgJar ){ cc = c_grey; }
		
		if(ww.fmap[a, b] == imgDoor || 
			ww.fmap[a, b] == imgHouseLeft ||
			ww.fmap[a, b] == imgHouseRight ||
			ww.fmap[a, b] == imgHouseRoofLeft ||
			ww.fmap[a, b] == imgHouseRoofRight ||
			(b < ww.H-1 && ww.fmap[a, b+1] == imgDoor)
			){ c = c_red; cc = c_black; }
		
		if(pc.xSpot == a && pc.ySpot == b){
			c = ww.inGameMS % 2 == 1 ? c_white : c_aqua;
		}
		
		var aP = a - xMap;
		var bP = b - yMap;
		
		if(aP < 0 || bP < 0 || aP > 336 || bP > 192){ continue; }
		
		draw_rectangle_color((aP)*4, (bP)*4, (aP)*4 + 3, (bP)*4 + 3, c, c, c, c, 0);
		if(cc != noone){ draw_rectangle_color((aP)*4+1, (bP)*4+1, (aP)*4 + 2, (bP)*4 + 2, cc, cc, cc, cc, 0); }
	}}
	
	c = ww.inGameMS % 2 == 1 ? c_white : c_aqua;
	draw_rectangle_color((xSpot - xMap)*4-4, (ySpot - yMap)*4-4, (xSpot - xMap)*4 + 3+4, (ySpot - yMap)*4 + 3+4, c, c, c, c, true);
	
	//if(debug){ draw_text(4, 4, string(xMap) + ", " + string(yMap)); }
}
	


