function playerStats(){
	
	
	
	jumpsMax = max(1, playerPassivePower(Passive.multijump));
	
	
	jumpPow = -24;
	
	
	armor = 0;
	
	hpMax = 100;

	
	hurtTimeMax = 20;
	
	mpMax = 20;
	
	mpRegen = 1;
	
	jumps = clamp(jumps, 0, jumpsMax);
	hp = clamp(hp, 0, hpMax);
	mp = clamp(mp, 0, mpMax);
}