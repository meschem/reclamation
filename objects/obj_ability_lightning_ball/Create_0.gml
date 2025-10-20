/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited()

name = "Ball Lightning"
description = "Summons powerful balls of lightning that orbit the caster."
selectionIcon = spr_abil_select_icon_ball_lit

maxCharges = 1
active = true

autoCast = true
canAutoCast = true

curCd = 0
maxCd = stf(15)

treeLevel = 3

projectileDistance = 100
projectileRotationRate = 2
projectileDuration = 480

distanceOffsetMax = 140
distanceOffsetMin = 50
rotationRateMax = 5
rotationRateMin = 1.5

projectileDamage = [10, 12, 12, 15, 20]
projectileCount = [3, 3, 4, 4, 4]

shortDistance = 40
quickRotationRate = 5

overloadDamage = 15
overloadRadius = 30

stats = [
	new abilityStat(
		"Damage", 
		"projectileDamage", 
		projectileDamage
	),
	new abilityStat(
		"Projectiles",
		"projectileCount",
		projectileCount
	)
]

statBonusStrongCurrent = new abilityStatBonus(
	enumCharStats.str, 18,
	"Strong Current",
	"Extends max distance when moving, but pulls it close when sitting still"
) 

statBonusOverload = new abilityStatBonus(
	enumCharStats.int, 10,
	"Overload",
	"Lightning orbs erupt with damage at the end of their lifespan"
)

statBonusRagingStorm = new abilityStatBonus(
	enumCharStats.int, 60,
	"Raging Storm",
	"Adds a secondary ring of projectiles that spin closer and in the opposite direction."
)

charStatBonuses = [statBonusStrongCurrent, statBonusOverload, statBonusRagingStorm]

//addRune("Close and Quick", "Orbs spin faster and closer")
//addRune("Overload", "Explodes on death")
//addRune("Blood Lightning", "Somehow deals blood damage")

use = function() {
	var angle, spawnLoc
	var count = projectileCount[level - 1] + get_player_stat(enumPlayerStats.bonusProjectileCount)
	var distance = projectileDistance
	var rotationRate = projectileRotationRate
	
	for (var i = 0; i < count; i++) {
		angle = (360 / count) * i
		spawnLoc = get_vec2_from_angle_mag(angle, distance)
		
		var inst = instance_create_depth(
			spawnLoc.x, spawnLoc.y,
			depths.playerProjectile,
			obj_jonah_lightning_ball
		)
		
		inst.attachedTo = obj_player
		inst.angle = angle
		inst.lifeSpan = projectileDuration + (i * 3)
		inst.distanceOffset = distance
		inst.rotationRate = rotationRate
		inst.damageDirect = projectileDamage[level - 1]
		inst.owner = owner
		
		inst.hasStrongCurrent = statBonusStrongCurrent.active
		inst.hasRagingStorm = statBonusRagingStorm.active
			
		inst.explodeOnDeath = statBonusOverload.active
		inst.distanceMax = -1	
	}
	
	if (statBonusRagingStorm.active) {
		for (var i = 0; i < count; i++) {
			angle = (360 / count) * i
			spawnLoc = get_vec2_from_angle_mag(angle, distance)
		
			var inst = instance_create_depth(
				spawnLoc.x, spawnLoc.y,
				depths.playerProjectile,
				obj_jonah_lightning_ball
			)
		
			inst.attachedTo = obj_player
			inst.angle = angle
			inst.lifeSpan = projectileDuration + 9 + (i * 3)
			inst.distanceOffset = distance / 2
			inst.rotationRate = -rotationRate
			inst.damageDirect = projectileDamage[level - 1]
			inst.owner = owner
		
			inst.hasStrongCurrent = statBonusStrongCurrent.active
			inst.hasRagingStorm = statBonusRagingStorm.active
			
			inst.explodeOnDeath = statBonusOverload.active
			inst.distanceMax = -1
			
			inst.distanceOffsetMax = distanceOffsetMax / 2
			inst.distanceOffsetMin = distanceOffsetMin / 2
		}
	}
}
