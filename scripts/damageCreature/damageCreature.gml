function damageCreature(c, pow){
	
	
	
	pow = clamp(pow - c.armor, 1, pow);
	
	if(c.object_index == objPlayer){
		if(pc.buff[Buff.stoneskin] > 0){ pow = ceil(pow / 2); }
		
		if(pc.mpShield > 0){
			var mpBlockMax = pow * pc.mpShield;
			while(pc.mp > 0 && pow > 0 && mpBlockMax > 0){
				pc.mp --;
				pow --;
				mpBlockMax --;
			}
		}
	}
	
	if(pow > 0){
		var e = instance_create_depth(c.x, c.y - 48, ww.layerE, objEffect);
		e.txt = string(pow);
		e.ySpeed = -2;
		e.fade = .05;
		if(c.object_index == objPlayer){e.txtCol = c_red; }
	}
	
	c.hp -= pow;
	c.hurtTime = 20;
	
}