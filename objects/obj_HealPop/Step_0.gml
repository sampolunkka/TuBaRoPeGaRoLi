/// @description Insert description here
// You can write your code in this editor

if(timer > 30) {
	alpha-=0.15;
}
timer++;

if (alpha <= 0) {
	instance_destroy();
}

spde = 0.1 * (spd / ( timer + 1 ));
y-=spde;