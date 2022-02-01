/// @description Insert description here
// You can write your code in this editor
globalvar BattleControl; BattleControl = self;

turnOrder = array_create(1, noone);

enemies = noone;
allies = noone;
phase = 0;

/* TURN
1. Serve turn
2. Resolve start of turn effects
3. Begin turn
4. Perform action
5. End turn
6. Resolve end of turn effects
*/

activeTurn = noone;
gameStarted = false;
menu = noone;

function get_turn_order() {
	
	var n = instance_number(obj_Battler);
	var battlers;
	
	//find all battlers;
	
	for (i = 0; i < n; i++) {
		battlers[i] = instance_find(obj_Battler, i);
	}
	
	//sort by spd
	//selection sort descending
	
	for (step = 0; step < n - 1; step++) {
		var min_idx = step;
		for (i = step + 1; i < n; i++) {
			if (battlers[i].spd > battlers[min_idx].spd) {
				min_idx = i;
			}
			temp = battlers[min_idx];
			battlers[min_idx] = battlers[step];
			battlers[step] = temp;
		}
	}
	var len = array_length(battlers);
	array_copy(turnOrder, 0, battlers, 0, len);
	
}

function get_menu_instance() {
	return menu;
}



function find_all_battlers() {
	var j = 0, k = 0;
	for (i = 0; i < instance_number(obj_Battler); i++) {
		var _battler = instance_find(obj_Battler, i);
		switch (_battler.team) {
			case "Ally": allies[j] = _battler; j++; break;
			case "Enemy": enemies[k] = _battler; k++; break;
			default: break;
		}
	}
}

alarm[0] = 1;
