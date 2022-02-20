/// @description Insert description here
// You can write your code in this editor
var space = 8;
var text_x = x;
var text_y = y+1;

draw_set_font(font);



if (active) {
		highlight_col = c_yellow;
		normal_col = c_white;
} else {
		highlight_col = c_lime;
		normal_col = c_silver;
}

for (var i = 0; i < array_length(menu); i++) {
	var str = menu[i,0];
	if (i == mpos ) {
		draw_set_color(highlight_col);
		str = "*" + str;
		text_x = x-3;
	} else {
		text_x = x;
		draw_set_color(normal_col);
	}
	draw_text_color(text_x+1, text_y+1, str, c_black, c_blue, c_black, c_navy, 1);
	draw_text(text_x, text_y, str);
	
	text_y = text_y + space;
}