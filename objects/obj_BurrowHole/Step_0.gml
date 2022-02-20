/// @description Insert description here
// You can write your code in this editor
if (timer >= 100) {
	alpha-=0.1;
	if (alpha <= 0) {
		instance_destroy();
	}
}
timer++;