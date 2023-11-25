/// @description Insert description here
// You can write your code in this editor


turnController = instance_create_layer(0, 0, "Control", con_TurnController);
menuController = instance_create_layer(0, 0, "Control", con_MenuController);
enemyController = instance_create_layer(0, 0, "Control", con_EnemyController);

enum Phase {
	AllyOrders = 0,
	EnemyOrders = 1,
	Actions = 2,
	Cleanup = 3,
}

enum Team {
	Ally = obj_Ally,
	Enemy = obj_Enemy,
}

// Current phase
phase = Phase.Cleanup;

allies = array_create(1, noone);
enemies = array_create(1, noone);

function init_turn() {
	turnController.init_turn();
}

function advance_phase() {
	phase++;
	if (phase > Phase.Cleanup) {
		phase = 0;
	}
}

function get_allies() {
	get_team_battlers(Team.Ally, allies);
}

function get_enemies() {
	get_team_battlers(Team.Enemy, enemies);
}

function get_team_battlers(_team, _battlers) {
	var n = instance_number(_team);
	_battlers = array_create(n, noone);
	for (var i=0; i<n; i++) {
		team[i] = instance_find(_team, i);
	}
}
