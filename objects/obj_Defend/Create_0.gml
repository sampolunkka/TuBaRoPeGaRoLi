/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
targeting = instance_create_layer(x, y, "Menu", obj_Targeting);
targeting.init(1, "Self", self);

label = "Defend";
active = true;

depth = 0;
targetTeam = obj_Ally;
function select() {
	active = false;
	target = targeting.target;
	source = activeBattler;
	source.target = target;
	source.prime_action(object_index);
	instance_destroy(targeting);
	activeBattler = noone;
}

function targeting_failsafe() {
	if ( !instance_exists(target) ) {
		target = instance_find(targetTeam, 0);
	}
}

function cast() {
}

