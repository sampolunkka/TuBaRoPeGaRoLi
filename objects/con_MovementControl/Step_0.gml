/// @description Insert description here
// You can write your code in this editor


// Movement
var input_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var input_y = keyboard_check(vk_down) - keyboard_check(vk_up);


var velocity_x = 0.7;
var velocity_y = 0.4;

var move_x = velocity_x * input_x;
var move_y = velocity_y * input_y;

if(party != noone) {
	var actor = party.members[0];
	actor.x += move_x;
	actor.y += move_y;
	
	// Flip sprite
	if (move_x > 0) {
		actor.image_xscale = 1;
	} else if (move_x < 0) {
		actor.image_xscale = -1;
	}
	
	// Animate
	if (move_x != 0 || move_y != 0) {
		actor.image_speed = 1;
	} else {
		actor.image_index = 0;
		actor.image_speed = 0;
	}
}