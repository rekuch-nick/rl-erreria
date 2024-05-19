function playerInput(){
	
	gamepadID = 0;
	var gp_num = gamepad_get_device_count();
	for (var i = 0; i < gp_num; i++;) {
		if gamepad_is_connected(i) {
			gamepadID = i;
		}
	}
	
	pressedStart = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape) ||
					gamepad_button_check_pressed(gamepadID, gp_start);
	
	
	xIn = 0;
	yIn = 0;
	
	
	if(keyboard_check(vk_left) || keyboard_check(ord("A")) ||
								gamepad_button_check(gamepadID, gp_padl) || 
								gamepad_axis_value(gamepadID, gp_axislh) < -.5 ){
		xIn --;
		facing = -1;
	}
	
	if(keyboard_check(vk_right) || keyboard_check(ord("D")) ||
								gamepad_button_check(gamepadID, gp_padr) || 
								gamepad_axis_value(gamepadID, gp_axislh) > .5 ){
	
		xIn ++;
		facing = 1;
	}
	
	if(keyboard_check(vk_down) || keyboard_check(ord("S")) ||
								gamepad_button_check(gamepadID, gp_padd) || 
								gamepad_axis_value(gamepadID, gp_axislv) > .5 ){
		yIn ++;
	}
	
	if(keyboard_check(vk_up) || keyboard_check(ord("W")) ||
								gamepad_button_check(gamepadID, gp_padu) || 
								gamepad_axis_value(gamepadID, gp_axislv) < -.5 ){
		yIn --;
	}
	
	
	if(xIn == 0){ xHoldTime = 0; } else { xHoldTime ++; }
	if(yIn == 0){ yHoldTime = 0; } else { yHoldTime ++; }
	
	
	
	//
	holdingJump = keyboard_check(vk_space) || gamepad_button_check(gamepadID, gp_face1);
	pressedJump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(gamepadID, gp_face1);
	
	
	
	
	
	holding1 = keyboard_check(ord("1")) || gamepad_button_check(gamepadID, gp_face2);
	pressed1 = keyboard_check_pressed(ord("1")) || gamepad_button_check_pressed(gamepadID, gp_face2);
	
	holding2 = keyboard_check(ord("2")) || gamepad_button_check(gamepadID, gp_face3);
	pressed2 = keyboard_check_pressed(ord("2")) || gamepad_button_check_pressed(gamepadID, gp_face3);
	
	holding3 = keyboard_check(ord("3")) || gamepad_button_check(gamepadID, gp_face4);
	pressed3 = keyboard_check_pressed(ord("3")) || gamepad_button_check_pressed(gamepadID, gp_face4);
	
	
	
	if(!holding1 && !holding2 && !holding3){
		xDirHeld = 0; yDirHeld = 0;
	} else {
		if(xDirHeld == 0 && yDirHeld == 0){
			yDirHeld = yIn;
			if(xIn != 0){ xDirHeld = xIn; } 
			else if(yIn == 0){ xDirHeld = getDir(image_xscale); }
			else{xDirHeld = 0;}
		}
	}
	
	
	
	if(keyboard_check_pressed(vk_backspace) && canDebug){ debug = !debug; }
}