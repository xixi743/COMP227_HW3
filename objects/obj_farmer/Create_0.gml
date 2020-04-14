/// @description Insert description here
// You can write your code in this editor


// Finite State Machine
state = "wait";

// Animation Speeds
walk_speed = 1;
idle_speed = 1;

// Walking
walk_forward = 1;
walk_backward = -1;
stop_walking = 0;

// Alarms
framerate = 60;
seconds_to_wait = 2;
alarm[0] = framerate * seconds_to_wait;

// Tool Positions
shovel_x = 62;
shovel_y = 23;
seed_x = 62;
seed_y = 32;

// Plot Locations
hole_range1 = 318;
hole_range2 = 320;
last_hole1 = 1110;
last_hole2 = 1130;

// Tool
tool = "shovel";
// tool available include
// shovel
// seed
// none

// Reset
reset = 0;


seeds_planted = 0;