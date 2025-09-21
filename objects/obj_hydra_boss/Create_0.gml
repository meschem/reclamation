///@description						Init

// Inherit the parent event
event_inherited()

enum hydraLordStates {
	init,
	idleAggressive,
	idleMover,
	reposition,
	multiLob,
	spreadBlast,
	chaosSpit,
	dying,
	null,
}

enum hydraLordRepositionStyles {
	randomFar,
	randomNear,
	top,
	
}

attacksDefault = [
	hydraLordStates.multiLob,
	hydraLordStates.spreadBlast,
	hydraLordStates.chaosSpit
]

damageStage = 0

attacksAvailable = []

lastAttack = hydraLordStates.null

array_copy(attacksAvailable, 0, attacksDefault, 0, array_length(attacksDefault))

name = "Hydra Lord"
description = "Serpent from the Deep"

moveSpeedMax = 0.35
weight = 25
immovable = true
wrapAroundBehavior = wrapAroundBehaviors.none

bossScale = 1

hpMax = 1500
hp = hpMax

accel = baddie_move_accel_med
moveSpeedMax = baddie_move_speed_very_fast
targetStopDistanceCushion = 24
walkAnimType = entityWalkAnimTypes.curves
damageReactionScaleScalar = 0.4

stateAge = 0
stateAgeMax = 0
stateMod = 0						/// Use for whatever in states

idleTimeMin = stf(1)
idleTimeMax = stf(3)

targetLocation = new vec2()
target = noone

create_boss_health_bar(id)

moveBehavior = entityMoveBehaviors.none

diesAtZeroHp = false

deathParticles = [
	obj_ptb_serpent_chunk_red
]

movePoints = {
	top: get_move_point_by_index(0),
	right: get_move_point_by_index(1),
	bottom: get_move_point_by_index(2),
	left: get_move_point_by_index(3),
	center: get_move_point_by_index(4)
}

hydraState = hydraLordStates.init
queuedAttack = hydraLordStates.null

multiLobProjectile = obj_hydra_lord_lob_shot

onDestroy = function() {
	curse_increase_max(1)
}

///@description						Gets multiple random play points
///@param {real} _count				Amount of points to grab
///@return {array<struct.vec2>}
getRandomPlayPoints = function(_count = 4) {
	var _points = []
	var _point = new vec2()
	
	for (var i = 0; i < _count; i++) {
		_point = get_random_play_point()
		
		array_push(_points, _point)
	}
	
	return _points
}

///@description						Queues an attack from remaining list
queueRandomAttack = function() {
	//show_message(attacksAvailable)
	if (array_length(attacksAvailable) == 0) {
		array_copy(attacksAvailable, 0, attacksDefault, 0, array_length(attacksDefault))
	}
	
	var _randomAttacks = array_shuffle(attacksAvailable)
	var _attack = hydraLordStates.null
	var _attackIndex = 0
	
	for (var i = 0; i < array_length(attacksAvailable); i++) {
		if (attacksAvailable[i] != lastAttack) {
			_attack = attacksAvailable[i]
			_attackIndex = i
			break
		}
	}
	
	//show_message($"Attack: {_attack}")
	//show_message(attacksAvailable)
	//show_message(_attackIndex)
	
	if (_attack == hydraLordStates.null) {
		show_message($"Error selecting attack: lastAttack={lastAttack}")
		show_message(attacksAvailable)
	}
	
	array_delete(attacksAvailable, _attackIndex, 1)
	
	//show_message(attacksAvailable)
	
	queuedAttack = _attack	
}

///@description						Chooses an attack state to transition to. 
chooseAttackState = function() {
	var _attack = -1
	
	if (queuedAttack != hydraLordStates.null) {
		_attack = queuedAttack
	} else {
		if (array_length(attacksAvailable) == 0) {
			array_copy(attacksAvailable, 0, attacksDefault, 0, array_length(attacksDefault))
		}
	
		_attack = array_random(attacksAvailable)
	
		array_delete(attacksAvailable, _attack, 0)
	}
	
	hydraState = _attack
	target = get_first_player()
	
	switch (_attack) {
		case hydraLordStates.multiLob:
			stateRepositionToMultiLob()
		break
		
		case hydraLordStates.spreadBlast:
			stateRepositionToSpreadBlast()
		break
		
		case hydraLordStates.chaosSpit:
			stateRepositionToChaosSpit()
		break
	}
}

///@description						Init state
stateInit = function() {
	create_toaster("Idle Init")
	stateAge = 0
	
	hydraState = hydraLordStates.idleMover
	
	stateAgeMax = irandom_range(idleTimeMin, idleTimeMax)
}

///@description						Go back to idle from an attack
stateAttackToIdle = function() {
	create_toaster("Attack TO Idle")
	stateAge = 0
	
	hydraState = hydraLordStates.idleMover
	
	stateAgeMax = irandom_range(idleTimeMin, idleTimeMax)	
}

///@description						Primary state after queuing an attack
stateIdleMoverToReposition = function() {
	create_toaster("IdleMover TO Reposition")
	stateAge = 0
	
	hydraState = hydraLordStates.reposition
	
	var _curPoint = new vec2()
	
	if (queuedAttack == hydraLordStates.spreadBlast) {
		_curPoint = movePoints.top
	} else if (queuedAttack == hydraLordStates.chaosSpit) {
		_curPoint = movePoints.center
	} else {
		var _points = getRandomPlayPoints()
		var _distance = 0
		var _maxDistance = 0
	
		for (var i = 0; i < array_length(_points); i++) {
			_distance = point_distance(x, y, _points[i].x, _points[i].y)
		
			if (_distance > _maxDistance) {
				_curPoint = _points[i]
				_maxDistance = _distance
			}
		}
	}
	
	targetLocation = _curPoint
}

stateRepositionToMultiLob = function() {
	create_toaster("Reposition to Multi Lob")
	stateAge = 0
	
	hydraState = hydraLordStates.multiLob
}

stateRepositionToSpreadBlast = function() {
	create_toaster("Reposition to Spread Blast")
	stateAge = 0
	stateMod = 0
	
	hydraState = hydraLordStates.spreadBlast
}

stateRepositionToChaosSpit = function() {
	create_toaster("Reposition to Chaos Spit")
	stateAge = 0
	
	hydraState = hydraLordStates.chaosSpit
}

stateDying = function() {
	stateAge = 0
	
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
