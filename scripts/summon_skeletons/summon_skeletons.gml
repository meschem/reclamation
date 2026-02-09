///@description   Summons a group of skeletons
///@param {real} count
///@param {asset.GMObject} obj

function summon_skeletons(count = 8, obj = obj_skeleton_summoned) {
	var minDistance = 28
	var maxDistance = 42
	var baseAngle = random(360)
	var spawnOffset = new vec2()
	var angle
	
	for (var i = 0; i < count; i++) {
		angle = baseAngle + ((360 / count) * i)
		spawnOffset = get_vec2_from_angle_mag(angle, irandom_range(minDistance, maxDistance))
		
		spawn_baddie_at_location(obj, x + spawnOffset.x, y + spawnOffset.y)
	}
}