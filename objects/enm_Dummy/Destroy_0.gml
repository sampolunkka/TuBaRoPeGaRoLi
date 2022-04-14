/// @description Insert description here
// You can write your code in this editor
event_inherited();
var n = instance_number(obj_Ally);

for(var i = 0; i < n; i++) {
	var battler = instance_find(obj_Ally, i);
	battler.gain_exp(expReward);
}

if (activeBattler != noone) {
	activeBattler.gain_exp(round(expReward*0.5));
}