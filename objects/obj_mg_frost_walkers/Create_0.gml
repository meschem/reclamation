// Inherit the parent event
event_inherited()

name = "Frost Walkers"
description = "Permeates a deep cold through the earth itself."

active = false
rarity = enumRarity.rare

depth = depths.playerAura
auraObject = obj_aura_frost_walkers
auraImageSpeed = 10
auraActive = false
baseAuraRadius = 60
auraRadius = baseAuraRadius
auraCollision = ds_list_create()
auraRate = stf(1.5)
auraInstance = noone

slowDuration = stf(2)

age = 0

bonusMoveSpeed = 0.1

statsSpecial = [
	"Creats a Frost Aura that slows nearby enemies."
]

onEquip = function() {
	auraActive = true
	
	with (obj_mg_frost_walkers) {
		if (
			equipped &&
			id != other.id &&
			owner == other.owner
		) {
			other.auraActive = false
		}
	}
	
	if (auraActive) {
		auraRadius = baseAuraRadius * get_player_stat(enumPlayerStats.areaOfEffectScalar, owner)
		auraInstance = create_instance(auraObject)
		auraInstance.owner = owner
		auraInstance.radius = auraRadius
	}
}

onUnequip = function() {
	if (auraInstance != noone && instance_exists(auraInstance)) {
		instance_destroy(auraInstance)
	}
	
	with (obj_mg_frost_walkers) {
		if (
			equipped &&
			owner == other.owner
		) {
			onEquip()
			break
		}
	}
}

onStep = function() {
	age++
	
	if (age % 60 == 0) {
		auraRadius = baseAuraRadius * get_player_stat(enumPlayerStats.areaOfEffectScalar, owner)
	}
	
	if (!equipped || !auraActive) {
		return 0
	}
	
	if (owner == noone || !instance_exists(owner)) {
		return 0
	}
	
	if (age % auraRate != 0) {
		return 0
	}
	
	var _count = collision_circle_list(owner.x, owner.y, auraRadius, obj_baddie, false, true, auraCollision, false)

	if (_count > 0) {
		for (var i = 0; i < _count; ++i;) {
			var _inst = auraCollision[| i]
	        
			apply_slow(_inst, slowDuration)
			
			spawn_fx_small_burst(_inst.x, _inst.y, 8)
			spawn_fx(_inst.x, _inst.y, spr_particle_32_circle_boom)			
	    }
	}
	
	ds_list_clear(auraCollision)
}