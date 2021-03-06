/// @description Initialize variables

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
two_seconds = 2;
five_seconds = 5;
alarm_off = true;

// Tool Positions
shovel_x = 62;
shovel_y = 23;
seed_x = 62;
seed_y = 32;
wateringcan_x = 110;

// Plot Locations
hole_range1 = 318;
hole_range2 = 320;
last_hole1 = 1077;
last_hole2 = 1079;

// Tool
tool = "shovel";
// tools available include:
// shovel
// seed
// watering can
// none

// Reset
reset = 0;

// Counting Variables
holes_dug = 0;
seeds_planted = 0;
seeds_watered = false;