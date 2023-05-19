/// @description Insert description here
// You can write your code in this editor
image_xscale = scale;
image_yscale = scale;
randomize();

mugshot_sprite = sprite_index;
weapon = noone;
damageBoost = 0;

//INIT SOME SHIT
turnStartMove = false;
turnEndMove = false;
primedAction = noone;

//FOR DRAW EFFECT
flashAlpha = 0;
flashColour = c_white;
alpha = 1;

//BASE STATS
baseStrength	=	1;
baseMagic		=	1;
baseVitality	=	1;
baseSpirit		=	1;
baseLuck		=	1;
baseSpd			=	1;
baseHp			=	10;

//STATS
strength		=	1;
magic			=	1;
vitality		=	1;
spirit			=	1;
luck			=	1;
spd				=	1;
hp				=	10;

//GROWTH
strengthGrowth	=	4;
magicGrowth		=	1;
vitalityGrowth	=	1;
spiritGrowth	=	1;
luckGrowth		=	1;
spdGrowth		=	1;
hpGrowth		=	12;

//HP
maxHp			=	hp;

spd = random_range(1,2);

level = 1;
xp = 0;
xpToLevel = sqr(level+1);

//SPEED COUNTER
spdCounter = 0;
spdCounterLimit = 10;

//HEALTH BAR
label = "Battler";

//TEAM
team = "Neutral";

//BATTLE ACTIONS
battleAction = noone;
battleActionTarget = noone;
battleActionIsSet = false;

//STATE
attacking = false;
target = noone;

//SPECIALS
specials = array_create(1, noone);
specials[0, 0] = "Flame";
specials[0, 1] = obj_SpcFlame;
specials[0, 2] = 1; //Mana Cost
specials[1, 0] = "Heal";
specials[1, 1] = obj_SpcHeal;
specials[1, 2] = 1; //Mana Cost

function deal_damage() {
	if (target != noone) {
		target.take_damage(damage);
	}
}

function get_attack_damage() {
	var weaponDamage = 0;
	if (weapon != noone) {
		weaponDamage = weapon.get_damage();
	}
	var attackDamage = weaponDamage + strength + damageBoost;
	var critRoll = irandom_range(0, 1);
	if (critRoll < luck) {
		var critModifier = 1.25 + luck * 0.01;
		attackDamage = round(attackDamage * critModifier);
	}
	return attackDamage;
}

function take_damage(_damage) {
	hp -= _damage;
	var pop = instance_create_layer(x, y, "Instances", obj_DamagePop);
	pop.damage = _damage;
	flashColour = c_white;
	flashAlpha = 1;
}

function heal_damage(_amount) {
	hp = min(maxHp, hp + _amount);
	var pop = instance_create_layer(x, y, "Instances", obj_HealPop);
	pop.init(_amount);
	//flashColour = c_aqua;
	//flashAlpha = 1;
}

function start_turn() {
	//flashAlpha = 0.6;
	if (team == "Ally") {
		flashColour = c_white;
		turnStartMove = true;
	} else if (team == "Enemy") {
		flashColour = c_orange;
	}
	event_user(15);
}

function resolve_turn() {
	target = noone;
	activeBattler = noone;
	BattleControl.remake_turn_array();
	//BattleControl.menu_stack_reset();
}

function level_up() {
	
	xp = xp - xpToLevel;
	
	
	maxHp		+=	hpGrowth;
	strength	+=	strengthGrowth;
	vitality	+=	vitalityGrowth;
	magic		+=	magicGrowth;
	spirit		+=	spiritGrowth;
	luck		+=	luckGrowth;
	spd			+=	spdGrowth;
	hp = maxHp;
	level++;
	xpToLevel = sqr(level+1);
}


function execute_action(_actionObject) {
	_actionObject.cast();
}

function execute_primed_action() {
	primedAction.cast();
	primedAction = noone;
}

function prime_action(_actionObject) {
	primedAction = _actionObject;
	activeBattler = noone;
}

function gain_exp() {
}

function flash(_color, _alpha) {
	flashColour = _color;
	flashAlpha = _alpha;
}