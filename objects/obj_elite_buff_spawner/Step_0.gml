
event_inherited()

if (age % spawnRate == 0) {
	var mag = 20
	var angle = irandom(360)
	var point = new vec2()
	var inst
	
	for (var i = 0; i < spawnAmount; i++) {
		point = get_vec2_from_angle_mag(angle, mag)
		
		inst =  spawn_baddie_at_location(
			owner.minionType,
			owner.x + point.x,
			owner.y + point.y
		)
		
		inst.xp = 0
		inst.loot = []
	}
}
