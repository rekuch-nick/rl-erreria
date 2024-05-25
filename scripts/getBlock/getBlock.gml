function getBlock(i){
	if(i == imgBlockDirt){ return { 
		img: i, dam: 0, fra: choose(1, 0), 
		con: noone, damMax: 10, minMight: 1, 
	} }
	
	if(i == imgBlockGrass){ return { 
		img: i, dam: 0, fra: choose(1, 0), 
		con: noone, damMax: 10, minMight: 1, 
	} }
	
	if(i == imgBlockWood){ return { 
		img: i, dam: 0, fra: choose(1, 0), 
		con: getItem("Wood"), damMax: 10, minMight: 1, 
	} }
	
	if(i == imgBlockDirtRock){ return { 
		img: i, dam: 0, fra: choose(1, 0), 
		con: noone, damMax: 40, minMight: 1, 
	} }
	
	if(i == imgBlockRock){ return { 
		img: i, dam: 0, fra: choose(1, 0), 
		con: noone, damMax: 20, minMight: 1, 
	} }
	
	
	if(i == imgBlockChest){ return { 
		img: i, dam: 0, fra: 0, 
		con: getItem(rollChest()), damMax: 20, minMight: 1, 
	} }
	
	
	if(i == imgBlockSlime){ return { 
		img: i, dam: 0, fra: choose(1, 0), 
		con: getItem("Gel"), damMax: 10, minMight: 1, 
	} }
	
	if(i == imgBlockGold){ return { 
		img: i, dam: 0, fra: choose(1, 0), 
		con: getItem("Gold"), damMax: 10, minMight: 1, 
	} }
	
	if(i == imgBlockMythril){ return { 
		img: i, dam: 0, fra: choose(1, 0), 
		con: getItem("Mythril"), damMax: 20, minMight: 1, 
	} }
	
	if(i == imgBlockAdamantite){ return { 
		img: i, dam: 0, fra: choose(1, 0), 
		con: getItem("Adamantite"), damMax: 40, minMight: 1, 
	} }
	
	
	
	
	if(i == imgBlockDirtUnbreakable || i == imgBlockSky ){ return { 
		img: i, dam: 0, fra: 0, 
		con: noone, damMax: -1, minMight: 1000,
	} }
	
	if(i == imgBlockLava){ return { 
		img: i, dam: 0, fra: 0, 
		con: noone, damMax: -1, minMight: 1000,
	} }
	
	if(i == imgBlockDirtEgg){ return { 
		img: i, dam:0, fra: irandom_range(0, sprite_get_number(i) - 1),
		con: objMobEggLice, damMax: 15, minMight: 1,
	} }
	
	return {
		img: i, dam:0, fra: irandom_range(0, sprite_get_number(i) - 1),
		con: noone, damMax: 10, minMight: 1,
	}
	
}