function damageCreature(c, pow, tags){
	if(is_undefined(tags)){ tags = []; }
	
	
	pow = clamp(pow - c.armor, 1, pow);
	
	c.hp -= pow;
	c.hurtTime = 20;
}