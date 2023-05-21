/// @description Insert description here
// You can write your code in this editor

party = noone;
encounterControl = noone;
actor = noone;
paused = false;

if (instance_exists(obj_Party)) {
	party = instance_find(obj_Party, 0);
	actor = party.members[0];
	encounterControl = instance_find(con_EncounterController, 0);
}

function setPaused(_bool) {
	paused = _bool;
}
