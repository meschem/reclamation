
if (!isOpen || !isSetup) {
	return 0
}

var _uiFocusType = get_ui_focus_type()

if (!focused) {
	if (_uiFocusType == uiFocusTypes.statDetails) {
		onFocus()
	} else {
		return 0
	}
} else {
	if (_uiFocusType != uiFocusTypes.statDetails) {
		onEndFocus()
		
		return 0
	}
}

var _dir = get_player_4_direction_input()
var _selectChange = false

switch (_dir) {
	case enumDirectionInput.up:
		selectedIndex--
		_selectChange = true		
	break
	
	case enumDirectionInput.down:
		selectedIndex++
		_selectChange = true
	break
	
	case enumDirectionInput.right:
		obj_ui_controller.getUiFocusFromDirection(1, 0)
	break
}

if (_selectChange) {
	if (selectedIndex < 0) {
		selectedIndex = array_length(slots) - 1
	} else if (selectedIndex >= array_length(slots)) {
		selectedIndex = 0
	}

	selectedStat = slots[selectedIndex]
	
	infobox.updateStat(selectedStat)
}

if (instance_exists(selector)) {
	selector.y = getStatUiOffsetY() - 2
}
