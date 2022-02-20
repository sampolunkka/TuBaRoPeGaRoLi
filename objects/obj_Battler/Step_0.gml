/// @description Insert description here
// You can write your code in this editor
if (flashAlpha > 0 ) {
	flashAlpha-=0.2;
}

/*
if (turnStartMove) {
	if (x < start_x + 4) {
		x++;
	} else {
		turnStartMove = false;
	}
}

if (turnEndMove) {
	if (x > start_x) {
		x--;
	} else if (x < start_x) {
		x++;
	} else {
		turnEndMove = false;
	}
}
*/

if (xp >= xpToLevel) {
	level_up();
}
if (hp <=0) {
	instance_destroy();
}