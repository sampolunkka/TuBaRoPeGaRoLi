/// @description Insert description here
// You can write your code in this editor
if (attacking) {
	if(target !=noone) {
		var weaponAnim = instance_create_layer(x, y, "Instances", obj_SwordSwing);
		weaponAnim.owner = self;
		deal_damage(target);
		alarm[0] = 40;
		attacking = false;
		returning = true;
		
	}
} else if (returning) {
	returning = false;
	resolve_turn();
}