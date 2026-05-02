// Inherit the parent event
event_inherited()

tellLineDraw = false

if (state == enemyStates.normal) {
	var _angle
	var _mag = 1

	attackCdCur++
    
    if (attackCdCur >= attackCdMax) {
        xVel = 0
        yVel = 0
        state = enemyStates.abilityCharging
        attackChargeCur = 0
        tellLineFrame = 0
    }
} else if (state == enemyStates.abilityCharging) {
    attackChargeCur++
    
    if (attackChargeCur >= attackChargeMax) {
        state = enemyStates.normal
        attackCdCur = 0
        tellLineDraw = false
        
        var _target = get_player_target()
        var _mag = 0.2
        var _angle = point_direction(x, y, _target.x, _target.y)
            
        launch_projectile(obj_enemy_arrow_basic, _angle, _mag)
    }
    
    if (target == noone) {
        return 0
    }
    
    tellLineDraw = true
    tellLineAngle = point_direction(x, y, target.x, target.y)
    tellLineOffsetX = lengthdir_x(19, tellLineAngle)
    tellLineOffsetY = lengthdir_y(19, tellLineAngle)
    tellLineFrame = min(tellLineFrame + 0.25, 7)
}
