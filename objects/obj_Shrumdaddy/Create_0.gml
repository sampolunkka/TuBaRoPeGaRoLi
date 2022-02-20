/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

mugshot_sprite = spr_Shrumdaddy_mug;

spd = 100;
maxHp = 2000;
hp = maxHp;

sporeCooldown = 0;
sporeCooldownMax = 3;

//ACTIONS

function sporulatio() {
	var a = 3;
	var b = 5;
	var n = irandom_range(3, 5);
	for(var i = 0; i < n; i++ ) {
		var sx = irandom_range(x-20, x-40);
		var sy = irandom_range(y-20, y+20);
		instance_create_layer(sx, sy, "Instances", obj_Shrumlet);
	}
}

//SPORULATIO

