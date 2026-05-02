var _pt = instance_create_depth(x, y, depths.enemyFloorFx, obj_particle_single_cycle)
_pt.sprite_index = spr_smoke_puff_flat_sm
_pt.image_blend = global.colorGray
_pt.xVel = random_range(0.1, 0.3)
_pt.yVel = random_range(0.1, 0.3)

_pt = instance_create_depth(x, y, depths.enemyFloorFx, obj_particle_single_cycle)
_pt.sprite_index = spr_smoke_puff_flat_sm
_pt.image_blend = global.colorGray
_pt.xVel = random_range(-0.3, -0.1)
_pt.yVel = random_range(-0.3, -0.1)

if (destroyedByHit) {
    var _gain = random_range(0.4, 0.6)
    var _pitch = random_range(0.9, 1.1)
    
    audio_play_random_sound(
        [snd_step_dirt_01, snd_step_dirt_02, snd_step_dirt_03],
        2,
        false,
        _gain,
        0,
        _pitch
    )
}
