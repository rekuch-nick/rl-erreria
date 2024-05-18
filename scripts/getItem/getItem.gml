function getItem(n){
	var s = {
		nam: n,
		img: imgBlank,
		action: noone,
		obj: noone,
		might: 0,
		useCD: 20,
	}
	
	if(n == "Pickaxe"){
		s.img = imgItmPick;
		s.action = Use.pick;
		s.might = 4;
		s.obj = objEffectDig;
		s.useCD = 12;
	}
	
	return s;
}