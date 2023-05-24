/// @description Insert description here
// You can write your code in this editor
event_inherited();
label = "Heal";
instLayer = "Instances";
targetTeam = obj_Ally;
active = true;
casting = false;
timer = 0;
if (BattleControl.orderPhase) {
	targeting = instance_create_layer(x, y, "Menu", obj_Targeting);
	targeting.init(1, "Allies", self);
}
sprite = sprite_index;
sprite_index = noone;

target = noone;
source = noone;
healAmount = 20;
manaCost = 2;
duration = 72;

function cast() {
	targeting_failsafe();
	x = target.x;
	y = target.y - 4;
	sprite_index = sprite;
	image_index = 0;
	casting = true;
}