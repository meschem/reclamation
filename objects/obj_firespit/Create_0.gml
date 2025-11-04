/// @description Init

event_inherited()

angleSpriteToVelocity = false

distanceMax = 150

damageDirect = 20
targetsMax = 1
targetsHit = 0

bonusDamageOnBounce = 0

//solidCollisionBehavior = projSolidCollisionBehaviors.bounce
bouncesMax = 0
bouncesCur = 0

// damageFrameCooldown = 60 // not used yet...

knockback = 1

shadowSprite = spr_shadow_med

//trailColor = get_color(colors.orange)
//trailSpawnWidth = 3
//trailLength = 8
//trail = true

create_ribbon(id)

//onBounce = function() {
//	damageDirect += bonusDamageOnBounce
//}

impactSounds = [snd_punch_1, snd_punch_2, snd_punch_3]

audio_play_sound(snd_woosh, 1, false, 0.6, 0, random_range(0.8, 1.2))