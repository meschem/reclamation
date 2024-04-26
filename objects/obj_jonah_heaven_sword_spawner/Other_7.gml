
var _abil = get_ability_instance(owner, obj_ability_sword_of_heavens)
var _inst = instance_create_depth(x, y, depths.playerProjectile, obj_jonah_heaven_sword)

_inst.owner = owner

_abil.onSwordLand(new vec2(x, y))

instance_destroy()
