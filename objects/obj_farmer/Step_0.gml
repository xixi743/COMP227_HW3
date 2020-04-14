/// @description Insert description here

clamp(hole_range1, 318, 1118);
clamp(hole_range2, 320, 1120);

show_debug_message(state);
show_debug_message(tool);

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
	
	if tool = "seed" {
		hspeed = walk_backward;
		
		if seeds_planted = 0 {
			if (x+seed_x >= last_hole1 and x+seed_x <= last_hole2) {
				hole_range1 -= 100;
				hole_range2 -= 100;
				state = "plant";
			}
		}
		
		if (x+seed_x >= hole_range1 and x+seed_x <= hole_range2) {
			hole_range1 -= 100;
			hole_range2 -= 100;
			state = "plant";
		}
	}
	
	#endregion
	break;
	
	case "plant":
	#region Plant State
	
	hspeed = 0;
	set_state_sprite(spr_farmer3_idle, idle_speed, 0);
	
	// create seed if it doesn't exist
	if !instance_exists(obj_seed) {
		instance_create_layer(x+seed_x, y+seed_y, "Tools", obj_seed);
		show_debug_message("seed should be created");
	}
	
	if obj_seed.x 
	
	// set shovel's state from idle to dig
	// then create a hole right there
	// and some kind of digging animation
	// ^ done in the shovel object
	obj_seed.state = "plant";

	state = "walk";
	
	#endregion
	break;
}
