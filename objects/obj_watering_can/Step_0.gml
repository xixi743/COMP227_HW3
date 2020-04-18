/// @description Insert description here
// You can write your code in this editor

hspeed = obj_farmer.hspeed;

switch (state) {
	case "idle":
	#region Idle
	set_state_sprite(spr_wateringcan, 0, 0);
	#endregion
	break;
	
	case "water":
	#region Water
	set_state_sprite(spr_wateringcan_water, 1, 0);
	
	if animation_end() {
		state = "idle";
		obj_farmer.state = "water";

	}
	#endregion
	break;
}