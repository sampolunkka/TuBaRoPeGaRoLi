/// @description Insert description here
// You can write your code in this editor
x = 6;
y = 102;
active = false;
mpos = 0;
instLayer = "Menu";
label = "Menu";

//get allies from battle control
//allies = array_create(1, noone);
//array_copy(allies, 0, BattleControl.allies, 0, array_length(BattleControl.allies));

//ally = activeBattler;

menu[0,0] = "Attack";
menu[0,1] = obj_MeleeAttack;

menu[1,0] = "Special";
menu[1,1] = obj_SpecialMenu;

menu[2,0] = "Item";
menu[2,1] = obj_ItemMenu;

menu[3,0] = "Defend";
menu[3,1] = obj_Defend;

menu[4,0] = "Status";
menu[4,1] = obj_Attack;

function select() {
	return menu[mpos, 1];
}

function get_action() {
	return menu[mpos];
}