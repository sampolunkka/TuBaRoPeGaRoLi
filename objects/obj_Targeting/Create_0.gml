/// @description Insert description here
// You can write your code in this editor
BattleControl.find_all_battlers();
enemies = BattleControl.enemies;
allies = BattleControl.allies;

menu = BattleControl.get_menu_instance();
action = menu.get_action();

targets = enemies;
tpos = 0;