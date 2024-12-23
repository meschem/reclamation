event_inherited();

enum laserStates {
	tell,
	growing,
	full,
	shrinking,
}

shadowSprite = spr_none

state = laserStates.tell

laserSpriteGrowing = spr_laser_beam_growing
laserSpriteFull = spr_laser_beam
laserSpriteTell = spr_laser_beam_tell
laserSpriteShrinking = spr_laser_beam_shrinking
laserRotationRate = 0
damageOnCollide = false

tellDuration = stf(2)
lifeSpan = -1
duration = stf(5)

starSpriteTell = spr_laser_star_tell
starSpriteGrowing = spr_laser_star
starSpriteFull = spr_laser_star
starSprite = spr_laser_star_tell
starRotationRate = 2
starAngle = 0
starImageIndex = 0
starSpriteScaleX = 1
starSpriteScaleY = 1
ringSpawnRate = stf(0.5)
destroyOnHit = false

xVel = 0
yVel = 0
accel = 0

image_angle = 270
image_xscale = 1200 / sprite_width
