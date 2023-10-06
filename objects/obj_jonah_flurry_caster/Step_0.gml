
curCd--

var velocityScalar = obj_ability_flurry.runes[enumRunes.voldan].enabled ? 1.333 : 1

//create_debug_arrow(obj_player.x, obj_player.y, facingAngle)

if (curCd <= 0) {
	curCd = maxCd

	var angle = 0
	var angleSpread = 0
	var proj = noone

	if (splitFromMiddle) {
		if (curAttack == 0) {
			proj = attack_war_hammer(owner, facingAngle)
			proj.damageDirect += bonusDamage
			velocity_multiply(proj, velocityScalar)
		} else if (curAttack == maxAttacks) {
			proj = attack_war_hammer(owner, facingAngle + 180)
			velocity_multiply(proj, velocityScalar)
		} else {
			angleSpread = totalSpread / (maxAttacks - 1)
			angle = (angleSpread * curAttack)

			proj = attack_war_hammer(owner, facingAngle + angle)
			velocity_multiply(proj, velocityScalar)

			proj = attack_war_hammer(owner, facingAngle - angle)
			velocity_multiply(proj, velocityScalar)
		}
	} else {
		angleSpread = totalSpread / (maxAttacks - 1)
		angle = (angleSpread * curAttack) - (totalSpread / 2)

		proj = attack_war_hammer(owner, angle)
		
		velocity_multiply(proj, velocityScalar)
	}		

	curAttack++
}

if (curAttack >= maxAttacks) {
	instance_destroy()
}
