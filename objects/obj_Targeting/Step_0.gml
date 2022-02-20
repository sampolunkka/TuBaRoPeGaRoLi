/// @description Insert description here
// You can write your code in this editor
var move = 0;
var len = array_length(targets);
move -= max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), 0);
move += max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")), 0);

if (move != 0) {
	tpos +=move;
	if(tpos < 0) {
		tpos = len-1;
	} else if (tpos > len-1) {
		tpos = 0;	
	}
	x = targets[tpos].x;
	y = targets[tpos].y - targets[tpos].sprite_height - 2;
}

target = targets[tpos];
if ( prevTarget != noone && target.id != prevTarget.id) {
	flashTimer = flashTimerMax;
	target = prevTarget;
}

flashTimer++;
if ( flashTimer >= flashTimerMax ) {
	if (target != noone) {
		var color = c_dkgray;
		switch (target.team) {
			case "Ally": color = c_green; break;
			case "Enemy": color = c_red; break;
			default: break;
		}
		target.flash(color, 2);
		flashTimer = 0;
		
	}
}
