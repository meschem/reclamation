/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited()

name = "Shield Wall"
description = "Shields spin around the caster. Damages and knocks enemies back. Respawns a single shield on cast."
selectionIcon = spr_abil_select_icon_ball_lit

maxCharges = 1
active = true

autoCast = true
canAutoCast = true

iconColor = enumAbilityColor.orange

curCd = 0
maxCd = stf(1)

treeLevel = 3

projectile = obj_jonah_shield_orbital
projectileDistance = 45
projectileRotationRate = 2
projectileDuration = -1

distanceOffsetMax = 140
distanceOffsetMin = 50
rotationRateMax = 5
rotationRateMin = 1.5

projectileDamage = [10, 15, 20, 30, 30]
projectileCount = [3, 3, 4, 5, 6]
cooldown = [stf(1), stf(0.8), stf(0.7), stf(0.6), stf(0.5)]

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
		"Max Shields",
		"projectileCount",
		projectileCount
	),
	new abilityStat(
		"Cooldown",
        "cooldown",
        cooldown,
        true,
        statUnits.seconds
	)
]

statBonusStunningStrike = new abilityStatBonus(
	enumCharStats.str, 25,
	"Stunning Strike",
	"Stuns non-boss and non-elite units on hit for 1s."
) 

statBonusStunningStrike.onActivate = function() {
    with (projectile) { stunningStrike = true }
}

statBonusStunningStrike.onDeactivate = function() {
    with (projectile) { stunningStrike = false }
}

statBonusShockloaded = new abilityStatBonus(
	enumCharStats.int, 20,
	"Shock Loaded",
	"Deals 50% of base damage lightning damage in a small area on hit, also applying Shock."
)

statBonusShockloaded.onActivate = function() {    
    with (projectile) {
        sprite_index = spr_shield_wall_lit_segment
        shockLoaded = true
    }
}

statBonusShockloaded.onDeactivate = function() {
    with (projectile) {
        sprite_index = spr_shield_wall_segment
        shockLoaded = false
    }
}

statBonusRapidDefense = new abilityStatBonus(
	enumCharStats.dex, 25,
	"Rapid Defense",
	"Doubles shield rotation rate."
)

statBonusRapidDefense.onActivate = function() {    
    with (projectile) { rotationRate = other.projectileRotationRate * 2 }
}

statBonusRapidDefense.onDeactivate = function() {
    with (projectile) { rotationRate = other.projectileRotationRate }
}

charStatBonuses = [statBonusStunningStrike, statBonusShockloaded, statBonusRapidDefense]

//addRune("Close and Quick", "Orbs spin faster and closer")
//addRune("Overload", "Explodes on death")
//addRune("Blood Lightning", "Somehow deals blood damage")

use = function() {
    with (projectile) {
        if (!active) {
            active = true
            
            exit
        }
    }
}

onLevel = function() {
    with (projectile) {
        if (owner == other.owner) {
            instance_destroy()
        }
    }

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
			projectile
		)
		
		inst.attachedTo = obj_player
		inst.angle = angle
		//inst.lifeSpan = projectileDuration + (i * 3)
		inst.distanceOffset = distance
		inst.rotationRate = rotationRate 
		inst.damageDirect = projectileDamage[level - 1]
		inst.owner = owner
        
        if (statBonusStunningStrike.active) {
            inst.stunningStrike = true
        }
        
        if (statBonusShockloaded.active) {
            inst.shockLoaded = true
        }
        
        if (statBonusRapidDefense.active) {
            inst.rotationRate *= 2
        }
		
		//inst.hasStrongCurrent = statBonusStrongCurrent.active
		//inst.hasRagingStorm = statBonusRagingStorm.active
			
		//inst.explodeOnDeath = statBonusOverload.active
		inst.distanceMax = -1	
		
		inst.image_xscale = 0.75 * get_player_stat(enumPlayerStats.areaOfEffectScalar)
		inst.image_yscale = inst.image_xscale
	}
}
