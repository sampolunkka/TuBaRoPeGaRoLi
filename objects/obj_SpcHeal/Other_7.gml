/// @description Insert description here
// You can write your code in this editor
if (casting) {
	target.heal_damage(round(healAmount + 1.2 * caster.magic));
	activeBattler.resolve_turn();
	instance_destroy();
}