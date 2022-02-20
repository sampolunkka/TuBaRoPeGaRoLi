/// @description Insert description here
// You can write your code in this editor

germinateCooldown--;
if (germinateCooldown <= 0) {
	instance_change(obj_Shrum, true);
}
resolve_turn();
