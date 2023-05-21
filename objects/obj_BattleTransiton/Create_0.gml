/// @description Insert description here
// You can write your code in this editor
fadingOut = false;
fadeOut = 30;
alpha = 1;

if (instance_exists(con_MovementControl)) {
	var moveControl = instance_find(con_MovementControl, 0);
	moveControl.setPaused(true);
}