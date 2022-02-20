/// @description Insert description here
// You can write your code in this editor
if (attacking) {
	if(target !=noone) {
		//ATTACK ANIMATION
		alarm[1] = 1;
		alarm[0] = 40;
		attacking = false;
		returning = true;
	}
} else if (returning) {
	returning = false;
	resolve_turn();
}