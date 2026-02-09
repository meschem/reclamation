
// Inherit the parent event
event_inherited();

if (state == enemyStates.normal) {
	var _angle
	var _mag = 0.5

	fireCdCur--

	if (fireCdCur <= 0) {
		fireCdCur = fireCdMax
		
		for (var i = 0; i < fireCount; i++) {
			_angle = (360 / fireCount) * i + fireAngleOffset
			launch_projectile(obj_enemy_red_shot, _angle, _mag)
		}
		
		fireAngleOffset += 45
	}
}
