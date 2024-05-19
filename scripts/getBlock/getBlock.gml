function getBlock(i){
	if(i == imgBlockDirt){ return { 
		img: imgBlockDirt, dam: 0, fra: choose(1, 0), 
		con: noone, damMax: 10, minMight: 1, 
	} }
	
	if(i == imgBlockGrass){ return { 
		img: imgBlockGrass, dam: 0, fra: choose(1, 0), 
		con: noone, damMax: 10, minMight: 1, 
	} }
	
	if(i == imgBlockDirtRock){ return { 
		img: imgBlockDirtRock, dam: 0, fra: choose(1, 0), 
		con: noone, damMax: 20, minMight: 1, 
	} }
	
	if(i == imgBlockRock){ return { 
		img: imgBlockRock, dam: 0, fra: choose(1, 0), 
		con: noone, damMax: 20, minMight: 1, 
	} }
	
	
	
	
	if(i == imgBlockSlime){ return { 
		img: imgBlockSlime, dam: 0, fra: choose(1, 0), 
		con: getItem("Gel"), damMax: 10, minMight: 1, 
	} }
	
	
	
	
	if(i == imgBlockDirtUnbreakable){ return { 
		img: imgBlockDirtUnbreakable, dam: 0, fra: 0, 
		con: noone, damMax: -1, minMight: 1000,
	} }
	
	if(i == imgBlockLava){ return { 
		img: imgBlockLava, dam: 0, fra: 0, 
		con: noone, damMax: -1, minMight: 1000,
	} }
	
	
	
	
	
}