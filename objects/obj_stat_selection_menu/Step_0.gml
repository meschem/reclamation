/// size is calculated per frame to handle additions of buttons
/// shouldn't cause expense issues since game is almost always
/// paused during menus

/// For controls, all this menu should do is help decide which
/// button is focused. Clicking event is handled on the button.

if (state == enumSelectionMenuStates.closing) {
    stateAge++
    
    if (stateAge >= stateClosingDuration) {
        instance_destroy()
    }
    
    return 0
}

if (array_length(buttons) == 0) {
	return 0
}

// Wait until all buttons are enabled to enable input
if (!inputEnabled) {
	var _enableInput = true
	
	for (var i = 0; i < array_length(buttons); i++) {
		if (buttons[i].enabled = false) {
			_enableInput = false
		}		
	}
	
	if (_enableInput) {
		inputEnabled = true
		selectButton(0)
	} else {
		return 0
	}
}

useMouseFocus = player_is_using_mouse()

//if (selectedIndex = -1) {
	//selectButton(0)
	//return 0
//}

var _selectChange = false

if (!useMouseFocus) {
    var _dir = get_player_4_direction_input()
    
    switch (_dir) {
    	case enumDirectionInput.up:
            if (focused) {
          		selectedIndex--
          		_selectChange = true
            }
    	break
    	
    	case enumDirectionInput.down:
            if (focused) {
                selectedIndex++ 
                _selectChange = true    
            } 
    	break
    
        case enumDirectionInput.left:
            setFocusState(false)
        break
    
        case enumDirectionInput.right:
            setFocusState(true)
        break
    }
} else {
    for (var i = 0; i < array_length(buttons); i++) {
        if (selectedIndex != i && mouse_is_over_hitbox(buttons[i])) {
            _selectChange = true
            selectedIndex = i
        }
    }
}

if (focused) {
    var _pressed = get_input(bindActions.confirm)
    
    if (_pressed) {
    	buttons[selectedIndex].onClick()
    
    	return 0
    }
   
    if (_selectChange) {
        //show_message(selectedIndex)
    	selectedIndex = clamp(selectedIndex, 0, array_length(buttons) - 1)
    	selectButton(selectedIndex)
    }
}
