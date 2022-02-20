/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(160 , 144);
draw_set_font(font);
if(turnArray != noone) {
	var space = 10;
	for (var i = 0; i < array_length(turnArray); i++) {
		if (instance_exists(turnArray[i])) {
			var mugSprite = turnArray[i].mugshot_sprite;
			draw_sprite(mugSprite, 0, 1 + i*space, 1);
		}
	}
}
draw_set_color(c_white);
draw_text(1, 10, "Active menu: " + ds_stack_top(menuStack).label);
if (activeBattler != noone) draw_text(1, 20, "Active Battler: " + activeBattler.label);