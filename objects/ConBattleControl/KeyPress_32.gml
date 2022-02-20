/// @description Insert description here
// You can write your code in this editor

//CALLS SELECT on current menu step
//see menu_select() in create event
if ( orderPhase ) {
	var m = ds_stack_top(menuStack);
	menu_select(m);
}