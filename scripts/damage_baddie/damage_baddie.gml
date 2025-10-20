///@description						Deals damage to an enemy
///@param {Id.Instance}	target		Target instance to deal dmg to
///@param {real} amount				Amount of damage
///@param {bool} isCrit				If damage is critical (for visuals)
///@param {real} critMultiplier		Base crit multiplier from damage source
///@return {bool}					Returns whether or not the target is killed

function damage_baddie(target, amount, isCrit = false, critMultiplier = 2, force = 1) {
	var attacker = obj_player
	
	if (target == noone) {
		create_toaster("No target found for damage_baddie()", errorLevels.warning)
		return false
	}
	
	amount *= attacker.bonusDamageScalar
	
	if (target.debuffShockAmount > 0)
		critMultiplier += 1
		
	if (isCrit)
		amount *= critMultiplier
	
	target.hp -= amount

	// If show dmg numbers is on
	if (true) {
		var displayAmount = round(amount * 10)
		var damageStyle = damageTextStyles.normal
		
		if (isCrit) {
			damageStyle = damageTextStyles.crit
		}
		
		create_damage_text(target.x, target.y, amount, damageStyle)

	}

	if (target.hp <= 0) {
		target.lastDamageForce = force
		target.lastDamageAngle = point_direction(attacker.x, attacker.y, target.x, target.y)
		return true
	}
	
	target.markedForCrit = false
	target.damagedOn = target.age
	target.onDamaged()
	
	return false
}
