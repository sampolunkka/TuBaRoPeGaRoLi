// You can write your code in this editor
globalvar BattleControl;
globalvar activeBattler;
BattleControl = self;
activeBattler = noone;
globalvar lastHit;
lastHit = noone;

// MENU
// Stack for navigating Battle menu
menuStack = ds_stack_create();

// active menu layer
menu = noone;
menu = instance_create_layer(0, 0, "Menu", obj_Menu);
ds_stack_push(menuStack, menu);

// TURN QUEUE
turnQueue = ds_priority_create();
turnArray = array_create(10, noone);

alarm[0] = 1;


//NEW BATTLE CONFIG//
// Phases
orderPhase = true;
enemyPhase = false;
actionPhase = false;
betweenTurns = false;
/*
with (instance_create_layer(50, 44, "Instances", obj_Einart)) {
	label = "Einari";
	HealthBar = instance_create_layer(0, 100,"GUI", obj_HealthBar);
	HealthBar.set_owner(self);
}

with (instance_create_layer(80, 84, "Instances", obj_Deina)) {
	label = "Arwiel";
	HealthBar = instance_create_layer(0, 100,"GUI", obj_HealthBar);
	HealthBar.set_owner(self);
}
*/

function init_turn() {
	var n = instance_number(obj_Battler);
	//show_message(string(n) + " battlers found");
	for ( var i = 0; i < n; i++ ) {
		var battler = instance_find(obj_Battler, i);
		//show_message(string(battler.id) + " is battler" );
		ds_priority_add(turnQueue, battler, battler.spd);
	}
	turnArray = array_create(n, noone);
	var temp = ds_priority_create();
	ds_priority_copy(temp, turnQueue);
	for(var i = 0; i < n;  i++;) {
		turnArray[i] = ds_priority_find_max(temp);
		ds_priority_delete_max(temp);
	}
	ds_priority_destroy(temp);
	orderPhase = true;
}

function find_nonprimed_battler(_teamObject) {
	var n = instance_number(_teamObject);
	for (var i = 0; i < n; i++) {
		var battler = instance_find(_teamObject, i);
		if( battler.primedAction == noone ) {
			menu.active = true;
			return battler;
		}
	}
	return noone;
}

function remake_turn_array() {
	var n = ds_priority_size(turnQueue);
	if (n < 1) {
		turnArray = noone;
		return;
	}
	turnArray = array_create(n, noone);
	var temp = ds_priority_create();
	ds_priority_copy(temp, turnQueue);
	for(var i = 0; i < n;  i++;) {
		turnArray[i] = ds_priority_find_max(temp);
		ds_priority_delete_max(temp);
	}
	ds_priority_destroy(temp);
}


function get_menu_instance() {
	return menu;
}


//CALLS SELECT on current menu step
// if selection is valid
// 1. Deactivates the current menu step
// 2. Pushes selection to the menu stack
// 3. Instance of the selection is then created
function menu_select(_menu) {
	if (_menu.active = true) {
		var selection = _menu.select();
		if (selection > -4) {
			ds_stack_top(menuStack).active = false;
			ds_stack_push(menuStack, selection)
			instance_create_layer(x, y, "SubMenu", selection);
		}
	}
}

function menu_backtrack(_menu) {
	if (_menu.active = true) {
		if (ds_stack_size(menuStack) > 1) {
			var menuStep  = ds_stack_pop(menuStack);
			instance_destroy(menuStep);
			ds_stack_top(menuStack).active = true;
		}
	}
}

function menu_stack_reset() {
	while(ds_stack_size(menuStack) > 1) {
		instance_destroy(ds_stack_pop(menuStack));
	}
}