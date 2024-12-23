///@description		Setup

// Inherit the parent event
event_inherited()

name = "Toxic Swarm"
description = "Summons a swarm of toxic faeries that surround you while damaging and poisoning enemies. Faeries sleep for 2s after doing damage."
//onHitAbility = true
active = true
//selectionIcon = spr_abil_select_icon_bear_trap
treeLevel = 2

curCd = 0
maxCd = stf(1)

autoCast = true
canAutoCast = true

summonEntity = obj_toxic_swarm_faerie

damage = [30, 50, 50, 80, 80]
poisonDamageBonus = [5, 10, 15, 20, 30]
maxSummons = [4, 4, 6, 6, 10]



sleepDuration = stf(2)

//spawnRate = stf(0.25)

addRune("Wild Energy", "Extends the range in which the faeries fly around you.")
addRune("Vile Bombs", "Faeries have a 10% chance to explode on hit dealing AOE poison damage.")

stats = [
	new abilityStat(
		"Damage", "damage", damage
	),
	new abilityStat(
		"Poison Dmg Bonus", "poisonDamageBonus", poisonDamageBonus
	),
	new abilityStat(
		"Max Faeries", "maxSummons", maxSummons
	)
]

onLevel = function() {
	if (level == 1) {
		owner.bonusPoisonDamage += poisonDamageBonus[level - 1]
	} else {
		var _diff = poisonDamageBonus[level - 1] - poisonDamageBonus[level - 2]
		owner.bonusPoisonDamage += _diff
	}
}

use = function () {
	var _count = 0
	var _owner = owner
	
	with (obj_toxic_swarm_faerie) {
		if (owner == _owner) _count++
	}
	
	if (_count < maxSummons[level - 1]) {
		var _angle = random(360)
		var _distance = 100
		var _spawnOffset = get_vec2_from_angle_mag(_angle, _distance)
		
		var _inst = instance_create_depth(
			owner.x + _spawnOffset.x,
			owner.y + _spawnOffset.y,
			depths.player,
			summonEntity
		)

		_inst.owner = owner
		_inst.damage = damage[level - 1]
		//_inst.poisonStacksOnHit = poisonStacksOnHit[level - 1]
		_inst.seekTarget = owner
		_inst.sleepDuration = sleepDuration
	}
}
