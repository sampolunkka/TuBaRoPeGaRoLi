if (flashAlpha > 0) {
	gpu_set_fog(true, flashColour, 0, 0 );
	draw_self();
	gpu_set_fog(false, flashColour, 0, 0 );
	/*draw_sprite_ext(
		sprite_index,
		image_index, 
		x,
		y,
		image_xscale,
		image_yscale,
		image_angle,
		c_red,
		flashAlpha
	);*/
} else {
	draw_self();
}