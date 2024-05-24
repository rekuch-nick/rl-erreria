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
	
	c.hp -= pow;
	c.hurtTime = 20;
	
}