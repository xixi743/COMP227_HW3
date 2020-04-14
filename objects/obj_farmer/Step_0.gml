/// @description Insert description here

clamp(hole_range1, 318, 1118);
clamp(hole_range2, 320, 1120);

show_debug_message(state);

switch (state) {

	case "wait":
	#region Wait State
	
	if obj_shovel.holes_dug >= 8 {
		if instance_exists(obj_shovel) {
			instance_create_layer(x+seed_x, y+seed_y, "Tools", obj_seed);
			tool = "seed";
			image_xscale = 5;
			obj_shovel.holes_dug = reset;
			state = "plant";
		}
	}
	
	set_state_sprite(spr_farmer3_idle, idle_speed, 0);
	hspeed = 0;
	#endregion
	break;
	
	
	case "dig":
	#region Dig State
	// need to find plots to plant seeds
	// then dig a hole for each plot
	
	hspeed = 0;
	
	// create shovel if it doesn't exist
	if !instance_exists(obj_shovel) {
		instance_create_layer(x+shovel_x, y+shovel_y, "Tools", obj_shovel);;
	}
	
	// set shovel's state from idle to dig
	// then create a hole right there
	// and some kind of digging animation
	// ^ done in the shovel object
	obj_shovel.state = "dig"
	
	state = "walk";
	
	#endregion
	break;
	
	case "walk":
	#region Walk State
	
	clamp(x, 115, 1060);
	
	set_state_sprite(spr_farmer3_walk, walk_speed, 0);
	
	if tool = "shovel" {
		hspeed = walk_forward;
		if (x+shovel_x >= hole_range1 and x+shovel_x <= hole_range2) {
			hole_range1 += 100;
			hole_range2 += 100;
			state = "dig";
		}
	}
	
	#endregion
	break;
	
	case "plant":
	#region Plant State
	
	hspeed = walk_backward;
	set_state_sprite(spr_farmer3_idle, idle_speed, 0);
	
	// create seed if it doesn't exist
	if !instance_exists(obj_seed) {
		instance_create_layer(x+seed_x, y+seed_y, "Tools", obj_seed);
		show_debug_message("seed should be created");
	}
	
	show_debug_message(obj_seed.x);
	
	if (x+seed_x >= last_hole1 and x+seed_x <= last_hole2) {
		last_hole1-=100;
		last_hole2-=100;
		show_debug_message("reached this point yeeeeeehaw");
		obj_seed.state = "plant";	
	}
	
	#endregion
	break;
}
