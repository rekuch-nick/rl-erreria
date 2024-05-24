function creatureDrawBuff(){
	if(buff[Buff.burn] > 0){ draw_set_alpha(.6); draw_sprite_stretched(imgEffectBurning, irandom_range(0, sprite_get_number(imgEffectBurning)), x-32, y-32, 64, 64); draw_set_alpha(1); }
	if(buff[Buff.poison] > 0){ draw_set_alpha(.6); draw_sprite_stretched(imgEffectPoison, irandom_range(0, sprite_get_number(imgEffectPoison)), x-32, y-32, 64, 64); draw_set_alpha(1); }
}