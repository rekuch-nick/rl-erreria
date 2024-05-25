function getConsumable(){
	//pupSpawn(c.a, c.b, getItem(choose("Platform", "Healing Potion", "Potion of Might", "Shine Potion", "Stoneskin Potion")));
	return getItem( choose(
		"Platform", 
		"Healing Potion", "Potion of Might", "Shine Potion", "Stoneskin Potion",
		"Throwing Knife", "Bomb", "Torch",
	
	));
}