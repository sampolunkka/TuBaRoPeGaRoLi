/// @description Insert description here
// You can write your code in this editor

//INIT OBJECT
timer = 0;
alpha = 1;
owner = instance_nearest(x, y, obj_Battler);
healAmount = 0;
y -= owner.sprite_height + string_height(healAmount) + 4;
x -= string_width(healAmount);


//KNOCKBACK ON BATTLER
knockBackStrength = 1;
knockBackDuration = 1;
knockBackDirection = knockBackStrength;

if (owner.team == "Ally") {
	knockBackDirection = - knockBackDirection;
}
owner.x += knockBackDirection;
alarm[0] = knockBackDuration;

function init(_healAmount) {
	healAmount = _healAmount;
}


//OBJECT MOVEMENT
spd = 7;
move_x = irandom_range(x-50, x+50);
move_y = x-100;

