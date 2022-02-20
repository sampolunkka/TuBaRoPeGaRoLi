/// @description Insert description here
// You can write your code in this editor
image_xscale = scale;
image_yscale = scale;
randomize();

flashAlpha = 0;
flashColour = c_white;

spd = 1;
spdCounter = 0;
spdCounterLimit = 10;

level = 1;

HealthBar = noone;
hp = 150;

team = "Neutral";

battleAction = noone;
battleActionTarget = noone;
battleActionIsSet = false;

team = "Ally";

label = "Battler";

attacking = false;
target = noone;
damage = 10;

alpha = 1;

function deal_damage() {
	if (target != noone) {
		target.take_damage(damage);
	}
}

function take_damage(_damage) {
	hp -= _damage;
	var pop = instance_create_layer(x, y - sprite_height, "Instances", obj_DamagePop);
	pop.damage = _damage;
	if (HealthBar != noone) {
		HealthBar.hp -= _damage;
	}
	flashColour = c_red;
	flashAlpha = 1;
}

function start_turn() {
	if (team == "Ally") {
		var menu = instance_create_layer(x, y, "Menu", obj_Menu);
		BattleControl.menu = menu;
	} else if ( team == "Enemy" ) {
		BattleControl.activeBattler.event_user(0);
	}
}

function resolve_turn() {
	target = noone;
	BattleControl.activeBattler = noone;
}