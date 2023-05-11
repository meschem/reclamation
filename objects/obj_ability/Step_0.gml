
if (!enabled || game_is_paused())
	return 0
	
curCd = max(curCd - 1, 0)

if (curCd <= 0) {
	if (autoCast) {
		curCd = maxCd
		
		activate()
	} else if (curCharges < maxCharges) {
		curCharges++
		
		if (curCharges < maxCharges) {
			curCd = maxCd
		}
	}
}

//if (autoCast && curCd <= 0) {
//	curCd = maxCd
		
//	activate()
//}
