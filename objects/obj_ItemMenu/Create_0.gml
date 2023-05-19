/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
draw_set_font(font);

label = "Item Menu";

active  = true;
instLayer = "SubMenu";
x = 30;
y = 98;

items[0,0] = "Potion";
items[0,1] = obj_Potion;
items[0,2] = 2;

menu = get_inventory();

function select() {
	
	return menu[mpos, 1];
	
}