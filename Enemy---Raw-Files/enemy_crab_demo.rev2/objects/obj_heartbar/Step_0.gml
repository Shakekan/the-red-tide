/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7C772BB4
/// @DnDArgument : "code" "///@desc Step - Movement$(13_10)$(13_10)x = obj_player.x;$(13_10)y = obj_player.y - 24;$(13_10)$(13_10)switch(global.hitpoint) {$(13_10)	case 3: sprite_index = spr_heartbar_3; break;$(13_10)	case 2: sprite_index = spr_heartbar_2; break;$(13_10)	case 1: sprite_index = spr_heartbar_1; break;$(13_10)	case 0: sprite_index = spr_heartbar_0; break;$(13_10)}$(13_10)$(13_10)if (global.damageable == false) {$(13_10)	$(13_10)	var_cooldowntimer += delta_time/1000000;$(13_10)	if(var_cooldowntimer >= 3.0) {$(13_10)		global.damageable = true;$(13_10)		var_cooldowntimer = 0.0;$(13_10)	}$(13_10)}$(13_10)	$(13_10)		"
///@desc Step - Movement

x = obj_player.x;
y = obj_player.y - 24;

switch(global.hitpoint) {
	case 3: sprite_index = spr_heartbar_3; break;
	case 2: sprite_index = spr_heartbar_2; break;
	case 1: sprite_index = spr_heartbar_1; break;
	case 0: sprite_index = spr_heartbar_0; break;
}

if (global.damageable == false) {
	
	var_cooldowntimer += delta_time/1000000;
	if(var_cooldowntimer >= 3.0) {
		global.damageable = true;
		var_cooldowntimer = 0.0;
	}
}