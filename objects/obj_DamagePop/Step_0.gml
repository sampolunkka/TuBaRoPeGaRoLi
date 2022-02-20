/// @description Insert description here
// You can write your code in this editor

if(timer > 30) {
	alpha-=0.15;
}
timer++;

if (alpha <= 0) {
	instance_destroy();
}

spde = spd / ( timer + 1 );
move_towards_point(move_x, move_y, spde);
y+=timer*0.02;