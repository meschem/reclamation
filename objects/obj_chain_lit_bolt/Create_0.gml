event_inherited()

image_alpha = 0

lifeSpan = 240

shadowSprite = spr_none

seeking = true
maxTurnRate = 360
moveSpeedMax = 8
damageFrameCooldown = 120
damageDirect = 20

respawnCount = obj_ability_shock.getMaxBounces()

bounceDistanceMax = 120

reseekBehavior = reseekBehaviors.acquireNearest

spawnPoint = new vec2(x, y)

onCollideFx = function (target) {
	chain_lightning_collide(id, target)
}
