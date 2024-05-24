function buffImage(i){
	if(i == Buff.regen){ return imgItmPotHealing; }
	if(i == Buff.might){ return imgItmPotMight; }
	if(i == Buff.shine){ return imgItmPotShine; }
	if(i == Buff.stoneskin){ return imgItmPotStoneskin; }
	
	
	if(i == Buff.burn){ return imgIconBurning; }
	if(i == Buff.poison){ return imgIconPoison; }
	//if(i == Buff.stoneskin){ return imgItmPotStoneskin; }
	
	return imgBlank;
}