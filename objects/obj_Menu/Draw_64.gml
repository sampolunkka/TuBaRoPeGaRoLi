/// @description Insert description here
// You can write your code in this editor
var space = 32;
var text_x = x;
var text_y = y;

if (active) {
	highlight_col = c_yellow;
	normal_col = c_white;
} else {
	highlight_col = c_lime;
	normal_col = c_silver;
}

for (var i = 0; i < array_length(menu); i++) {
	
	draw_set_color(normal_col);
	
	var str = menu[i];
	
	if (i == mpos) {
		draw_set_color(highlight_col);
		str = " " + str;
	}
	
	draw_text(text_x, text_y, str);
	
		text_y = text_y + space;
	
	if (text_y > window_get_height()-20) {
		text_x += 100;
		text_y = y;
	}
	
}