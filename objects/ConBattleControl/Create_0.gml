// You can write your code in this editor
globalvar BattleControl;
globalvar activeBattler;
BattleControl = self;
activeBattler = noone;
globalvar lastHit;
lastHit = noone;

//turnQueue = ds_queue_create();
turnArray = array_create(10, noone);
turnQueueIndex = 0;

menuStack = ds_stack_create();



battlers = noone;
enemies = noone;
allies = noone;
phase = 0;

battleStart = false;
menu = noone;
state = "Begin";

allyTurn = false;
enemyTurn = false;
actionPhase = false;


//NEW BATTLE CONFIG//
orderPhase = true;
enemyPhase = false;
actionPhase = false;
betweenTurns = false;
orderAllyIndex = 0;




with (instance_create_layer(50, 44, "Instances", obj_Einart)) {
	label = "Einari";
	HealthBar = instance_create_layer(0, 100,"GUI", obj_HealthBar);
	HealthBar.set_owner(self);
}

with (instance_create_layer(40, 54, "Instances", obj_Deina)) {
	label = "Maija";
	HealthBar = instance_create_layer(x,y,"GUI", obj_HealthBar);
	HealthBar.set_owner(self);
	HealthBar.x += 36;
	hp = maxHp;
}

/*
with (instance_create_layer(30, 64, "Instances", obj_Ally)) {
	label = "Deina";
	sprite_index = spr_Deina;
	HealthBar = instance_create_layer(x,y,"GUI", obj_HealthBar);
	HealthBar.set_owner(self);
	HealthBar.x += 72;
	HealthBar.mugshot_sprite = spr_DeinaMug;
	hp = maxHp;
}
*/
/*
instance_create_layer(100, 50, "Instances", obj_EnShrumm);
instance_create_layer(90, 60, "Instances", obj_EnShrumm);
instance_create_layer(100, 70, "Instances", obj_EnShrumm);
*/
//MENU
menu = instance_create_layer(0, 0, "Menu", obj_Menu);
ds_stack_push(menuStack, menu);

turnQueue = ds_priority_create();

alarm[0] = 1;

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

function calculate_turn_order() {
	var n = instance_number(obj_Battler);
	
	if (n < 1) {
		show_message("NO BATTLERS");
		game_end();
	}
	
	var ind = turnQueueIndex;
	var order_size = n;
	var wrappedAround = false;
	battlers = array_create(n, noone);
	
	while (ds_queue_size(turnQueue) < order_size) {
		if (wrappedAround == true) ind = 0;
		for (var i = ind; i < n; i++) {
			var battler = instance_find(obj_Battler, i);
			battler.spdCounter += battler.spd;
			if( battler.spdCounter >= battler.spdCounterLimit ) {
				battler.spdCounter = 0;
				ds_queue_enqueue(turnQueue, battler);
			}
		}
		wrappedAround = true;
	}
	
	//COPY QUEUE TO ARRAY TO DRAW IMAGES
	temp = ds_queue_create();
	ds_queue_copy(temp, turnQueue);
	for(var i = 0; i < order_size; i++) {
		turnArray[i] = ds_queue_dequeue(temp);
	}
	ds_queue_destroy(temp);
	
}

function recalculate_turn_order() {
		
	var n = instance_number(obj_Battler);
	
	if (n < 1) {
		show_message("NO BATTLERS");
		game_end();
	}
	
	var order_size = 10;
	
	temp = ds_queue_create();
	
	while (ds_queue_size(temp) < order_size) {
		for (var i = 0; i < n; i++) {
			var battler = instance_find(obj_Battler, i);
			battler.spdCounter += battler.spd;
			if( battler.spdCounter >= battler.spdCounterLimit ) {
				battler.spdCounter = 0;
				ds_queue_enqueue(temp, battler);
			}
		}
	}
	
	ds_queue_copy(turnQueue, temp);
	ds_queue_destroy(temp);
	
	//COPY QUEUE TO ARRAY TO DRAW IMAGES
	temp = ds_queue_create();
	ds_queue_copy(temp, turnQueue);
	for(var i = 0; i < order_size; i++) {
		turnArray[i] = ds_queue_dequeue(temp);
	}
	ds_queue_destroy(temp);
	
	
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