event_inherited()

pickupValue = 500

lifeSpan = -1

reflectOffsetY = 17

shadowSprite = spr_shadow_med
shadowOffset = 6
sounds = [
    snd_bottlecap_1,
    snd_bottlecap_2,
    snd_bottlecap_3
]

init_floating(2, 90)

onPickup = function(_player) {
    var _sound = array_random(sounds)
    audio_play_sound(_sound, 0, false)
}
