/// @description Init

event_inherited()

angleSpriteToVelocity = false

//distanceMax = 150

rapidDeaccel = false
acceleration = -0.12
lifeSpan = stf(3.5)

damageDirect = 20
targetsMax = 9999
targetsHit = 0

knockback = 1

shadowSprite = spr_shadow_med
shadowOffsetY = 10

stepBegin = function() {
	image_angle += 10
}

onHit = function() {
	if (!rapidDeaccel) {
		rapidDeaccel = true
		acceleration =  -0.5
	}
}

impactSounds = [snd_punch_1, snd_punch_2, snd_punch_3]

audio_play_sound(snd_woosh, 1, false, 0.6, 0, random_range(0.8, 1.2))