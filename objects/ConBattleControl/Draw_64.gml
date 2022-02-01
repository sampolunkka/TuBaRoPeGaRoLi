/// @description Insert description here
// You can write your code in this editor

battle_menu_height = 200;

x1 = 0;
x2 = window_get_width();
y1 = window_get_height();
y2 = y1 - battle_menu_height;
col2 = c_black;
col3 = c_navy;
col1 = c_teal;
col4 = c_orange;

draw_set_alpha(0.8);
draw_rectangle_color(x1, y1, x2, y2, col1, col2, col3, col4, false );
draw_set_alpha(1);
draw_set_color(c_white);
draw_rectangle(x1+1, y1-1, x2-2, y2+2, true);
draw_set_color(c_black);
draw_rectangle(x1+2, y1-2, x2-3, y2+3, true);

top_bar_height = 40;

x1 = 0;
x2 = window_get_width();
y1 = 0;
y2 = top_bar_height;
col4 = c_black;
col1 = c_navy;
col3 = c_teal;
col2 = c_orange;

draw_set_alpha(0.8);
draw_rectangle_color(x1, y1, x2, y2, col1, col2, col3, col4, false );
draw_set_alpha(1);
draw_set_color(c_white);
draw_rectangle(x1+1, y1-1, x2-2, y2+2, true);
draw_set_color(c_black);
draw_rectangle(x1+2, y1-2, x2-3, y2+3, true);

draw_set_color(c_white);
var str = "Turn order:";
for (i = 0; i < array_length(turnOrder); i++ ) {
	str = str + " " + string(i+1.) + " - " + string(turnOrder[i]);
	if (i+1 < array_length(turnOrder)) {
		str = str + ",";
	}
}
draw_text(0, y2*0.5, str);