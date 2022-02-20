/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
draw_set_font(font);

label = "Special Menu";

active  = true;
instLayer = "SubMenu";
x = 30;
y = 98;
menu = activeBattler.specials;

function select() {
	
	return menu[mpos, 1];
	
	if(activeBattler.spirit >= menu[mpos, 2]) {
		return menu[mpos, 1];
	} else {
		show_message("NO MANA");
		//return -4;
	}
}