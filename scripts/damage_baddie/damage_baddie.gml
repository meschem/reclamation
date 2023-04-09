///@description					Deals damage to an enemy
///@param {Id.Instance}	target	Target instance to deal dmg to
///@param {real} amount			Amount of damage
///@param {bool} isCrit			If damage is critical (for visuals)
///@return {bool}				Returns whether or not the target is killed

function damage_baddie(target, amount, isCrit = false) {
	target.hp -= amount

	// If show dmg numbers is on
	if (true) {
		var inst = instance_create_depth(target.x, target.y, depths.ui, obj_moving_text)
		
		//inst.yVel = -2
		inst.xVel = random_range(-0.5, 0.5)
		
		if (isCrit) {
			inst.displayText = string(amount) + "!"
			inst.fontColor = c_orange
		} else {
			inst.displayText = string(amount)
		}
	}

	if (target.hp <= 0) {
		instance_destroy(target)
		return true
	}
	
	target.damagedOn = target.age
	
	return false
}