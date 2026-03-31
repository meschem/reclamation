event_inherited()

angleSpriteToVelocity = true
moveSpeedMax = 2
accel = 0.06

fireCdCur = 0
fireCdMax = 10

beginStep = function() {
    fireCdCur++
    
    if (fireCdCur >= fireCdMax) {
        fireCdCur = 0
        
        var _proj = launch_projectile(obj_enemy_red_shot, random(360), 0.5)
        _proj.depth = depth + 5
    }
}