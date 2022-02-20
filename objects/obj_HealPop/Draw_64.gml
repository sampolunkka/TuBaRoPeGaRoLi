// @description Insert description here
// You can write your code in this editor

draw_set_font(dmgFont);

if(timer < 2 || timer == 4) {
	draw_set_color(c_white);
	draw_text(x, y, healAmount);
} else if (timer < 3 ) {
	draw_set_color(c_black);
	draw_text(x, y, healAmount);
} else {
	draw_text_color(x, y, healAmount, c_aqua, c_white, c_yellow, c_white, alpha);
}