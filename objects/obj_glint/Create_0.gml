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

minPitch = 0.8
maxPitch = 1.4

reflectOffsetY = 7

starSprite = spr_shine_glow
starAngle = 0
starRotationSpeed = 5

create_ribbon(id, obj_ribbon, 16, 2)

onPickup = function(_player) {
    var _xpPct = get_xp_percentage()
    var _pitchDiff = maxPitch - minPitch
    var _pitchAdd = _xpPct * _pitchDiff
    var _pitch = minPitch + _pitchAdd
    var _vol = random_range(0.9, 1.1)
    
    var _sound = array_random(sounds)
    audio_play_sound(_sound, 0, false, _vol, 0, _pitch)
    
    var _inst = instance_create_depth(x, y, depth, obj_particle)
    _inst.sprite_index = spr_particle_circle_lg_w
    _inst.image_xscale = 0.75
    _inst.image_yscale = 0.75
    _inst.image_alpha = 0.6
    _inst.changeAlpha = true
    _inst.alphaStart = 0.8
    _inst.alphaEnd = 0.4
    _inst.lifeSpan = stf(0.2)
    _inst.changeScale = true
    _inst.scaleStart = 0.75
    _inst.depth = depths.fx
    
    _inst = instance_create_depth(x, y, depth, obj_particle)
    _inst.sprite_index = spr_particle_circle_soft_hollow_lg_w
    _inst.lifeSpan = stf(0.3)
    _inst.changeAlpha = true
    _inst.changeScale = true
    _inst.image_xscale = 0.1
    _inst.image_yscale = 0.1
    _inst.scaleStart = 0.1
    _inst.scaleEnd = 1.2
    _inst.depth = depths.fx
}
