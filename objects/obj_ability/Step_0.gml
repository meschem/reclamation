
if (!enabled || game_is_paused())
	return 0
	
if (activationCdCur > 0) {
	activationCdCur--
}
	
curCd = max(curCd - 1, 0)

if (curCd <= 0) {
	if (autoCast) {
		resetCooldown()
		
		activate()
	} else if (curCharges < maxCharges) {
		curCharges++
		
		if (curCharges < maxCharges) {
			resetCooldown()
		}
	}
}
