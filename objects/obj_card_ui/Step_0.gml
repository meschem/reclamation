
if (enabled) {
	if (state == buttonStates.spawning) {
		var _ratio = age / spawnDuration
		var _channel = animcurve_get_channel(ac_menu_ability_slide_offset, 0)
		var _curveRatio = animcurve_channel_evaluate(_channel, _ratio)
		
		drawOffsetY = view_height() * _curveRatio
		
		if (spawnDelay > 0) {
			spawnDelay--
		} else {
			age++
		}
        
        if (age == spawnDuration - 12) {
            audio_play_sound(snd_card_slide, 1, false)
        }
		
		if (age > spawnDuration) {
            
			state = buttonStates.flashing
		}
	} else if (state == buttonStates.flashing) {
		flashFrame++
		
		if (flashFrame > sprite_get_number(spr_card_flash_huge)) {
			state = buttonStates.normal
		}
	} else if (state != buttonStates.disabled) {
		if (parentMenu != noone && parentMenu.useMouseFocus) {
			if (mouse_is_over_hitbox()) {
				var baseId = id
		
				// sets all others to unfocused
				with (obj_card_ui) {
					if (state == buttonStates.selected) {
						state = buttonStates.normal
					}					
				}

				isFocused = true
			} else {
				isFocused = false
			}
		}
		
		if (isFocused) {
			state = buttonStates.selected
			
			focusOffsetX = -2
			focusOffsetY = -2
			focusBoostX = 4
			focusBoostY = 4
			
			//show_message(width)
			
			//image_xscale = width / sprite_width
			//image_yscale = height / sprite_height
		} else {
			state = buttonStates.normal
			
			focusOffsetX = 0
			focusOffsetY = 0
			focusBoostX = 0
			focusBoostY = 0
			
			//image_xscale = width / sprite_width
			//image_yscale = height / sprite_height
		}
		
		if (
			state == buttonStates.selected && (
				keyboard_check_released(vk_enter) || 
				gamepad_button_check_released(0, gp_face2) ||
				(
                    mouse_check_button_released(mb_left) &&
                    mouseDelayEnable == false
                )
			)
		) {
            
            state = buttonStates.closing
			onClick()
		}
	}
} 

if (mouseDelayEnable && mouse_check_button_released(mb_left)) {
    mouseDelayEnable = false
}

if (topIcon != spr_none) {
	buttonXOffset = (width - sprite_get_width(topIcon)) / 2
}

if (!titleBackgroundDraw && titleBackground != spr_none) {
    titleBackgroundDraw = true
}

image_index = state
image_xscale = (width + focusBoostX) / sprite_get_width(sprite_index)
image_yscale = (height + focusBoostY) / sprite_get_height(sprite_index)