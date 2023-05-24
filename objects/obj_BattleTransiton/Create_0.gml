/// @description Insert description here
// You can write your code in this editor

// For distor shader
#macro COLOUR_FOR_NO_MOVE make_colour_rgb(127,127,255)

// name of what you want it to be called in the shader
distortion_stage = shader_get_sampler_index(sha_shader, "distortion_texture_page");

application_surface_draw_enable(false);

// Shader properties
shaderAlpha = 0;
shaderRotation = 0;
shaderScale = 1;
applyShader = false;

fadingOut = false;
fadeOut = 30;
alpha = 1;

targetRoom = room_Battle;

party = instance_find(obj_Party, 0);
actor = party.members[0];

if (instance_exists(con_MovementControl)) {
	var moveControl = instance_find(con_MovementControl, 0);
	moveControl.setPaused(true);
}

alarm[0] = 10;