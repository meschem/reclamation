
// Inherit the parent event
event_inherited();

if (state == enemyStates.normal) {
	var _inst

	fireCdCur--

	if (fireCdCur <= 0) {
		fireCdCur = fireCdMax
		
		for (var i = 0; i < fireCount; i++) {
			launch_projectile(obj_enemy_red_shot, (360 / fireCount) * i, 0.5)
		}
	}
}