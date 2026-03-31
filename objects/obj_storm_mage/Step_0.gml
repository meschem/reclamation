
// Inherit the parent event
event_inherited();

if (state == enemyStates.normal) {
	var _target = get_player_target()
    var _angle = point_direction(x, y, _target.x, _target.y)
	var _mag = 0.5

	primaryCdCur--

	if (primaryCdCur <= 0) {
        primaryCdCur = primaryCdMax
        
        explosiveOrbCountCur++ 
        
        if (explosiveOrbCountCur < explosiveOrbCountMax) {
            var _offsetAngle = 15 * (irandom(1) * 2 - 1)
            
            launch_projectile(primaryProjectile, _angle, _mag)
            launch_projectile(primaryProjectile, _angle + _offsetAngle, _mag)
        } else {
            // Start 
            xVel = 0
            yVel = 0
            state = enemyStates.abilityCharging
            explosiveOrbCountCur = 0
        }
	}
}

if (state == enemyStates.abilityCharging) {
    explosiveOrbChargeCur++
    
    if (explosiveOrbChargeCur >= explosiveOrbChargeMax) {
        state = enemyStates.normal
        explosiveOrbChargeCur = 0
        
        var _target = get_player_target()
        var _mag = 99
        var _angle = point_direction(x, y, _target.x, _target.y)
  
        var _inst = instance_create_depth(x + orbOffset.x, y + orbOffset.y, depths.enemyProjectile, explosiveOrbObject)
       	set_velocity_from_angle(_inst, _angle, _mag)
       	_inst.owner = id
    }
}
