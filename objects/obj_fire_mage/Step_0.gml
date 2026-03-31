
// Inherit the parent event
event_inherited();

if (state == enemyStates.normal) {
	var _angle
	var _mag = 0.3

	fireCdCur--

	if (fireCdCur <= 0) {
        fireCdCur = fireCdMax 
        
        fireWaveCountCur++ 
        
        if (fireWaveCountCur < fireWaveCountMax) {
            for (var i = 0; i < fireCount; i++) {
      			_angle = (360 / fireCount) * i + fireAngleOffset
      			launch_projectile(fireObject, _angle, _mag)
      		}
      		fireAngleOffset += 45
        } else {
            // Start 
            xVel = 0
            yVel = 0
            state = enemyStates.abilityCharging
            fireWaveCountCur = 0
        }
	}
}

if (state == enemyStates.abilityCharging) {
    fireWaveChargeCur++
    
    if (fireWaveChargeCur >= fireWaveChargeMax) {
        state = enemyStates.normal
        fireWaveChargeCur = 0
        
        var _target = get_player_target()
        var _mag = 0.2
        var _angle = point_direction(x, y, _target.x, _target.y)
            
        launch_projectile(obj_enemy_fire_wave, _angle, _mag)
    }
}
