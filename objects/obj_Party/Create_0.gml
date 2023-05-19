/// @description Insert description here
// You can write your code in this editor

battlerLayer = "Instances";

members = array_create(0, noone);

// Ally battler positions
// [i, 0] = x
// [i, 1] = y
positions[0,0] = 26;
positions[0,1] = 64;
positions[1,0] = 30;
positions[1,1] = 70;
positions[2,0] = 30;
positions[2,1] = 50;

// Items in party
// [i, 0] = Name
// [i, 1] = Object
// [i, 2] = Quantity
items[0,0] = "Potion";
items[0,1] = obj_Potion;
items[0,2] = 2;

function get_items() {
	return items;
}

function add(_ally) {
	var index = array_length(members);
	_ally.x = positions[index, 0];
	_ally.y = positions[index, 1];
	array_push(members, _ally);
	_ally.partyIndex = index;
}

function init() {
	add(instance_create_layer(x, y, battlerLayer, obj_Einart));
}

init();