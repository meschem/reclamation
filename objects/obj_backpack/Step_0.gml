
if (!isOpen) {
	return 0
}

if (!focused) {
	if (obj_ui_controller.focusType == uiFocusTypes.inventory) {
		setFocusState(true)
	}
	
	return 0
}

var _prompt = instance_number(obj_destroy_merger_confirm_menu) > 0

if (_prompt) {
	return 0
}

//Temp item testing
if (keyboard_check_pressed(ord("O"))) {
	var _item = create_instance(array_random(randomItems))
	
	_item.owner = get_first_player()
	
	addItem(_item)
}

selectChange.x = 0
selectChange.y = 0

var _dir = get_player_4_direction_input()
var _selectChange = false

switch (_dir) {
	case enumDirectionInput.up:
		selectChange.y = -1
		_selectChange = true		
	break
	
	case enumDirectionInput.down:
		selectChange.y = 1
		_selectChange = true
	break
	
	case enumDirectionInput.right:
		selectChange.x = 1
		_selectChange = true
	break
	
	case enumDirectionInput.left:
		selectChange.x = -1
		_selectChange = true
	break
}

//if (keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu)) {
//	selectChange.y = -1
//}

//if (keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl)) {
//	selectChange.x = -1
//}

//if (keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd)) {
//	selectChange.y = 1
//}

//if (keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr)) {
//	selectChange.x = 1
//}

if (
	keyboard_check_pressed(inputsKeyboard.toggleMerge) ||
	gamepad_button_check_pressed(0, inputsController.toggleMerge)
) {
	toggleMergeForSelected()
} else if (
	keyboard_check_pressed(inputsKeyboard.merge) ||
	gamepad_button_check_pressed(0, inputsController.merge)
) {
	activateMerge()
	itemInfoBox.updateItem(slots[selectedSlot].item)
} else if (
	keyboard_check_pressed(inputsKeyboard.swap) ||
	gamepad_button_check_pressed(0, inputsController.swap)
) {
	activateSwap()
	itemInfoBox.updateItem(slots[selectedSlot].item)
}

//				CLOSE FUNCTIONALITY SHOULD BE IN UI CONTROLLER
//else if (
//	keyboard_check_pressed(inputsKeyboard.close) ||
//	gamepad_button_check_pressed(0, inputsController.close)
//) {
//	close()
//	return 0
//}

var _testSlot = noone

if ((selectChange.x != 0) || (selectChange.y != 0)) {
	selectChangeFocusShift(selectChange.x, selectChange.y)
}

if (selectChange.x != 0) {
	_testSlot = getSlot(selector.position.x + selectChange.x, selector.position.y)
	
	if (_testSlot >= 0) {
		selector.position.x += selectChange.x
		selectedSlot = _testSlot
	}
} else if (selectChange.y != 0) {
	_testSlot = getSlot(selector.position.x, selector.position.y + selectChange.y)
	
	if (_testSlot >= 0) {
		selector.position.y += selectChange.y
		selectedSlot = _testSlot
	}
}

if (selector != noone && instance_exists(selector)) {
	selector.x = slots[selectedSlot].x
	selector.y = slots[selectedSlot].y
}

if (selectChange.x != 0 || selectChange.y != 0) {
	audio_play_sound(snd_punchy_pick, 1, 0)
	itemInfoBox.updateItem(slots[selectedSlot].item)
}
