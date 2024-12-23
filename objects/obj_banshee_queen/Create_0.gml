/// @description Init

event_inherited()

enum bansheeQueenStates {
	idle,
	castingChaosOrbs,
	castingLasers,
	laserRecovery,
	dying
}

name = "Maedragora"
description = "Banshee Queen"

xp = baddie_xp_boss
hpMax = 2500
hp = hpMax
diesAtZeroHp = false

weight = baddie_weight_immovable
immovable = true
damageReactionLength = 0
feetOffset = 54

laserPointGroupCount = 2

moveBehavior = entityMoveBehaviors.none

shadowSprite = spr_banshee_queen_shadow
shadowOffset = -5

add_baddie_limb("head", obj_banshee_queen_head, new vec2(1, -29))
add_baddie_limb("arms", obj_banshee_queen_arms, new vec2(2, 15))

add_baddie_gold_brutal_boss

create_boss_health_bar(id)

stateAge = 0
bansheeState = bansheeQueenStates.idle

beginStep = run_banshee_queen_step

onDamaged = function() {
	if (bansheeState == bansheeQueenStates.idle) {
		if (hp < random(hpMax)) {
			limbs.head.sprite_index = spr_banshee_queen_head_hurt
			limbs.head.hitReactionFrame = limbs.head.age
		}
	}
}

stateIdleToCastingChaosOrbs = function() {
	stateAge = 0
	
	limbs.arms.sprite_index = spr_banshee_queen_arms_casting
	limbs.head.sprite_index = spr_banshee_queen_head_focus
	
	bansheeState = bansheeQueenStates.castingChaosOrbs
}

stateCastingChaosOrbsToIdle = function() {
	stateAge = 0
	
	limbs.arms.sprite_index = spr_banshee_queen_arms_normal
	limbs.head.sprite_index = spr_banshee_queen_head_norm
	
	instance_create_depth(x, y, 0, obj_chaos_orb_spawner)
	
	bansheeState = bansheeQueenStates.idle
}

stateIdleToCastingLasers = function() {
	stateAge = 0
	
	limbs.arms.sprite_index = spr_banshee_queen_arms_casting
	limbs.head.sprite_index = spr_banshee_queen_head_focus
	
	bansheeState = bansheeQueenStates.castingLasers	
}

stateCastingLasersToRecovery = function() {
	stateAge = 0
	
	limbs.arms.sprite_index = spr_banshee_queen_arms_normal
	limbs.head.sprite_index = spr_banshee_queen_head_norm
	
	//activate_fire_point_group(1)
	activate_fire_point_group(irandom(laserPointGroupCount - 1))
	
	bansheeState = bansheeQueenStates.laserRecovery
}

stateLaserRecoveryToIdle = function() {
	stateAge = 0
	
	bansheeState = bansheeQueenStates.idle
}

stateDying = function() {
	stateAge = 0
	
	limbs.arms.sprite_index = spr_banshee_queen_arms_normal
	limbs.head.sprite_index = spr_banshee_queen_head_hurt
	
	with (obj_enemy_projectile) {
		instance_destroy()
	}
	
	with (obj_spawner) {
		instance_destroy()
	}
	
	with (obj_baddie) {
		hp = 0
	}
	
	bansheeState = bansheeQueenStates.dying
}