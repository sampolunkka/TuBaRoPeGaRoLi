/// @description Insert description here
// You can write your code in this editor

instLayer = "Instances";
menu = BattleControl.get_menu_instance();
action = menu.get_action();

targets = find_battlers(obj_Enemy);
target = noone;
tpos = 0;
initialized = false;

flashTimerMax = 30;
flashTimer = flashTimerMax;
prevTarget = noone;


function init(_scheme, _legalTargets, _battleAction ) {
	
	switch (_scheme) {
		case 1: break;
		case "All": break;
	}
	
	switch (_legalTargets) {
		case "Allies": targets = find_battlers(obj_Ally) break;
		case "Enemies": targets = find_battlers(obj_Enemy) break;
		case "Any": targets = find_battlers(obj_Battler) break;
		case "Self": targets = array_create(1, activeBattler); break;
	}
	
	action = _battleAction;
	x = targets[tpos].x;
	y = targets[tpos].y-10;
}

function get_target() {
	return target;
}