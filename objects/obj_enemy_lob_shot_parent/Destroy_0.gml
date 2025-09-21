
instance_create_depth(x, y, depths.enemyProjectile, obj_fire_pit)

var _self = id

with (obj_player) {
	if (point_distance(x, y, _self.x, _self.y) < _self.damageRadius) {
		damage_player(_self, _self.damageDirect)
	}
}

with (obj_projectile_warning) {
	if (parent == _self) {
		instance_destroy()
	}
}
