/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
mugshot_sprite = spr_Einart_mug;


function einart_init() {
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
	
	//WPN
	weapon = instance_create_layer(0,0,"Instances",wpn_Sword);
}

einart_init();