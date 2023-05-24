/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_rectangle(0,0,room_width,room_height,false);
surface_distort = surface_create(room_width,room_height);
surface_set_target(surface_distort);

    draw_clear_alpha(COLOUR_FOR_NO_MOVE,0);
    // Anything we draw here will distort the screen
	if(applyShader) {
		shaderAlpha+=0.01;
		shaderRotation+=4;
		//shaderScale-=0.0001;
		if(!fadingOut) {
			draw_sprite_ext(
				spr_rippleShader,
				0,
				actor.x,
				actor.y,
				shaderScale,
				shaderScale,
				shaderRotation,
				c_white,
				shaderAlpha
			);
		}
	}

surface_reset_target();

var surface_texture_page = surface_get_texture(surface_distort);

shader_set(sha_shader);

    texture_set_stage(distortion_stage, surface_texture_page);
    draw_surface(application_surface,0,0);

shader_reset();

surface_free(surface_distort); // always remember to remove the surface from memory 

