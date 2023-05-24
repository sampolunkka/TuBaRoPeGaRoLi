/// @description Insert description here
// You can write your code in this editor
encounters = array_create(0, noone);
battleCounter = 100;

function tick() {
	battleCounter--;
	if (battleCounter <= 0) {
		self.trigger();
	}
}

function trigger(_encounter) {
	var transition = instance_create_depth(0, 0, 0, obj_BattleTransiton);
}

function get_encounters() {
	return encounters;
}

function set_ecounters(_encounters) {
	self.encounters = _encounters;
}