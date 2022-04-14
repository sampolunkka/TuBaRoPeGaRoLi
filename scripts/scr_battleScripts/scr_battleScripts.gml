// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_battlers(_Object) {
	var n = instance_number(_Object);
	var i = 0;
	var battlers = array_create(n, noone);
	for(i = 0; i < n; i++) {
		var battler = instance_find(_Object, i);
		battlers[i] = battler;
	}
	return battlers;
}

function get_attack_damage(_Battler) {
	return _Battler.get_attack_damage();
}

function deal_damage(_Target) {
	if (target != noone) {
		target.take_damage(damage);
	}
}

function deal_attack_damage(_Attacker, _Defender) {
	var attackDamage = _Attacker.get_attack_damage();
	_Defender.take_damage(attackDamage);
}

function deal_spell_damage(_Caster, _Target, _spellBaseDamage) {
	var magic = _Caster.baseMagic;
	var spellDamage = round(magic * 0.5 + _spellBaseDamage);
	
	if (target != noone) {
		target.take_damage(spellDamage);
	}
	
}