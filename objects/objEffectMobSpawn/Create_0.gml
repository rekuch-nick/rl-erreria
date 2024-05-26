event_inherited();
var c = cordScreenToLogic(x, y);
xx = c.a;
yy = c.b;

setSpots(xx, yy);

xB = floor(xSpot / 50);
yB = floor(ySpot / 50);

mob = objMobSlime;

if(ww.biome[xB, yB] == Biome.cave){
	mob = objMobBee;
}

if(ww.biome[xB, yB] == Biome.purp){
	mob = objMobSlimePurp;
}


if(ww.biome[xB, yB] == Biome.specs){
	mob = objMobCrab;
}


if(ww.biome[xB, yB] == Biome.deepCave){
	mob = objMobCrasher;
}

if(ww.biome[xB, yB] == Biome.crystal){
	mob = objMobShadowMage;
}

