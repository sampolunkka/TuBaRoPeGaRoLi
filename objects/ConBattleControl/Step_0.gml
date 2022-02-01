/// @description Insert description here
// You can write your code in this editor
/* TURN
1. Serve turn
2. Resolve start of turn effects
3. Begin turn
4. Perform action
5. End turn
6. Resolve end of turn effects
*/

//TURN
//PHASE
//STEP
//ACTION

//COMMAND PHASE
//ACTION PHASE

//COMMAND PHASE

if (phase == 0) {
	find_all_battlers();
	get_turn_order();
	phase ++;
} else if (phase == 1) {
	menu = instance_create_layer(x, y, "Menu", obj_Menu);
	phase++;
}