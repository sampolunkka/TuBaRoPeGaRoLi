// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lookup_item(item_name) {
	
	item = noone;
	
	switch(item_name) {
		case "Potion": item = obj_Potion; break;
		default: item = noone; break;
	}
	
	return item;
}

function get_inventory() {
	
	var items = obj_Party.get_items();
	
	return items;
}

function use_item() {
}