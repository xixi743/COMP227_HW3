/// @description Grow Tomatoes

if room = 5 {
	game_restart();
} else {
	room_goto_next();
	alarm[1] = -1;
}