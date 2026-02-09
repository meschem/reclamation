/// @description Init

event_inherited()


angleSpriteToVelocity = false

distanceMax = 180

damageType = enumDamageTypes.cold
damageDirect = 10
targetsMax = 1
targetsHit = 0

bonusDamageOnBounce = 0
slowDuration = stf(1)

solidCollisionBehavior = projSolidCollisionBehaviors.bounce
bouncesMax = 0
bouncesCur = 0

deathParticleSpawnRange = 6

// damageFrameCooldown = 60 // not used yet...

knockback = 1

shadowSprite = spr_shadow_lg

trailColor = global.colorAqua
trailSpawnWidth = 8
trailLength = 8
trail = true

onBounce = function() {
	damageDirect += bonusDamageOnBounce
}

onHit = function(_target) {
	apply_slow(_target, slowDuration)
}

onDeathFx = function() {
	audio_play_random_sound([snd_ice_hit_01, snd_ice_hit_02,])
	spawn_fx_bouncers(
		[
			obj_ptb_dest_ice_chunk_med,
			obj_ptb_dest_ice_chunk_small,
			obj_ptb_dest_ice_chunk_small,
		],
		facingAngle
	)
}

impactSounds = [snd_punch_1, snd_punch_2, snd_punch_3]

audio_play_sound(snd_woosh, 1, false, 0.6, 0, random_range(0.8, 1.2))