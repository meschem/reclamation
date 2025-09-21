
if (skipStep) {
	return 0
}

if (state == shopMenuStates.opening) {
	stateAge++
	
	if (stateAge >= stateAgeMax) {
		stateOpeningToOpen()
	} else {
		var _ratio = clamp(stateAge / stateAgeMax, 0, 1)
	
		height = heightFull * animcurve_channel_evaluate(heightCurve, _ratio)
		
		shopSign.y = min(shopSign.restingOffset, height - 26 - sprite_get_height(spr_shop_top_sign))
		chainsBig.y = min(chainsBig.restingOffset, height - 26 - sprite_get_height(spr_shop_chains_big))
		
		for (var i = 0; i < array_length(buttons); i++) {
			buttons[i].y = min(buttons[i].restingOffset, height - 26 - sprite_get_height(spr_backpack_slot_inactive))
		}
		
		for (var i = 0; i < array_length(chains); i++) {
			chains[i].y = min(chains[i].restingOffset, height - 26 - sprite_get_height(spr_shop_chains_small))
		}
	}
}

if (get_input(bindActions.back)) {
	close()
	
	return 0
}

else if (state == shopMenuStates.open) {
	var _updateInfoBox = false

	if (get_input(bindActions.down)) {
		selectedSlot = min(array_length(buttons) - 1, selectedSlot + 1)
		audio_play_sound(snd_punchy_pick, 1, 0)
		_updateInfoBox = true
	}
	
	else if (get_input(bindActions.up)) {
		selectedSlot = max(0, selectedSlot - 1)
		audio_play_sound(snd_punchy_pick, 1, 0)
		_updateInfoBox = true
	}
	
	else if (get_input(bindActions.confirm)) {
		tryPurchase()
		_updateInfoBox = true
	}
	
	if (_updateInfoBox = true) {
		itemInfoBox.updateItem(buttons[selectedSlot].item)
	}
	
	selector.y = buttons[selectedSlot].y
}

image_yscale = height / sprite_get_height(spriteIndex)
