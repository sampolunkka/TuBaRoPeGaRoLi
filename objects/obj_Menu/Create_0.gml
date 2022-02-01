/// @description Insert description here
// You can write your code in this editor
x = 10;
y = 600;
active = true;
mpos = 0;
//get allies from battle control
allies = array_create(1, noone);
array_copy(allies, 0, BattleControl.allies, 0, array_length(BattleControl.allies));

ally = allies[0];

menu = ["Attack", "Special", "Item", "Defend", "Status"];

function select(selection) {
	if ( is_string(selection ) ) {
		switch(selection) {
			case "Attack":
				active = false;
				var targeting = instance_create_layer(x, y, "Menu", obj_Targeting);
				break;
			case "Special":
				active = false;
				var submenu = instance_create_layer(x,y,"Menu", obj_SubMenu);
				submenu.parentMenu = self;
				break;
			case "Item": break;
			case "Defend": break;
			case "Status": break;
		}
	}
}

function get_action() {
	return menu[mpos];
}