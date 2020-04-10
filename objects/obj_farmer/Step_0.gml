/// @description Insert description here



switch (state) {

	case "wait":
	#region Wait State
	
	set_state_sprite(spr_farmer3_idle, idle_speed, 0);
	hspeed = 0;
	var direction_facing = image_xscale;
	#endregion
	break;
	
	
	case "dig":
	#region Dig State
	// need to find plots to plant seeds
	// then dig a hole for each plot
	
	hspeed = 0;
	set_state_sprite(spr_farmer3_idle, idle_speed, 0);
	
	// create shovel if it doesn't exist
	if !instance_exists(obj_shovel) {
		instance_create_layer(x+shovel_x, y+shovel_y, "Tools", obj_shovel);
		set_state_sprite(spr_farmer3_idle, idle_speed, 0);
	}
	
	// set shovel's state from idle to dig
	// then create a hole right there
	// and some kind of digging animation
	// ^ done in the shovel object
	obj_shovel.state = "dig"
	
	hole_range1 += 100;
	hole_range2 += 100;
	i++;
	state = "walk";
	#endregion
	break;
	
	case "walk":
	#region Walk State
	
	clamp(x, 115, 1060);
	
	set_state_sprite(spr_farmer3_walk, walk_speed, 0);
	
	hspeed = 1;
	
	if (x+shovel_x >= hole_range1 and x+shovel_x <= hole_range2) and (tool = "shovel") {
		state = "dig";
	}
	
	if x >= 1050 {
		hspeed = 0;
		state = "wait";
	}
	

	
	#endregion
	break;
}
