function buffCreature(c, buf, val){
	try {
		c.buff[buf] = max(c.buff[buf], val);
	} catch (e) { }
}