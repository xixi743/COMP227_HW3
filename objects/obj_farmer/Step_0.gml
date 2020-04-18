/// @description Insert description here

clamp(hole_range1, 318, 1118);
clamp(hole_range2, 320, 1120);

show_debug_message(state);
show_debug_message(obj_watering_can.state);

//show_debug_message(state);

switch (state) {

	case "wait":
	#region Wait State
	
	if holes_dug >= 8 {
		if instance_exists(obj_shovel) {
			instance_create_layer(x+seed_x, y+seed_y, "Tools", obj_seed);
			tool = "seed";
			image_xscale = 5;
			holes_dug = reset;
			state = "plant";
			
	
		}
	}
	
	if seeds_planted > 7 and (x > 199 and x < 201) {
		show_debug_message("stop walking dude");
		set_state_sprite(spr_farmer3_idle, idle_speed, 0);
		hspeed = stop_walking;
		image_xscale = -5;
		seeds_planted = reset;
		obj_seed.state = "stop";
		tool = "none";
		
		room_goto_next();
	}
	
	
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
	
	if tool = "watering can" {
		show_debug_message("hello hello");
		state = "water";
	}
	#endregion
	break;
	
	case "plant":
	#region Plant State
	
	hspeed = walk_backward;
	set_state_sprite(spr_farmer3_walk, walk_speed, 0);
	
	// create seed if it doesn't exist
	if !instance_exists(obj_seed) {
		instance_create_layer(x+seed_x, y+seed_y, "Tools", obj_seed);
	}
	
	if (seeds_planted <= 7) and (x+seed_x >= last_hole1 and x+seed_x <= last_hole2) {
		last_hole1-=100;
		last_hole2-=100;
		seeds_planted++;
		obj_seed.state = "plant";	
	}
	
	if seeds_planted = 8 {
		state = "wait";
	}
	
	#endregion
	break;
	
	case "water":
	#region Water State
	
	show_debug_message("made it to water");
	
	hspeed = walk_forward;
	set_state_sprite(spr_farmer3_walk, walk_speed, 0);
	
	if (x+wateringcan_x >= hole_range1 and x+wateringcan_x <= hole_range2) {
		show_debug_message("got here");
		obj_watering_can.state = "water";
		hole_range1 += 100;
		hole_range2 += 100;
	}
	
	//if x >= 
	#endregion
	break;
}