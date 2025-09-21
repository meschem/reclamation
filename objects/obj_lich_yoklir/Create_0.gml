///@description						Init

// Inherit the parent event
event_inherited()

enum lichBossStates {
	init,
	idle,
	reposition,
	chasing,
	frostBeams,
	iceStorm,
	dying,
	null,
}

attackStates = [
	lichBossStates.chasing,
	lichBossStates.frostBeams,
	lichBossStates.iceStorm
]

damageStage = 0

lastAttack = hydraLordStates.null
queuedAttack = hydraLordStates.null

name = "Yoklir"
description = "Frost-cursed Lich of the North"

weight = 25
immovable = true
wrapAroundBehavior = wrapAroundBehaviors.none

bossScale = 1

hpMax = 1500
hp = hpMax

accel = baddie_move_accel_med
moveSpeedMax = baddie_move_speed_fast
targetStopDistanceCushion = 24
damageReactionScaleScalar = 0.4

stateAge = 0
stateAgeMax = 0
stateMod = 0						/// Use for whatever in states

idleTimeMin = stf(2)
idleTimeMax = stf(3)

targetLocation = new vec2()
target = noone

shadowSprite = spr_shadow_lg
//floatRange = 2
moveRotationRate = 1
flies = true

create_boss_health_bar(id)

moveBehavior = entityMoveBehaviors.none

diesAtZeroHp = false

dyingParticles = [
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
]

deathParticles = [
	obj_ptb_lich_crown,
	obj_ptb_lich_shield,
	obj_ptb_lich_scepter_a,
	obj_ptb_lich_scepter_b,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_skull_blue,
	obj_ptb_skel_ribs_blue
]

movePoints = {
	center: get_move_point_by_index(0),
	top: get_move_point_by_index(1)
}

hydraState = -1

lichState = lichBossStates.init
queuedAttack = lichBossStates.null

iceProjectile = obj_enemy_blue_shot

iceBlastSwarmCdMax = stf(2)
iceBlastSwarmCd = iceBlastSwarmCdMax

iceBlastSwarmFiringCdMax = 60
iceBlastSwarmFiringCd = 0
iceBlastSwarmFireRate = 5

frostBeamsLaserCount = 6
frostBeamsUberHpRatio = 1
frostBeamsUberFirstUsed = false
frostBeamsFlakeCount = 3

beginStep = function() {
	if (age % 50 == 0) {
		var _fx = spawn_fx_attached(obj_particle_single_cycle_attached, id, 19, -18)
		
		_fx.sprite_index = spr_particle_lightning_medium
		_fx.image_angle = random(360)
		_fx.image_xscale = 0.5
		_fx.image_yscale = 0.5
		_fx.xVel = random_range(-0.5, 0.5)
		_fx.yVel = random_range(-0.5, 0.5)
	}
}

onDestroy = function() {
	curse_increase_max(1)
}

///@description						Queues an attack from remaining list
///@return {real}
getRandomAttack = function() {
	var _attack = -1
	
	if (hp < (hpMax * 0.5) && !frostBeamsUberFirstUsed) {
		frostBeamsUberFirstUsed = true
		lastAttack = lichBossStates.frostBeams
		return lichBossStates.frostBeams
	}
	
	attackStates = array_shuffle(attackStates)
	
	for (var i = 0; i < array_length(attackStates); i++) {
		if (attackStates[i] != lastAttack) {
			_attack = attackStates[i]
		}
	}
	
	if (_attack == -1) {
		show_message("Error selecting attack")
		show_message(attackStates)
	}
	
	return _attack
}

///@description						Chooses an attack state to transition to. 
idleRandomAttackState = function() {
	var _attack = getRandomAttack()
	lastAttack = _attack
	
	target = get_first_player()
	
	stateAge = 0
	
	/***							***/
	//_attack = lichBossStates.iceStorm
	/***							***/
	
	switch (_attack) {
		case lichBossStates.chasing:
			stateIdleToChasing()
		break
		
		case lichBossStates.frostBeams:
			queuedAttack = _attack
			stateIdleToReposition(movePoints.center)
		break
		
		case lichBossStates.iceStorm:
			queuedAttack = _attack
			stateIdleToReposition(movePoints.top)
		break
	}
}


///@description						Init state
stateInit = function() {
	create_toaster("Idle Init")
	stateAge = 0
	
	lichState = lichBossStates.idle

	stateAgeMax = stf(1)
}

///@description						Repositions, relies on queued attack
///@param {struct.vec2} _location	Location to reposition to
stateIdleToReposition = function(_location) {
	stateAge = 0
	lichState = lichBossStates.reposition
	
	targetLocation = _location
}

///@description						Chase mode
stateIdleToChasing = function() {
	create_toaster("Idle to Chasing")
	stateAge = 0
	stateAgeMax = stf(9)
	
	iceBlastSwarmCd = iceBlastSwarmCdMax
	
	moveBehavior = entityMoveBehaviors.charge
	
	lichState = lichBossStates.chasing
}

///@description						Intermediate state to select the queued attack
stateRepositionToQueuedAttack = function() {
	xVel = 0
	yVel = 0

	if (queuedAttack == lichBossStates.frostBeams) {
		stateAnyToFrostBeams()
	}
	
	else if (queuedAttack == lichBossStates.iceStorm) {
		stateAnyToIceStorm()
	}
	
	else {
		create_toaster($"Error queuing attack ID: {queuedAttack}", errorLevels.error)
	}
	
	queuedAttack = lichBossStates.null
}

stateAnyToFrostBeams = function() {
	stateAge = 0
	stateMod = 0
	lichState = lichBossStates.frostBeams
	
	stateAgeMax = stf(7)
}

stateAnyToIceStorm = function() {
	stateAge = 0
	lichState = lichBossStates.iceStorm
	
	stateAgeMax = stf(5)
}

///@description						Go back to idle from an attack
stateAttackToIdle = function() {
	create_toaster("Attack TO Idle")
	stateAge = 0
	
	lichState = lichBossStates.idle
	
	stateAgeMax = irandom_range(idleTimeMin, idleTimeMax)
}


stateDying = function() {
	stateAge = 0
	moveBehavior = entityMoveBehaviors.none
	xVel = 0
	yVel = 0
	
	with (obj_enemy_projectile) {
		instance_destroy()
	}
	
	with (obj_spawner) {
		instance_destroy()
	}
	
	with (obj_baddie) {
		hp = 0
	}
	
	lichState = lichBossStates.dying
}
