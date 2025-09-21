/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

laserSpriteGrowing = spr_laser_beam_growing_grn
laserSpriteFull = spr_laser_beam_grn
laserSpriteTell = spr_laser_beam_tell_grn
laserSpriteShrinking = spr_laser_beam_shrinking_grn
laserSpriteEndPiece = spr_laser_beam_end_grn

starSpriteTell = spr_laser_star_tell_grn
starSpriteGrowing = spr_laser_star_grn
starSpriteFull = spr_laser_star_grn
starSprite = spr_laser_star_tell_grn

tellDuration = stf(0.2)
duration = stf(2.4)

laserRotationRate = 2
laserGrowthRate = 1
range = 30
ringObject = obj_laser_ring_grn