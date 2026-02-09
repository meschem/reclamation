event_inherited()

pickupValue = 5
lifeSpan = -1
sounds = [
    snd_bottlecap_1,
    snd_bottlecap_2,
    snd_bottlecap_3
]

accel = 0.024
maxSpeed = 12

reflectOffsetY = 7

starSprite = spr_white_star_sm
starAngle = 0
starRotationSpeed = 5

create_ribbon(id, obj_ribbon, 16, 2)

onPickup = function(_player) {
    var _sound = array_random(sounds)
    audio_play_sound(_sound, 0, false)
    
    var _inst = instance_create_depth(_player.x, _player.y, depth, obj_particle_additive_single_cycle)
    _inst.sprite_index = spr_particle_32_circle_boom
    _inst.image_xscale = 2
    _inst.image_yscale = 2
    _inst.image_speed = 1.5
    _inst.image_alpha = 0.6
    
    _inst = instance_create_depth(_player.x, _player.y, depth, obj_particle_fading_circle)
    _inst.radius = 64
    _inst.endScale = 0
    _inst.lifeSpan = stf(0.5)
}

u_texel_size  = shader_get_uniform(shd_glow, "u_vTexelSize")
u_glow_size   = shader_get_uniform(shd_glow, "u_fGlowSize")
u_glow_color  = shader_get_uniform(shd_glow, "u_vGlowColor")

var _tex = sprite_get_texture(sprite_index, 0)
texel_w = texture_get_texel_width(_tex)
texel_h = texture_get_texel_height(_tex)
