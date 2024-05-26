

var x1 = clamp(pc.xSpot - 12, 0, W-1);
var x2 = clamp(x1 + 24, 0, W-1);
var y1 = clamp(pc.ySpot - 8, 0, H-1);
var y2 = clamp(y1 + 16, 0, H-1);


for(var a=x1; a<=x2; a++){
	for(var b=y1; b<=y2; b++){
		
		var aa = 0 + (a * 64) - pc.xFrom;
		var bb = 0 + (b * 64) - pc.yFrom;
		
		if(!vmap[a, b]){
			var vv = 1;
			if(pc.buff[Buff.shine] > 0){ vv = 3; }
			//if adjacent block has vmap = true & that block is null, set vmap = true
			for(var aaa=a-vv; aaa<=a+vv; aaa++){ for(var bbb=b-vv; bbb<=b+vv; bbb++){
				if(inBounds(aaa, bbb)){
					if(abs(pc.xSpot - a) < pc.shine && abs(pc.ySpot - b) < pc.shine){ vmap[a, b] = true; }
					
					if(vmap[aaa, bbb] && bmap[aaa, bbb] == noone){
						vmap[a, b] = true; break;
					}
				}
			}}
			
		}
		
		if(!vmap[a, b]){ continue; }	
			
		if(bgmap[a, b] != noone){
			var i = (a + b) % sprite_get_number(bgmap[a, b]);
			draw_sprite_stretched(bgmap[a, b], i, aa, bb, 64, 64);
		}
		
		if(fmap[a, b] != noone){
			var n = 0;
			if(fmap[a, b] == imgFeatVine){ n = (a + b) % 2; }
			draw_sprite_ext(fmap[a, b], n, aa, bb, 4, 4, 0, c_white, 1);
		}
		
		
		if(pmap[a, b] != noone){
			draw_sprite_stretched(pmap[a, b], 0, aa, bb, 64, 64);
		}
		
		
		if(bmap[a, b] != noone){
			
			
			
			var t = bmap[a, b];
			
			
			
			draw_sprite_stretched(t.img, t.fra, aa, bb, 64, 64);
			
			
			if(t.dam > 0){
				var f = floor((t.dam / t.damMax) * 6);
				draw_sprite_stretched(imgBlockCrack, f, aa, bb, 64, 64);
			}
			//draw_text(aa, bb, t.dam);
			
		}
		
		if(pc.debug){
			//draw_text(aa, bb, biome[floor(a / BW), floor(b / BH)]);
			//draw_text(aa, bb, string(floor(a / BW)) + ", " + string(floor(b / BH)) );
			if(a % BW == 0){ draw_rectangle(aa, bb, aa+4, bb+64, true); }
			if(b % BH == 0){ draw_rectangle(aa, bb, aa+64, bb+4, true); }
				
		}
		
		
	}
}