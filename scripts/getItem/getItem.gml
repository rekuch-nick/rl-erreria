function getItem(n){
	var s = {
		nam: n,
		img: imgBlank,
		action: noone,
		obj: noone,
		might: 0,
		useCD: 20,
		canStack: false,
		stack: 1,
		consumeOnUse: false,
		mat: noone,
		passive: [],
		slotTag: "",
		desc: "-replace me-.",
		menuUse: noone,
		makeWith1: noone,
		makeWith2: noone,
		makeCost1: 0,
		makeCost2: 0,
		makeReq: noone,
		matCore: Mat.core,
		shoot: noone,
		mpCost: 0,
	}
	
	s.img = n;
	
	
	if(n == "Core"){ s.img = imgPupCore; s.mat = Mat.core; s.amnt = 1; }
	if(n == "Gel"){ s.img = imgPupGel; s.mat = Mat.gel; s.amnt = 1; }
	if(n == "Gold"){ s.img = imgPupGold; s.mat = Mat.gold; s.amnt = 1; }
	if(n == "Mythril"){ s.img = imgPupMythril; s.mat = Mat.mythril; s.amnt = 1; }
	if(n == "Adamantite"){ s.img = imgPupAdamantite; s.mat = Mat.adamantite; s.amnt = 1; }
	if(n == "Wood"){ s.img = imgPupWood; s.mat = Mat.wood; s.amnt = 1; }
	if(n == "Tar"){ s.img = imgPupTarBall; s.mat = Mat.tar; s.amnt = 1; }
	if(n == "Stinger"){ s.img = imgPupStringer; s.mat = Mat.stinger; s.amnt = 1; }
	if(n == "Chip"){ s.img = imgPupChip; s.mat = Mat.chip; s.amnt = 1; }
	if(n == "Gems"){ s.img = imgPupGems; s.mat = Mat.gems; s.amnt = 1; }
	if(n == "Crystal"){ s.img = imgPupCrystal; s.mat = Mat.crystal; s.amnt = 1; }
	
	if(n == "Pickaxe"){
		s.img = imgItmPick;
		s.action = Use.pick;
		s.might = 4;
		s.obj = objEffectDig;
		s.useCD = 12;
		s.desc = "Strike the Earth!\nDig Power: 4";
	}
	
	if(n == "Gold Pickaxe"){
		s.img = imgItmPickGold;
		s.action = Use.pick;
		s.might = 6;
		s.obj = objEffectDig;
		s.useCD = 11;
		s.desc = "Dig Power: 6";
		s.makeWith1 = Mat.gold; s.makeCost1 = 20;
		s.makeReq = "Pickaxe";
	}
	
	if(n == "Mythril Pickaxe"){
		s.img = imgItmPickMythril;
		s.action = Use.pick;
		s.might = 10;
		s.obj = objEffectDig;
		s.useCD = 10;
		s.desc = "Dig Power: 10";
		s.makeWith1 = Mat.mythril; s.makeCost1 = 20;
		s.makeReq = "Gold Pickaxe";
	}
	
	if(n == "Adamantite Pick"){
		s.img = imgItmPickAdamantite;
		s.action = Use.pick;
		s.might = 16;
		s.obj = objEffectDig;
		s.useCD = 9;
		s.desc = "Dig Power: 16";
		s.makeWith1 = Mat.adamantite; s.makeCost1 = 20;
		s.makeReq = "Mythril Pickaxe";
	}
	
	if(n == "Sword"){
		s.img = imgItmSword;
		s.action = Use.swing;
		s.might = 4;
		s.obj = objEffectSwing;
		s.useCD = 20;
		s.desc = "Might: 4";
	}
	
	if(n == "Golden Sword"){
		s.img = imgItmSwordGold;
		s.action = Use.swing;
		s.might = 7;
		s.obj = objEffectSwingGoldSword;
		s.useCD = 19;
		s.desc = "Might: 7";
		s.makeWith1 = Mat.gold; s.makeCost1 = 20;
		s.makeReq = "Sword";
	}
	
	if(n == "Mythril Sword"){
		s.img = imgItmSwordMythril;
		s.action = Use.swing;
		s.might = 11;
		s.obj = objEffectSwingMythrilSword;
		s.useCD = 18;
		s.desc = "Might: 11";
		s.makeWith1 = Mat.mythril; s.makeCost1 = 20;
		s.makeReq = "Golden Sword";
	}
	
	if(n == "Wooden Sword"){
		s.img = imgItmWoodSword;
		s.action = Use.swing;
		s.might = 4;
		s.obj = objEffectSwingWoodSword;
		s.useCD = 16;
		s.desc = "Might: 4";
		s.makeWith1 = Mat.wood; s.makeCost1 = 20;
	}
	
	if(n == "Gel Sword"){
		s.img = imgItmWoodGel;
		s.action = Use.swing;
		s.might = 4;
		s.obj = objEffectSwingSwordGel;
		s.useCD = 15;
		s.desc = "Burns. Might: 4";
		s.makeWith1 = Mat.gel; s.makeCost1 = 20;
		s.makeReq = "Wooden Sword";
	}
	
	
	
	
	if(n == "Wand"){
		s.img = imgItmWand;
		s.action = Use.swing;
		s.might = 4;
		s.obj = objSwingHarmless;
		s.useCD = 10;
		s.shoot = objPCSpark;
		s.makeWith1 = Mat.gold; s.makeCost1 = 20;
		s.mpCost = 1;
	}
	
	
	
	
	
	if(n == "Hop n Tops"){
		s.img = imgItmHopnTops;
		s.might = 2;
		s.passive = [Passive.multijump];
		s.slotTag = "Boots";
		s.desc = "Grants double jump. [Boots]";
		s.makeWith1 = Mat.gems; s.makeCost1 = 10;
		s.makeWith2 = Mat.stinger; s.makeCost2 = 20;
	}
	
	if(n == "Sonic Gear"){
		s.img = imgItmSonicGear;
		s.might = 8;
		s.passive = [Passive.moveFast];
		s.slotTag = "Boots";
		s.desc = "Run super fast. [Boots]";
		s.makeWith1 = Mat.tar; s.makeCost1 = 10;
		s.makeWith2 = Mat.crystal; s.makeCost2 = 10;
	}
	
	if(n == "Miner's Rag"){
		s.img = imgItmBandanna;
		s.might = 1;
		s.passive = [Passive.digFar];
		s.slotTag = "Helm";
		s.desc = "Dig farther. [Helm]";
		s.makeWith1 = Mat.chip; s.makeCost1 = 10;
		s.makeWith2 = Mat.crystal; s.makeCost2 = 10;
	}
	
	if(n == "Shield Drape"){
		s.img = imgItmShieldCape;
		s.might = .5;
		s.passive = [Passive.mpShield];
		s.slotTag = "Cloak";
		s.desc = "Consume MP to prevent 50% damage. [Cloak]";
		s.makeWith1 = Mat.gems; s.makeCost1 = 10;
		s.makeWith2 = Mat.chip; s.makeCost2 = 10;
	}
	
	if(n == "Feather Cap"){
		s.img = imgItmFeatherCap;
		s.might = 6;
		s.passive = [Passive.highJump];
		s.slotTag = "Helm";
		s.desc = "Jump higher. [Helm]";
		s.makeWith1 = Mat.stinger; s.makeCost1 = 10;
		s.makeWith2 = Mat.crystal; s.makeCost2 = 10;
	}
	
	if(n == "Body Ring"){
		s.img = imgItmRing;
		s.might = 40;
		s.passive = [Passive.hpMax];
		s.desc = "+40 Max HP";
		s.makeWith1 = Mat.chip; s.makeCost1 = 10;
		s.makeWith2 = Mat.gems; s.makeCost2 = 10;
	}
	
	if(n == "Armor Ring"){
		s.img = imgItmArmorRing;
		s.might = 2;
		s.passive = [Passive.armor2];
		s.desc = "+2 Armor";
		s.makeWith1 = Mat.chip; s.makeCost1 = 10;
		s.makeWith2 = Mat.gold; s.makeCost2 = 15;
	}
	
	if(n == "Golden Armor"){
		s.img = imgItmArmorGold;
		s.might = 4;
		s.passive = [Passive.armor];
		s.slotTag = "Armor";
		s.desc = "+4 Defence. [Armor]";
		s.makeWith1 = Mat.gold; s.makeCost1 = 20;
	}
	
	if(n == "Mythril Armor"){
		s.img = imgItmArmorMythril;
		s.might = 6;
		s.passive = [Passive.armor];
		s.slotTag = "Armor";
		s.desc = "+6 Defence. [Armor]";
		s.makeWith1 = Mat.mythril; s.makeCost1 = 20;
		s.makeReq = "Golden Armor";
	}
	
	if(n == "Wooden Armor"){
		s.img = imgItmArmor;
		s.might = 2;
		s.passive = [Passive.armor];
		s.slotTag = "Armor";
		s.desc = "+2 Defence. [Armor]";
		s.makeWith1 = Mat.wood; s.makeCost1 = 20;
	}
	
	
	if(n == "Golden Helm"){
		s.img = imgItmHelmGold;
		s.might = 0.1;
		s.passive = [Passive.regen];
		s.slotTag = "Helm";
		s.desc = "Heal over time. [Helm]";
		s.makeWith1 = Mat.gold; s.makeCost1 = 20;
	}
	
	
	
	if(n == "Platform"){
		s.img = imgPupPlatWood;
		s.action = Use.placeP;
		s.obj = imgPlatWood;
		s.useCD = 6;
		s.canStack = true;
		s.consumeOnUse = true;
		s.desc = "Place these to get around.";
		s.makeWith1 = Mat.wood; s.makeCost1 = 2;
		s.stack = 6;
	}
	
	
	if(n == "Throwing Knife"){
		s.img = imgItmDagger;
		s.action = Use.swing;
		s.might = 4;
		s.obj = objPCShot;
		s.useCD = 15;
		s.desc = "Might: 4";
		s.canStack = true;
		s.consumeOnUse = true;
		s.stack = 10;
		s.makeWith1 = Mat.wood; s.makeCost1 = 2;
		s.makeWith2 = Mat.stinger; s.makeCost2 = 2;
	}
	
	if(n == "Bomb"){
		s.img = imgItmBomb;
		s.action = Use.swing;
		s.might = 0;
		s.obj = objPCBomb;
		s.useCD = 20;
		s.desc = "BOOM!";
		s.canStack = true;
		s.consumeOnUse = true;
		s.stack = 4;
		s.makeWith1 = Mat.gel; s.makeCost1 = 4;
		s.makeWith2 = Mat.stinger; s.makeCost2 = 4;
	}
	
	if(n == "Torch"){
		s.img = imgItmTorch;
		s.action = Use.swing;
		s.might = 0;
		s.obj = objPCTorch;
		s.useCD = 20;
		s.desc = "Hot!";
		s.canStack = true;
		s.consumeOnUse = true;
		s.stack = 10;
		s.makeWith1 = Mat.gel; s.makeCost1 = 2;
		s.makeWith2 = Mat.wood; s.makeCost2 = 2;
	}
	
	
	
	
	
	if(n == "Healing Potion"){
		s.img = imgItmPotHealing;
		s.canStack = true;
		s.consumeOnUse = true;
		s.menuUse = Pot.healing;
		s.desc = "Restore 100 HP over 20 seconds.";
		s.makeWith1 = Mat.gel; s.makeCost1 = 4;
		s.makeWith2 = Mat.mythril; s.makeCost2 = 4;
	}
	
	if(n == "Potion of Might"){
		s.img = imgItmPotMight;
		s.canStack = true;
		s.consumeOnUse = true;
		s.menuUse = Pot.might;
		s.desc = "Deal 50% melee damage for 2 minutes.";
		s.makeWith1 = Mat.crystal; s.makeCost1 = 4;
		s.makeWith2 = Mat.chip; s.makeCost2 = 4;
	}
	
	if(n == "Shine Potion"){
		s.img = imgItmPotShine;
		s.canStack = true;
		s.consumeOnUse = true;
		s.menuUse = Pot.shine;
		s.desc = "See through walls.";
		s.makeWith1 = Mat.gems; s.makeCost1 = 4;
		s.makeWith2 = Mat.gel; s.makeCost2 = 4;
	}
	
	if(n == "Stoneskin Potion"){
		s.img = imgItmPotStoneskin;
		s.canStack = true;
		s.consumeOnUse = true;
		s.menuUse = Pot.stoneskin;
		s.desc = "Take half damage from physical attacks.";
		s.makeWith1 = Mat.chip; s.makeCost1 = 4;
		s.makeWith2 = Mat.stinger; s.makeCost2 = 4;
	}
	
	return s;
}