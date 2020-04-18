/// @description Insert description here
// You can write your code in this editor

hspeed = obj_farmer.hspeed;

switch (state) {
	case "stop":
	#region Stop
	set_state_sprite(spr_invisible, 0, 0);
	#endregion
	break;
	
	case "idle":
	#region Idle
	set_state_sprite(spr_seedling, 0, 0);
	#endregion
	break;
	
	case "plant":
	#region plant
	set_state_sprite(spr_seed_drop, 1, 0);
	
	obj_farmer.state = "plant";
	
	if animation_end() {
		obj_farmer.state = "plant";
		state = "idle";
	}
	#endregion
	break;
}