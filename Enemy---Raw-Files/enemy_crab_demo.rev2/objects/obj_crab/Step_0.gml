/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 728851B9
/// @DnDArgument : "code" "///@desc Step - Character Physics$(13_10)$(13_10)var_hspeed = var_movement * var_movespeed;$(13_10)$(13_10)//Random Jump$(13_10)//Crab does a random jump every 1/100 steps. $(13_10)if (random(10) >= 9.9)$(13_10)	var_jump = 1;$(13_10)else$(13_10)	var_jump = 0;$(13_10)$(13_10)//Gravity - Terminal velocity set to 7 px/frame$(13_10)if(var_vspeed < 7)$(13_10)	var_vspeed += var_gravity;$(13_10)$(13_10)//Ground Collision$(13_10)if (place_meeting(x,y+1,obj_block))$(13_10)	var_vspeed = var_jump * -var_jumpspeed;$(13_10)$(13_10)//Horizontal Collison$(13_10)if (place_meeting(x+var_hspeed,y,obj_block)) {$(13_10)	while(!place_meeting(x+sign(var_hspeed),y,obj_block)) {$(13_10)		x += sign(var_hspeed);$(13_10)	}$(13_10)	var_hspeed = 0;$(13_10)	var_movement = -var_movement;$(13_10)}$(13_10)$(13_10)//Vertical Collison$(13_10)if (place_meeting(x,y+var_vspeed,obj_block)) {$(13_10)	while(!place_meeting(x,y+sign(var_vspeed),obj_block)) {$(13_10)		y += sign(var_vspeed);$(13_10)	}$(13_10)	var_vspeed = 0;$(13_10)}$(13_10)$(13_10)x += var_hspeed;$(13_10)y += var_vspeed;$(13_10)$(13_10)//Bullet Collision$(13_10)if (place_meeting(x,y,obj_bullet)) {$(13_10)$(13_10)	var_hitpoint -=1;$(13_10)}$(13_10)$(13_10)//Death$(13_10)if (var_hitpoint <=0 )$(13_10)	//insert death effect here$(13_10)	instance_destroy();"
///@desc Step - Character Physics

var_hspeed = var_movement * var_movespeed;

//Random Jump
//Crab does a random jump every 1/100 steps. 
if (random(10) >= 9.9)
	var_jump = 1;
else
	var_jump = 0;

//Gravity - Terminal velocity set to 7 px/frame
if(var_vspeed < 7)
	var_vspeed += var_gravity;

//Ground Collision
if (place_meeting(x,y+1,obj_block))
	var_vspeed = var_jump * -var_jumpspeed;

//Horizontal Collison
if (place_meeting(x+var_hspeed,y,obj_block)) {
	while(!place_meeting(x+sign(var_hspeed),y,obj_block)) {
		x += sign(var_hspeed);
	}
	var_hspeed = 0;
	var_movement = -var_movement;
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

//Bullet Collision
if (place_meeting(x,y,obj_bullet)) {

	var_hitpoint -=1;
}

//Death
if (var_hitpoint <=0 )
	//insert death effect here
	instance_destroy();