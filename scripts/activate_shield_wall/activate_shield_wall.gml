///@description						Builds a shield wall
///@param {real} count				Amount of shields to make
///@param {real} distance			Distance from caster to create them
///@param {real} angleDiff			Angle difference between shield walls
function activate_shield_wall(count, distance, angleDiff) {
	var angleDiffMultiplier = ((count - 1) / 2)
	var caster = obj_player
	var angle, point, inst

	for (var i = 0; i < count; i++) {
		angle = obj_player.attackAngle - (angleDiff * angleDiffMultiplier) + (angleDiff * i)
		point = get_vec2_from_angle_mag(angle, distance)
		
		inst = instance_create_depth(caster.x + point.x, caster.y + point.y, depths.player, obj_shield_wall)
		
		inst.lifeSpan = seconds_to_frames(6)
		
		if (obj_ability_shield_wall.runes[enumRunes.dreygoth].enabled)
			inst.slamming = true
	}
}
