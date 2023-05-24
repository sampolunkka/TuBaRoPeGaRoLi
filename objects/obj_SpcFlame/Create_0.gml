/// @description Insert description here
// You can write your code in this editor
event_inherited();
label = "Flame";
instLayer = "Instances";
active = true;
targetTeam = obj_Enemy;

if(BattleControl.orderPhase) {
	targeting = instance_create_layer(x, y, "Menu", obj_Targeting);
	targeting.init(1, "Enemies", self);
}
sprite = sprite_index;
sprite_index = noone;

target = noone;
source = noone;
spellDamage = 20;
manaCost = 1;

duration = 36;

function cast() {
	targeting_failsafe();
	x = target.x;
	y = target.y - 4;
	sprite_index = sprite;
	image_index = 0;
	alarm[0] = duration;
	alarm[1] = duration * 0.5;
}