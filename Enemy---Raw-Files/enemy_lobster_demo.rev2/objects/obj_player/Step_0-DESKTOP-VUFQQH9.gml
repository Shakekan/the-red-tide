/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 03063EDA
/// @DnDArgument : "code" "///@desc Step - Character Physics$(13_10)$(13_10)//Keycheck$(13_10)var_keycheck_right = keyboard_check(vk_right) || keyboard_check(ord("D"));$(13_10)var_keycheck_left = -(keyboard_check(vk_left) || keyboard_check(ord("A")));$(13_10)var_keycheck_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));$(13_10)$(13_10)/* Checks for direction of movement. Returns 1 if moving right, returns -1 if moving left.$(13_10)	Returns 0 for no movement. */$(13_10)var_movement = var_keycheck_right + var_keycheck_left;$(13_10)if (var_movement == 1)$(13_10)	sprite_index = spr_player_right;$(13_10)if(var_movement == -1)$(13_10)	sprite_index = spr_player_left;$(13_10)var_hspeed = var_movement * var_movespeed;$(13_10)$(13_10)//Gravity - Terminal velocity set to 7 px/frame$(13_10)if(var_vspeed < 7)$(13_10)	var_vspeed += var_gravity;$(13_10)$(13_10)//Ground Collision$(13_10)if (place_meeting(x,y+1,obj_block))$(13_10)	var_vspeed = var_keycheck_jump * -var_jumpspeed;$(13_10)$(13_10)//Horizontal Collison$(13_10)if (place_meeting(x+var_hspeed,y,obj_block)) {$(13_10)	while(!place_meeting(x+sign(var_hspeed),y,obj_block)) {$(13_10)		x += sign(var_hspeed);$(13_10)	}$(13_10)	var_hspeed = 0;$(13_10)}$(13_10)$(13_10)//Vertical Collison$(13_10)if (place_meeting(x,y+var_vspeed,obj_block)) {$(13_10)	while(!place_meeting(x,y+sign(var_vspeed),obj_block)) {$(13_10)		y += sign(var_vspeed);$(13_10)	}$(13_10)	var_vspeed = 0;$(13_10)}$(13_10)$(13_10)x += var_hspeed;$(13_10)y += var_vspeed;$(13_10)$(13_10)//Enemy Collision$(13_10)if (place_meeting(x,y,obj_lobster)) {$(13_10)	$(13_10)	if(global.damageable==true) {$(13_10)		//insert character damage animation here///$(13_10)		$(13_10)		global.hitpoint -=1;$(13_10)		global.damageable = false;$(13_10)	}$(13_10)}$(13_10)$(13_10)//Basic Shooting for Testing$(13_10)if(keyboard_check_pressed(ord("F")) && global.hitpoint > 0) {$(13_10)	with(instance_create_layer(x,y,"Instances",obj_bullet)) {$(13_10)		speed = 4;$(13_10)		if(obj_player.sprite_index == spr_player_left)$(13_10)			direction = 180;$(13_10)		if(obj_player.sprite_index == spr_player_right)$(13_10)			direction = 0;$(13_10)	}$(13_10)}$(13_10)$(13_10)///////Health Testing$(13_10)// P for -1 health, O for full health$(13_10)if (keyboard_check_pressed(ord("P")) && global.hitpoint > 0) {$(13_10)	obj_hpbar.sprite_index = spr_hpbar_effect;$(13_10)	global.hitpoint -= 1;$(13_10)}$(13_10)if (keyboard_check_pressed(ord("O")))$(13_10)	global.hitpoint = 7;"
///@desc Step - Character Physics

//Keycheck
var_keycheck_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var_keycheck_left = -(keyboard_check(vk_left) || keyboard_check(ord("A")));
var_keycheck_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));

/* Checks for direction of movement. Returns 1 if moving right, returns -1 if moving left.
	Returns 0 for no movement. */
var_movement = var_keycheck_right + var_keycheck_left;
if (var_movement == 1)
	sprite_index = spr_player_right;
if(var_movement == -1)
	sprite_index = spr_player_left;
var_hspeed = var_movement * var_movespeed;

//Gravity - Terminal velocity set to 7 px/frame
if(var_vspeed < 7)
	var_vspeed += var_gravity;

//Ground Collision
if (place_meeting(x,y+1,obj_block))
	var_vspeed = var_keycheck_jump * -var_jumpspeed;

//Horizontal Collison
if (place_meeting(x+var_hspeed,y,obj_block)) {
	while(!place_meeting(x+sign(var_hspeed),y,obj_block)) {
		x += sign(var_hspeed);
	}
	var_hspeed = 0;
}

//Vertical Collison
if (place_meeting(x,y+var_vspeed,obj_block)) {
	while(!place_meeting(x,y+sign(var_vspeed),obj_block)) {
		y += sign(var_vspeed);
	}
	var_vspeed = 0;
}

x += var_hspeed;
y += var_vspeed;

//Enemy Collision
if (place_meeting(x,y,obj_lobster)) {
	
	if(global.damageable==true) {
		//insert character damage animation here///
		
		global.hitpoint -=1;
		global.damageable = false;
	}
}

//Basic Shooting for Testing
if(keyboard_check_pressed(ord("F")) && global.hitpoint > 0) {
	with(instance_create_layer(x,y,"Instances",obj_bullet)) {
		speed = 4;
		if(obj_player.sprite_index == spr_player_left)
			direction = 180;
		if(obj_player.sprite_index == spr_player_right)
			direction = 0;
	}
}

///////Health Testing
// P for -1 health, O for full health
if (keyboard_check_pressed(ord("P")) && global.hitpoint > 0) {
	obj_hpbar.sprite_index = spr_hpbar_effect;
	global.hitpoint -= 1;
}
if (keyboard_check_pressed(ord("O")))
	global.hitpoint = 7;/**/