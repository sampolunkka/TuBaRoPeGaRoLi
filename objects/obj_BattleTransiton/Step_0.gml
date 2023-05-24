/// @description Insert description here
// You can write your code in this editor

if (fadingOut) {
	alpha -= 1/fadeOut;
	if (alpha <= 0) {
		instance_destroy();
	}
}