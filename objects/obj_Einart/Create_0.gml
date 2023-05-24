/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
mugshot_sprite = spr_Einart_mug;


function einart_init() {
	//STATS
	strength		=	3;
	magic			=	2;
	vitality		=	2;
	spirit			=	1;
	luck			=	2;
	spd				=	3;
	hp				=	40;

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
	
	//WPN
	weapon = instance_create_layer(0,0,"Instances",wpn_Sword);
	
	physicalDefense = 5;
	magicalDefense = 4;
	baseDamage = 4;
}

einart_init();