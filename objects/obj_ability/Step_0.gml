
if (!enabled || game_is_paused())
	return 0
	
if (ultimate && !iconLargeSet) {
	iconUiBackdrop = spr_ui_ability_backdrop_lg
	iconUiBorder = spr_ui_ability_border_lg
	iconUiFill = spr_ui_ability_cd_fill_lg
	iconFillHeight = 42
	
	iconLargeSet = true
}

if (activationCdCur > 0) {
	activationCdCur--
}

drawGui = obj_ui_controller.drawPlayerSkills

curCd = max(curCd - 1, 0)

if (ultimate) {
	iconCdFillRatio = owner.ultimateCharge / owner.ultimateChargeMax		
} else {
	iconCdFillRatio = (curCharges >= 1) ? 1 : 1 - (curCd / maxCd)
}

if (curCd <= 0) {
	if (autoCast) {
		var _valid = validateUse()
		
		if (_valid) {
			resetCooldown()
		
			activate()
		}
	} else if (curCharges < maxCharges) {
		curCharges++
		
		if (curCharges < maxCharges) {
			resetCooldown()
		}
	}
}
