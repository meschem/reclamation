///@description						Deals damage to an enemy
///@param {Id.Instance}	target		Target instance to deal dmg to
///@param {real} amount				Amount of damage
///@param {bool} isCrit				If damage is critical (for visuals)
///@param {real} critMultiplier		Base crit multiplier from damage source
///@return {bool}					Returns whether or not the target is killed

function damage_baddie(target, amount, isCrit = false, critMultiplier = 2) {
	var attacker = get_player_target()
	
	amount *= attacker.bonusDamageScalar
	
	if (target.debuffShockAmount > 0)
		critMultiplier += 1
		
	if (isCrit)
		amount *= critMultiplier
	
	target.hp -= amount

	// If show dmg numbers is on
	if (true) {
		var inst = instance_create_depth(target.x, target.y, depths.ui, obj_moving_text)
		
		//inst.yVel = -2
		inst.xVel = random_range(-0.5, 0.5)
		
		var displayAmount = round(amount)
		
		if (isCrit) {
			inst.displayText = string(round(displayAmount)) + "!"
			inst.fontColor = c_orange
		} else {
			inst.displayText = string(round(displayAmount))
		}
	}

	if (target.hp <= 0) {
		//instance_destroy(target)
		return true
	}
	
	target.markedForCrit = false
	target.damagedOn = target.age
	
	return false
}