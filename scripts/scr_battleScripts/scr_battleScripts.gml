// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum DamageType {
	physical = 1,
	magical = 2
}

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
/*
function get_attack_damage(_Battler) {
	return _Battler.get_attack_damage();
}
*/
function deal_damage(_source, _target, _damage, _damageType) {
	
	var _defenseStat;
	var _damageStat;
	
	switch(_damageType) {
		case DamageType.physical: _defenseStat = _target.physicalDefense; _damageStat = _source.strength; break;
		case DamageType.magical: _defenseStat = _target.magicalDefense; _damageStat = _source.magic; break;
		default: _defenseStat = 1; _damageStat = 1; break;
	}
	
	var _damageResult = max(1, round(_damage * _damageStat / _defenseStat));
	with (instance_create_depth(target.x, target.y, 0, obj_DamagePop)) {
		damage = _damageResult;
	}
	target.hp -= _damageResult;
	
	//target.take_damage(_damage, _damageType, _source);
}
/*
function deal_attack_damage(_Attacker, _Defender) {
	var attackDamage = _Attacker.get_attack_damage();
	_Defender.take_damage(attackDamage);
}

function deal_spell_damage(_source, _Target, _spellBaseDamage) {
	var magic = _source.baseMagic;
	var spellDamage = round(magic * 0.5 + _spellBaseDamage);
	
	if (target != noone) {
		target.take_damage(spellDamage);
	}
	
}
*/