/// @description Insert description here
// You can write your code in this editor

//INHERITS SELECT
event_inherited();

instLayer = "Instances";
targeting = instance_create_layer(x, y, "Menu", obj_Targeting);
targeting.init(1, "Enemies", self);
target = noone;
caster = noone;
active = true;
targetTeam = obj_Enemy;

label = "Attack";

function cast() {
	targeting_failsafe();
	caster.attack(target);
	instance_destroy();
}