
if (equipped && owner != noone) {
	travelDistance += point_distance(lastX, lastY, owner.x, owner.y)
	
	lastX = owner.x
	lastY = owner.y
	
	if (travelDistance >= travelDistanceMax) {
		travelDistance -= travelDistanceMax
		
		var _dmg = damage[level - 1]
		var _rad = damageRadius
		
		with (owner) {
			damage_baddies_in_area(_rad, _dmg)
			spawn_fx_circle(_rad)
		}
	}
}