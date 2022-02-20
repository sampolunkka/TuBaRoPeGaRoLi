/// @description Insert description here
// You can write your code in this editor
if (casting) {
	timer++;
	if (timer >= 45) {
		if (target != noone) {
			target.flashColour = c_white;
			target.flashAlpha = 0.4;
			timer = 39;
		}
	}
	y+=0.1;
}