
var _uiFocusType = get_ui_focus_type()

if (!focused) {
	if (_uiFocusType == uiFocusTypes.skillDetails) {
		onFocus()
	} else {
		return 0
	}
} else {
	if (_uiFocusType != uiFocusTypes.skillDetails) {
		onEndFocus()
		
		return 0
	}
}

var _dir = get_player_4_direction_input()
var _selectChange = false

switch (_dir) {
	case enumDirectionInput.up:
		obj_ui_controller.getUiFocusFromDirection(0, -1)
	break
	
	case enumDirectionInput.left:
		selectedIndex--
		_selectChange = true
	break
	
	case enumDirectionInput.right:
		selectedIndex++
		_selectChange = true
	break
}

if (_selectChange) {
	if (selectedIndex < 0) {
		selectedIndex = array_length(abilities) - 1
	} else if (selectedIndex >= array_length(abilities)) {
		selectedIndex = 0
	}
	
	selectedAbility = abilities[selectedIndex]
	infobox.updateAbility(selectedAbility)
	selector.sprite_index = selectedAbility.ultimate ? spr_ability_slot_highlight_lg : spr_ability_slot_highlight
}

if (instance_exists(selector)) {
	selector.x = selectedAbility.iconX
	selector.y = selectedAbility.iconY
}


