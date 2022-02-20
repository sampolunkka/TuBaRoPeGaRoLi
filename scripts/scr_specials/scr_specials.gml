// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function special_flame(_Caster, _Target) {
	var flame = instance_create_layer(x, y, "Instances", obj_SpcFlame)
	flame.init(_Caster, _Target);
}
