function playerUsePot(p){
	
	if(p == Pot.healing){
		pc.buff[Buff.regen] = 30 * 20;
	}
	
	
	if(p == Pot.might){
		pc.buff[Buff.might] = 30 * 120;
	}
	
	
	if(p == Pot.stoneskin){
		pc.buff[Buff.stoneskin] = 30 * 120;
	}
}