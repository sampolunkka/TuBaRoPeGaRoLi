/// @description Insert description here
// You can write your code in this editor


speedOrder = ds_priority_create();
battlerTimeline = array_create(10, noone);

function init_turn() {
	var n = instance_number(obj_Battler);
	
	for ( var i = 0; i < n; i++ ) {
		var battler = instance_find(obj_Battler, i);
		ds_priority_add(speedOrder, battler, battler.spd);
	}
	create_battler_timeline(n);
}

function create_battler_timeline(_battlerCount) {
	var n = _battlerCount;
	battlerTimeline = array_create(n, noone);
	var temp = ds_priority_create();
	ds_priority_copy(temp, speedOrder);
	for(var i = 0; i < n;  i++;) {
		battlerTimeline[i] = ds_priority_find_max(temp);
		ds_priority_delete_max(temp);
	}
	ds_priority_destroy(temp);
}

function get_next_battler() {
	if (ds_priority_size(speedOrder) < 1) {
		return noone;
	}
	var battler = ds_priority_find_max(speedOrder);
	ds_priority_delete_max(speedOrder);
	return battler;
}