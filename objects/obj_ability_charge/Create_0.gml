/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Charge"
description = "Become invulnerable and charge in a given direction. Release hotkey to impact with the next target."
selectionIcon = spr_abil_select_icon_charge
active = true

curCd = 0
maxCd = 600

enabled = false

treeLevel = 1

chargeSpeed = 3
maxLength = 400
damage = [40, 70, 100, 100, 100]
impactDamage = [100, 100, 200, 200, 250]
stunLength = [4, 4, 5, 5, 6]
knockback = 25
maxHalvingDamage = 100

shockRadius = 60

// used to prevent repeat collisions to a single target
collisionList = ds_list_create()

array_push(tags, abilityTags.movement)

stats = [
	new abilityStat(
		"Damage", "baseDamage", 
		damage
	),
	new abilityStat(
		"Impact Damage", "impactDamage", 
		impactDamage
	),
	new abilityStat(
		"Stun Length", "stunLength", 
		stunLength
	)
]

addRune("Piercing", "Charge goes through small targets, knocking them aside")
addRune("Decimate", "Halves a target's health")
addRune("Static Charge", "Adds lightning damage based on distance traveled")

use = function() {
	// logic is largely handled in:
	//     player_movement_input()
	//     charge_collision()
	//	   player_collision()
	
	ds_list_clear(collisionList)
	activate_charge(owner)
}

///@description						Collision with a target while running
///@param {id.Instance} _target		Target player collided with
collision = function(_target) {
	if (ds_list_find_index(collisionList, _target) == -1) {
		audio_play_sound(snd_big_slap, 1, 0)
		ds_list_add(collisionList, _target)
		damage_baddie(_target, damage[level - 1])
		spawn_fx(_target.x, _target.y, spr_particle_32_circle_boom)
		knockback_baddie(
			_target, 
			knockback, 
			get_angle(owner.xVel, owner.yVel) + (90 * random_sign())
		)
	}
}

///@description						Collision with a final target
///@param {id.Instance} _target		Target player collided with
finalCollision = function(_target) {
	var xOffset = get_angle_xvel(owner.moveAngle) * 6
	var yOffset = get_angle_yvel(owner.moveAngle) * 6
					
	charge_collision(x + xOffset, y + yOffset, owner.moveAngle, _target)
}

///@description						Calculates shock damage
///@param {real} _distance			Distance to target
getShockDamage = function(_distance) {
	return (_distance / 10) + 10
}
