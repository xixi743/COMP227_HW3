/// @description Shovel Step Event

if obj_farmer.state = "wait" {
	hspeed = obj_farmer.hspeed;
}

if obj_farmer.state = "dig" {
	hspeed = obj_farmer.hspeed;
}

if obj_farmer.state = "walk" {
	hspeed = obj_farmer.hspeed;
}

switch (state) {
	
	case "stop":
	#region STOPPPPPPP
	set_state_sprite(spr_invisible, 0, 0);
	#endregion
	break;
	
	case "idle":
	#region Idle
	set_state_sprite(spr_shovel, 0, 0);
	#endregion
	break;
	
	case "dig":
	#region Dig
	set_state_sprite(spr_shovel_dig, 1, 0);
	
	if animation_hit_frame(2) {
		instance_create_layer(x, y+60, "Plants", obj_hole);
		holes_dug++;
	}
	
	if animation_end() {
		if holes_dug >= 8 {
			obj_farmer.tool = "seed";
			obj_farmer.state = "wait";
			state = "stop";
		} else {
		obj_farmer.state = "walk";
		state = "idle";
		}
	}
	
	
	#endregion
	break;
}