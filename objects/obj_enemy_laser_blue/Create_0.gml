event_inherited();

enum laserStates {
	tell,
	growing,
	full,
	shrinking,
}

age = 0

shadowSprite = spr_none

state = laserStates.tell

laserSpriteGrowing = spr_laser_beam_growing
laserSpriteFull = spr_laser_beam
laserSpriteTell = spr_laser_beam_tell
laserSpriteShrinking = spr_laser_beam_shrinking
laserSpriteEndPiece = spr_laser_beam_end
laserSpriteEndPiecePos = new vec2()
laserRotationRate = 0
laserGrowthRate = 0
damageOnCollide = false

drawEndPiece = true

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

ringObject = obj_laser_ring
ringSpawnRate = stf(0.5)

destroyOnHit = false

xVel = 0
yVel = 0
accel = 0

range = 1200

image_angle = 270
image_xscale = 0 // 1200 / sprite_get_width

beginStep = function() {}
