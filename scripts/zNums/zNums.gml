function zNums(){
	enum State {
		title, play, gen, pause, shop, map,
	}
	
	enum Use {
		pick, shoot, placeB, placeP, swing,
	}
	
	enum Biome {
		surface, sky, home,
		cave, midCave, deepCave, lavaCave,
		slime, purp, specs, lice,
	}
	
	enum Mat {
		wood, gel, stinger,
		gold, mythril, adamantite,
		crystal, tar, chip, gems,
		core,
		
	}
	
	enum Slot {
		f2, f3, f4, a1, a2, a3, a4, a5,
	}
	
	enum Ele {
		melee, ranged, bump,
		magic,
	}
	
	enum Passive {
		multijump, armor, moveFast, regen, digFar, mpShield, highJump, hpMax, armor2, 
		thorns,
	}
	
	enum Pot {
		healing, stoneskin, might, shine, thorns,
	}
	
	enum Buff {
		burn, poison, stun,
		dark,
		regen, stoneskin, might, shine, thorns,
	}
	
	enum Aim {
		snipe, xSnipe, ySnipe, wild, close, 
	}
}