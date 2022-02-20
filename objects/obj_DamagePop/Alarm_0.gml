/// @description UNDO KNOCKBACK
// You can write your code in this editor
if (instance_exists(owner)) {
	owner.x += -knockBackDirection;
}