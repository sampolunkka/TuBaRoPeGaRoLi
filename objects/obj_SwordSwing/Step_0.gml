/// @description Insert description here
// You can write your code in this editor

if ( owner != noone) {
	x = owner.x+6;
	y = owner.y+1;

	if (timer < 1) {
		image_index = 0;
		owner.y-=3;
	} else if (timer < 8) {
		if( timer < 3) {
			owner.x+=3;
		} else {
		owner.x+=0.5;
		owner.y++;
		image_index = 1;
		}
	} else if (timer > 20) {
		//owner.x-=0.1;
		alpha-=0.05;
	} else {
		image_index = 2;
	}

	if(alpha < 0) {
		instance_destroy();
	}
	timer++;
}