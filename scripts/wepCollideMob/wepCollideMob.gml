function wepCollideMob(o){
	
	
	
	if(arrayContains(mobsHit, o)){ return; }

	mobsHit[array_length(mobsHit)] = o;

	o.xPush = getDir(o.xx - xx) * (push * o.pushMod);
	//o.xPush = getDir(o.xx - pc.xx) * (push * o.pushMod);



	var mm = might;
	if(pc.buff[Buff.might] > 0){ mm = ceil(mm * 1.5); }



	damageCreature(o, mm);
	if(roll(burnChance)){ buffCreature(o, Buff.burn, burnPow); }
	if(roll(poisonChance)){ buffCreature(o, Buff.poison, poisonPow); }
	
	
	if(breakOnHit){ timeCD = 0; }
}