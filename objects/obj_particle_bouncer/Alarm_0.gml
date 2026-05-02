var _player = instance_place(x, y, obj_player)

if (_player != noone) {
    if (mass == 0) {
        instance_destroy()
        return 0
    }

    var _scale = 1 / mass
    
    destroyedByHit = true
    
    var _pt = instance_create_depth(x, y, depth - 5, obj_particle_single_cycle)
    _pt.sprite_index = spr_star_md
    _pt.image_angle = random(360) 
    
    audio_play_sound(snd_tap_light, 3, false, random_range(0.7, 0.9), 0, 1)
    
    zVel = random_range(-4 * _scale, -2 * _scale)
    xVel = random_range(-2 * _scale, 2 * _scale)
    yVel = random_range(-2 * _scale, 2 * _scale)
    rotationSpeed = random_range(rotationSpeedInitMin, rotationSpeedInitMax) * random_sign()
    moving = true
    bounces = 0
    maxBounces = 1
} else {
    alarm_set(0, random_range(4, 7))
}
