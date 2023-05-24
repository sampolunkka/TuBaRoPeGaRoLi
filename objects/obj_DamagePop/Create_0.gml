/// @description Insert description here
// You can write your code in this editor

//INIT OBJECT
timer = 0;
alpha = 1;
owner = instance_nearest(x, y, obj_Battler);
damage = 0;
y -= owner.sprite_height + string_height(damage) +2;


//KNOCKBACK ON BATTLER
knockBackStrength = 1;
knockBackDuration = 1;
knockBackDirection = knockBackStrength;

if (owner.team == "Ally") {
	knockBackDirection = - knockBackDirection;
}
owner.x += knockBackDirection;
alarm[0] = knockBackDuration;


//OBJECT MOVEMENT
spd = 7;
move_x = irandom_range(x-50, x+50);
move_y = y-100;

