// @description Insert description here
// You can write your code in this editor

//draw_set_font(dmgFont);

//draw_text_color(x - 1, y, damage, c_black, c_black, c_black, c_black, alpha*1.5);
draw_set_font(dmgFont);
if(timer < 2 || timer == 4) {
	draw_set_color(c_white);
	draw_text(x, y, damage);
} else if (timer < 3 ) {
	draw_set_color(c_black);
	draw_text(x, y, damage);
} else {
	draw_text_color(x, y, damage, c_white, c_orange, c_red, c_orange, alpha);
}


//draw_text(x, y, damage);
//draw_text_color(x, y, damage, c_white, c_white, c_white, c_white, alpha);