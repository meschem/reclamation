
curCd--

if (curCd <= 0) {
	curCd = maxCd
	
	var angleSpread = totalSpread / (maxAttacks - 1)
	var angle = facingAngle + (angleSpread * curAttack) - (totalSpread / 2)
	
	attack_war_hammer(angle)
	
	curAttack++
}

if (curAttack >= maxAttacks)
	instance_destroy()