/// @description Insert description here
// You can write your code in this editor


//ALLY ORDER PHASE
if(orderPhase && activeBattler == noone) {
	//show_message("orderPhase");
	activeBattler = find_nonprimed_battler(obj_Ally);
	menu_stack_reset();
	if( activeBattler == noone) {
		orderPhase = false;
		enemyPhase = true;
	}
//ENEMY ORDER PHASE
} else if (enemyPhase ) {
	menu.active = false;
	//show_message("enemyPhase");
	activeBattler = find_nonprimed_battler(obj_Enemy);
	if( activeBattler != noone) {
		activeBattler.decide_action();
		activeBattler = noone;
	} else {
		enemyPhase = false;
		actionPhase = true;
	}
//ACTION PHASE
} else if (actionPhase && activeBattler == noone) {
	//show_message("actionPhase");
	if (ds_priority_size(turnQueue > 0)) {
		activeBattler = ds_priority_delete_max(turnQueue);
		if (instance_exists(activeBattler)) {
			activeBattler.execute_primed_action();
		} else {
			activeBattler = noone;
		}
	} else {
		actionPhase = false;
		betweenTurns = true;
	}
} else if (betweenTurns) {
	//show_message("betweenTurns");
	activeBattler = noone;
	init_turn();
	betweenTurns = false;
	orderPhase = true;
}