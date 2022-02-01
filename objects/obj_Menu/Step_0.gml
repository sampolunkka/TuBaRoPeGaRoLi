/// @description Insert description here
// You can write your code in this editor

//FOR MOVING IN THE MENU
if (active) {
	var move = 0;
	var len = array_length(menu);
	move -= max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), 0);
	move += max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")), 0);

	if (move != 0) {
		mpos +=move;
		if(mpos < 0) {
			mpos = len-1;
		} else if (mpos > len-1) {
			mpos = 0;
		}
	}
}
//select action
