event_inherited()

moveSpeedMax = 5
accel = 0
angleSpriteToVelocity = true
shadowSprite = spr_shadow_med

velocityAngle = 0
turnRate = 4
turnRateMin = 0
turnDecay = 0.991               // higher = slower
customAccel = 0.08

create_ribbon(id, obj_ribbon, 20, 5, global.colorOrange)

beginStep = function() {
    turnRate *= turnDecay
    //turnDecay *= 1.001
    
    turnRate = max(turnRate, turnRateMin)
    
    var _angle = point_direction(0, 0, xVel, yVel)
    var _mag = point_distance(0, 0, xVel, yVel)
    
    _mag = clamp(_mag + customAccel, 0, moveSpeedMax)
    _angle += turnRate
    
    xVel = angle_xvel(_angle) * _mag
    yVel = angle_yvel(_angle) * _mag
}
