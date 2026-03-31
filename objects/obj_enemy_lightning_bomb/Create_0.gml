event_inherited();

moveSpeedScalar = 0.965
moveSpeedMax = 6.4
turnRate = 1

chargeUpTime = 0
chargeUpMax = stf(1)
chargeUpDamageRadius = 60

beginStep = function() {
    if (abs(xVel) <= 0.11 && abs(yVel) <= 0.11) {
        chargeUpTime++
        
        if (age % 13 == 0) {
            var _pt = instance_create_depth(x + random_range(-16, 16), y + random_range(-16, 16), depths.fx, obj_particle_single_cycle)
            var _scale = random_range(0.5, 1)
            _pt.sprite_index = spr_particle_lightning_medium
            _pt.image_xscale = _scale
            _pt.image_yscale = _scale
            _pt.image_angle = random(360)
        }
        
        if (chargeUpTime >= chargeUpMax) {
            var _pt = instance_create_depth(x, y, depths.fx, obj_particle_single_cycle)
            _pt.sprite_index = spr_blue_explosion
            _pt.image_xscale = 2
            _pt.image_yscale = 2
            _pt.image_speed = 3
            
            with (obj_player) {
            	if (point_distance(x, y, other.x, other.y) < other.chargeUpDamageRadius) {
            		damage_player(other, other.chargeUpDamageRadius)
            	}
            }
            instance_destroy()
        }
    }
}