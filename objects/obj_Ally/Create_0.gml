/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();
image_speed = 0;
image_index = 0;
maxHp = 20;
hp = maxHp;
spirit = 1;
magicGrowth = 3;
level = 1;
spdCounter = 0;
spdCounterLimit = 10;
primed = false;


team = "Ally";
label = "Einart";

attacking = false;
returning = false;

target = noone;
damage = 10;

start_x = x;
start_y = y;


function attack(_Target) {
	attacking = true;
	var t = _Target;
	target = t;
	var path = path_add();
	mp_linear_path(path, t.x - 16, t.y, 5, false);
	path_start(path, 10, path_action_stop, true);
}

function gain_exp(_amount) {
	xp += _amount;
	if (xp >= xpToLevel) {
		level_up();
	}
}

function execute_primed_action() {
	var action = instance_create_layer(x, y, "Instances", primedAction);
	init_action(action);
	action.cast();
	primedAction = noone;
}

function init_action(_action) {
	_action.target = target;
	_action.caster = self;
}