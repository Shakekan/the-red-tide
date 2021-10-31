/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7FBC0BCF
/// @DnDArgument : "code" "///@desc Step - Enemy Physics$(13_10)$(13_10)//Sprite Directional Changing$(13_10)if (var_movement == 1)$(13_10)	sprite_index = spr_lobster_right;$(13_10)if(var_movement == -1)$(13_10)	sprite_index = spr_lobster_left;$(13_10)$(13_10)//Horizontal Movement$(13_10)var_hspeed = var_movement * var_movespeed;$(13_10)$(13_10)//Gravity - Terminal velocity set to 7 px/frame$(13_10)if(var_vspeed < 7)$(13_10)	var_vspeed += var_gravity;$(13_10)$(13_10)//Ground Collision$(13_10)if (place_meeting(x,y+1,obj_block))$(13_10)	var_vspeed = 0;$(13_10)$(13_10)//Horizontal Collison Check$(13_10)if (place_meeting(x+var_hspeed,y,obj_block)) {$(13_10)	while(!place_meeting(x+sign(var_hspeed),y,obj_block)) {$(13_10)		x += sign(var_hspeed);$(13_10)	}$(13_10)	var_hspeed = 0;$(13_10)	var_movement = -var_movement;$(13_10)}$(13_10)$(13_10)//Vertical Collison Check$(13_10)if (place_meeting(x,y+var_vspeed,obj_block)) {$(13_10)	while(!place_meeting(x,y+sign(var_vspeed),obj_block)) {$(13_10)		y += sign(var_vspeed);$(13_10)	}$(13_10)	var_vspeed = 0;$(13_10)}$(13_10)$(13_10)//Movement$(13_10)x += var_hspeed;$(13_10)y += var_vspeed;$(13_10)$(13_10)//Shooting from Tail$(13_10)if(var_shootable) {$(13_10)	with(instance_create_layer(x+var_tailx,y+var_taily,"Instances",obj_enemybullet)) {$(13_10)		speed = 2;$(13_10)		if(obj_lobster.sprite_index == spr_lobster_left)$(13_10)			direction = 180;$(13_10)		if(obj_lobster.sprite_index == spr_lobster_right)$(13_10)			direction = 0;$(13_10)	}$(13_10)	var_shootable = false;$(13_10)}$(13_10)else {$(13_10)	var_shootingcooldown += delta_time/1000000;$(13_10)	if(var_shootingcooldown >= 3.0) {$(13_10)		var_shootable = true;$(13_10)		var_shootingcooldown = 0.0;$(13_10)	}$(13_10)}$(13_10)	$(13_10)//Bullet Collision$(13_10)if(place_meeting(x,y,obj_bullet)) {$(13_10)	$(13_10)	var_hitpoint -= 1;$(13_10)}$(13_10)$(13_10)//Death$(13_10)if(var_hitpoint <=0) {$(13_10)	//insert death effect here$(13_10)	instance_destroy();$(13_10)}"
///@desc Step - Enemy Physics

//Sprite Directional Changing
if (var_movement == 1)
	sprite_index = spr_lobster_right;
if(var_movement == -1)
	sprite_index = spr_lobster_left;

//Horizontal Movement
var_hspeed = var_movement * var_movespeed;

//Gravity - Terminal velocity set to 7 px/frame
if(var_vspeed < 7)
	var_vspeed += var_gravity;

//Ground Collision
if (place_meeting(x,y+1,obj_block))
	var_vspeed = 0;

//Horizontal Collison Check
if (place_meeting(x+var_hspeed,y,obj_block)) {
	while(!place_meeting(x+sign(var_hspeed),y,obj_block)) {
		x += sign(var_hspeed);
	}
	var_hspeed = 0;
	var_movement = -var_movement;
}

//Vertical Collison Check
if (place_meeting(x,y+var_vspeed,obj_block)) {
	while(!place_meeting(x,y+sign(var_vspeed),obj_block)) {
		y += sign(var_vspeed);
	}
	var_vspeed = 0;
}

//Movement
x += var_hspeed;
y += var_vspeed;

//Shooting from Tail
if(var_shootable) {
	with(instance_create_layer(x+var_tailx,y+var_taily,"Instances",obj_enemybullet)) {
		speed = 2;
		if(obj_lobster.sprite_index == spr_lobster_left)
			direction = 180;
		if(obj_lobster.sprite_index == spr_lobster_right)
			direction = 0;
	}
	var_shootable = false;
}
else {
	var_shootingcooldown += delta_time/1000000;
	if(var_shootingcooldown >= 3.0) {
		var_shootable = true;
		var_shootingcooldown = 0.0;
	}
}
	
//Bullet Collision
if(place_meeting(x,y,obj_bullet)) {
	
	var_hitpoint -= 1;
}

//Death
if(var_hitpoint <=0) {
	//insert death effect here
	instance_destroy();
}