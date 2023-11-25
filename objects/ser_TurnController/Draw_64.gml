/// @description Insert description here
// You can write your code in this editor
if(battlerTimeline != noone) {
	var space = 10;
	for (var i = 0; i < array_length(turnArray); i++) {
		if (instance_exists(turnArray[i])) {
			var mugSprite = turnArray[i].mugshot_sprite;
			draw_sprite(mugSprite, 0, 1 + i*space, 1);
		}
	}
}