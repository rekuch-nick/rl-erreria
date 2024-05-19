function pupSpawn(aa, bb, itm){
	
	var e = instance_create_depth(aa, bb, ww.layerP, objPup);
	e.item = itm;
	e.mat = itm.mat;
	e.sprite_index = itm.img;

}