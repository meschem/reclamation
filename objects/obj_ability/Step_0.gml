
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

var ascii = owner.kmInput.useAbility[treeLevel]
	
switch (ascii) {
	case 69: 
		hotkey = "Q"
		controllerIcon = spr_btn_xbox_rt
	break
			
	case 71:
		hotkey = "T"
		controllerIcon = spr_btn_xbox_lb
	break
			
	case 82: 
		hotkey = "E"
		controllerIcon = spr_btn_xbox_lt
	break
			
	case 84: 
		hotkey = "R"
		controllerIcon = spr_btn_xbox_rb
	break

	default: 
		hotkey = string(ascii)
	break
}