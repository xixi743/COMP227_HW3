/// @description Insert description here
// You can write your code in this editor

if obj_farmer.tool = "seed" {
	
	if obj_farmer.state = "wait" {
		hspeed = obj_farmer.hspeed;
	}

	if obj_farmer.state = "plant" {
		hspeed = obj_farmer.hspeed;
	}

	if obj_farmer.state = "walk" {
		hspeed = obj_farmer.hspeed;
	}

}

switch (state) {
	case "idle":
	#region Idle
	set_state_sprite(spr_seedling, 0, 0);
	#endregion
	break;
	
	case "plant":
	#region plant
	set_state_sprite(spr_seed_drop, 1, 0);
	
	//if animation_hit_frame(2) {
	//	instance_create_layer(x, y+60, "Plants", obj_hole);
	//	holes_dug++;
	//}
	
	if animation_end() {
		obj_farmer.state = "walk";
		state = "idle";
	}
	#endregion
	break;
}