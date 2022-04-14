/// @description Insert description here
// You can write your code in this editor

//INHERITS SELECT
event_inherited();

instLayer = "Instances";
if(BattleControl.orderPhase) {
	targeting = instance_create_layer(x, y, "Menu", obj_Targeting);
	targeting.init(1, "Enemies", self);
}
target = noone;
caster = noone;
active = true;
targetTeam = obj_Enemy;

//STATES
attacking = false;
returning = false;

//POSITION TRACKING
start_x = x;
start_y = y;


label = "Melee Attack";

function cast() {
	x = caster.x;
	y = caster.y;
	targeting_failsafe();
	alarm[0] = 0;
	attacking = true;
	var t = target;
	var path = path_add();
	mp_linear_path(path, t.x - 16, t.y, 5, false);
	path_start(path, 10, path_action_stop, true);
}