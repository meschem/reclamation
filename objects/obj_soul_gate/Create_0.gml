///@description			Init
//spawnScalar = get_baddie_scaling(baddieScalars.spawnCount) * 4

//obj_run_controller.enemyScalingSpawnCount += spawnScalar

//create_toaster(obj_run_controller.enemyScalingSpawnCount)

age = 0
lifeSpan = stf(30)

spawnRate = 20
spawnBaddie = obj_none

xpGained = 0
drawScale = 1
pulseScale = 1.5
pulseFrameScale = 0.98

range = 300

eatSoul = function(_baddie) {
	xpGained += _baddie.xp
	drawScale = pulseScale
}

shadowSprite = spr_shadow_xxl
shadowOffset = 25

floatOffset = 0
floatRange = 2

surf = -1
radius = 200

activeAreaRadius = 200
activeAreaDrawWidth = 4
activeAreaDrawColor = get_color(colors.orange)

ringRadius = 0
ringDrawScale = 1
ringDrawFullTime = stf(5)