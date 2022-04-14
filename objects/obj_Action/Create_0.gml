depth = 0;
targetTeam = obj_Battler;
label = "Action";

function select() {
	active = false;
	target = targeting.target;
	caster = activeBattler;
	caster.target = target;
	caster.prime_action(object_index);
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