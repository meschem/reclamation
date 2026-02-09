/// size is calculated per frame to handle additions of buttons
/// shouldn't cause expense issues since game is almost always
/// paused during menus

/// For controls, all this menu should do is help decide which
/// button is focused. Clicking event is handled on the button.
/// 

if (state == enumSelectionMenuStates.opening) {
    stateAge++
    
    if (stateAge >= stateOpeningDuration) {
        enable()
    }
} else if (state == enumSelectionMenuStates.closing) {
    stateAge++
    
    if (stateAge >= stateClosingDuration) {
        instance_destroy()
        
        return 0
    }
}

buttonCount = array_length(buttons)

useMouseFocus = player_is_using_mouse()

var _input = get_player_4_direction_input()
var _updateButtonIndex = false

if (inputEnabled) {
    if (!useMouseFocus) {
        if (
        	_input == enumDirectionInput.right ||
        	_input == enumDirectionInput.down
        ) {
            _updateButtonIndex = true
        	buttonFocusIndex++
        } else if (
        	_input == enumDirectionInput.up ||
        	_input == enumDirectionInput.left
        ) {
            _updateButtonIndex = true
        	buttonFocusIndex--
        }
        
        if (_updateButtonIndex) {
            buttonFocusIndex = clamp(buttonFocusIndex, 0, buttonCount - 1)
        } 
    } else {
        var _previous = buttonFocusIndex
        buttonFocusIndex = -1
        
        // If mouse is being used...
        for (var i = 0; i < array_length(buttons); i++) {
            if (mouse_is_over_hitbox(buttons[i])) {
                buttonFocusIndex = i
                
                if (_previous != i) {
                    _updateButtonIndex = true
                }
            }
        }
    }
    
    for (var i = 0; i < array_length(buttons); i++) {
        buttons[i].isFocused = (buttonFocusIndex = i)
    }
    
    if (_updateButtonIndex) {
        audio_play_sound(snd_punchy_pick, 1, 0)
    } 
}

scaleX = menuWidth / sprite_width
scaleY = menuHeight / sprite_height

for (var i = 0; i < array_length(buttons); i++) {
	buttons[i].x = x + paddingX + (i * buttonSpacing)
	buttons[i].y = y + paddingTop + headerHeight + buttons[i].marginY
}
