/// @description Insert description here
// You can write your code in this editor 
event_inherited();
if ( burrowing ) {
	scale_x -= 0.2;
	scale_y -= 0.2;
	y+= 1.2;

	if (scale_x <= 0 || scale_y <= 0) {
		//resolve_turn();
		scale_x = 0;
		scale_y = 0;
		burrowing = false;
		//instance_create_layer(x, y-6, "Instances", obj_BurrowHole);
	}
}

if ( emerging ) {
	scale_x += 0.1;
	scale_y += 0.2;
	y-= 1.2;
	
	if (scale_x >= 1 || scale_y >= 1) {
		scale_x = 1;
		scale_y = 1;
		emerging = false;
	}
}
