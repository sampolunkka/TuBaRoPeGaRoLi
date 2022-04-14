/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spd = 1;
damage = 0;
attacking = false;
returning = false;
target = noone;
start_x = x;
start_y = y;
team = "Enemy";
label = "Dummy";
step = 0;
expReward = 2;
hp = 100000000;

function attack(_Target) {
	attacking = true;
	var t = _Target;
	target = t;
	var path = path_add();
	mp_linear_path(path, t.x + 16, t.y, 5, false);
	path_start(path, 10, path_action_stop, true);
}

function decide_action() {
	primedAction = self;
}

function cast() {
	primedAction = noone;
	event_user(15);
}

function execute_primed_action() {
	event_user(15);
	primedAction = noone;
}