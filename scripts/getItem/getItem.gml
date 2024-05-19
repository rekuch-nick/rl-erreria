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
		desc: "-replace me-",
	}
	
	if(n == "Gel"){
		s.img = imgPupGel;
		s.mat = Mat.gel;
		s.amnt = 1;
	}
	
	if(n == "Wood"){
		s.img = imgPupWood;
		s.mat = Mat.wood;
		s.amnt = 1;
	}
	
	if(n == "Pickaxe"){
		s.img = imgItmPick;
		s.action = Use.pick;
		s.might = 4;
		s.obj = objEffectDig;
		s.useCD = 12;
	}
	
	if(n == "Sword"){
		s.img = imgItmSword;
		s.action = Use.swing;
		s.might = 4;
		s.obj = objEffectSwing;
		s.useCD = 20;
	}
	
	
	if(n == "Hop n Tops"){
		s.img = imgItmHopnTops;
		s.might = 2;
		s.passive = [Passive.multijump];
		s.slotTag = "Boots";
	}
	
	if(n == "Armor"){
		s.img = imgItmArmor;
		s.might = 2;
		s.passive = [Passive.armor];
		s.slotTag = "Armor";
	}
	
	
	
	if(n == "Platform"){
		s.img = imgPupPlatWood;
		s.action = Use.placeP;
		s.obj = imgPlatWood;
		s.useCD = 12;
		s.canStack = true;
		s.consumeOnUse = true;
	}
	
	return s;
}