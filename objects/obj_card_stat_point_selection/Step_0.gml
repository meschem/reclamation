
if (food = noone) {
	return 0
}

var _focusBoostX = 0
var _focusBoostY = 0
drawOffsetX = 0
drawOffsetY = 0

if (state == buttonStates.holding) {
	if (stateAge >= spawnDelay) {
		state = buttonStates.spawning
		
		if (slideFromX) drawOffsetX = view_width()	
		if (slideFromY) drawOffsetY = view_height()
		
		stateAge = 0
	} else {
		stateAge++
	}	
} else if (state == buttonStates.spawning) {
	var _ratio = stateAge / spawnDuration
	var _channel = animcurve_get_channel(ac_menu_ability_slide_offset, 0)
	var _curveRatio = animcurve_channel_evaluate(_channel, _ratio)
		
	drawOffsetX = view_width() * _curveRatio
    
    if (stateAge == spawnDuration - 12) {
        audio_play_sound(snd_card_slide, 1, false)
    }
		
	if (stateAge >= spawnDuration) {
		state = buttonStates.flashing
		
		stateAge = 0
	} else {
		stateAge++
	}
} else if (state == buttonStates.flashing) {
	flashFrame = stateAge
	
	if (stateAge >= sprite_get_number(flashSprite)) {
		enabled = true

		state = buttonStates.normal		
	} else {
		stateAge++
	}
} else {
    if (state == buttonStates.normal) {
    	image_index = 0
    } else if (state == buttonStates.selected) {
    	_focusBoostX = focusBoostX
    	_focusBoostY = focusBoostY
    
    	drawOffsetX = -floor(_focusBoostX / 2)
    	drawOffsetY = -floor(_focusBoostY / 2)
    	
    	image_index = 1
    } else if (state == buttonStates.disabled) {	
    	image_index = 3
    }
}

if (
    mouse_check_button_released(mb_left) && 
    state == buttonStates.selected
) {
    onClick()
}

image_xscale = (width + _focusBoostX) / sprite_get_width(sprite_index)
image_yscale = (height + _focusBoostY) / sprite_get_height(sprite_index)
