/// @description Insert description here
// You can write your code in this editor
//x = 56;
//y = 95;
depth = 0;
hp = 100;
maxHp = 150;
xp = 0;
xpMax = 1;

owner = noone;
label = "Unnamed";

mugshot_sprite = spr_Einart_mug;
function set_owner(_Actor) {
	owner	=	_Actor;
	label	=	_Actor.label;
	hp		=	_Actor.hp;
	maxHp	=	_Actor.hp;
	xp		=	_Actor.xp;
	xpMax	=	_Actor.xpToLevel;
}

function update() {
	hp		=	_Actor.hp;
	maxHp	=	_Actor.hp;
	xp		=	_Actor.xp;
	xpMax	=	_Actor.xpToLevel;
}

function remove_hp(_damage) {
	
}
