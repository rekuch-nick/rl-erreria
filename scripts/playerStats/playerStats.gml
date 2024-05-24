function playerStats(){
	
	
	
	jumpsMax = max(1, playerPassivePower(Passive.multijump));
	
	
	jumpPow = -24;
	jumpPow -= playerPassivePower(Passive.highJump);
	
	armor = 0;
	armor += playerPassivePower(Passive.armor);
	armor += playerPassivePower(Passive.armor2);
	
	hpMax = 100;
	hpMax += playerPassivePower(Passive.hpMax);
	
	hurtTimeMax = 20;
	
	mpMax = 20;
	
	mpRegen = 1;
	
	moveSpeed = 10;
	moveSpeed += playerPassivePower(Passive.moveFast);
	
	shine = 2;
	
	digLen = 1;
	digLen += playerPassivePower(Passive.digFar);
	
	mpShield = 0;
	mpShield += playerPassivePower(Passive.mpShield);
	
	hpRegen = 0;
	hpRegen += playerPassivePower(Passive.regen);
	
	jumps = clamp(jumps, 0, jumpsMax);
	hp = clamp(hp, 0, hpMax);
	mp = clamp(mp, 0, mpMax);
}