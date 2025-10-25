
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

//if (ultimate) {
//	kbIcon = spr_btn_kb_t
//} else {
	
//}

//if (active && !hotkeySet) {
//	var ascii = -1
	
//	hotkeySet = true
	
//	if (ultimate) {
//		ascii = owner.kmInput.useUltimate
//	} else if (treeLevel < 4) {
//		ascii = owner.kmInput.useAbility[treeLevel]
//	}
	
//	switch (ascii) {
//		case 69: 
//			hotkey = "Q"
//			controllerIcon = spr_btn_xbox_rt
//		break
			
//		case 71:
//			hotkey = "T"
//			controllerIcon = spr_btn_xbox_lb
//		break
			
//		case 82: 
//			hotkey = "E"
//			controllerIcon = spr_btn_xbox_lt
//		break
			
//		case 84: 
//			hotkey = "R"
//			controllerIcon = spr_btn_xbox_rb
//		break

//		default: 
//			hotkey = string(ascii)
//		break
//	}
//}