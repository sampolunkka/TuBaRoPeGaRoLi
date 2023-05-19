/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (active) {
	draw_set_alpha(1);
} else {
	draw_set_alpha(0);
}
draw_sprite(sprite_index, image_index, x, y);
var space = 8;
text_offset_normal = 8;
text_offset_hower = text_offset_normal - 3;
var text_y = y + 4;
var text_x = 0;

if (active) {
	highlight_col = c_yellow;
	normal_col = c_white;
} else {
	highlight_col = c_lime;
	normal_col = c_silver;
}
for (var i = 0; i < array_length(menu); i++) {
	var str = menu[i, 0] + " ¤" + string(menu[i, 2]);
	if (i == mpos) {
		draw_set_color(highlight_col);
		str = "*" + str;
		text_x = x + text_offset_hower;
	} else {
		text_x = x + text_offset_normal;
		draw_set_color(normal_col);
	}
	draw_text_color(text_x+1, text_y+1, str, c_black, c_blue, c_black, c_navy, draw_get_alpha());
	draw_text(text_x, text_y, str);
	
	text_y = text_y + space;
}
draw_set_alpha(1);