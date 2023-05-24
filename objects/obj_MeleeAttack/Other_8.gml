/// @description Insert description here
// You can write your code in this editor
if (attacking) {
	if(target !=noone) {
		var weaponAnim = instance_create_layer(x, y, "Instances", obj_SwordSwing);
		weaponAnim.owner = source;
		deal_damage(
			source,
			target,
			source.get_attack_damage(),
			source.get_attack_damage_type()
		);
		alarm[0] = 40;
		attacking = false;
		returning = true;
		
	}
} else if (returning) {
	returning = false;
	activeBattler.resolve_turn();
	instance_destroy();
}