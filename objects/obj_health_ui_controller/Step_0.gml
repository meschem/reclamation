
if (!setup || game_is_paused()) {
	return 0
}

age++

playerHealthCur = player.hp
playerHealthMax = player.maxHp

// currently instantly sets max health to player's max health, adjusting array
if (playerHealthMax < healthMax) {
	var _pipsToRemove = (healthMax - playerHealthMax) / healthPerIcon
	
	for (var i = 0; i < _pipsToRemove; i++) {
		var _heart = array_pop(pips)
		
		instance_destroy(_heart)
	}
	
	healthMax = playerHealthMax
} else if (playerHealthMax > healthMax) {
	var _pipsToAdd = (playerHealthMax - healthMax) / healthPerIcon
	
	for (var i = 0; i < _pipsToAdd; i++) {
		var _heart = create_instance(obj_ui_player_heart)
		_heart.x = drawStart.x + (array_length(pips) * iconSpacing)
		_heart.y = drawStart.y
		_heart.controller = id
	
		array_push(pips, _heart)
        
        if (playerHealthCur / 10 < array_length(pips)) {
            _heart.sprite_index = sprEmpty
        }
	}
	
	healthMax = playerHealthMax
}

// players heal or damage anims at a specified rate
if (updateCd <= 0) {
	if (playerHealthCur < healthCurrent) {
		updateCd = updateRate
		
		var _index = healthCurrent / healthPerIcon - 1
		
		if (_index < array_length(pips)) {
			pips[_index].sprite_index = pips[_index].sprDamage	
		}		
		
		healthCurrent -= healthPerIcon
	} else if (playerHealthCur > healthCurrent) {
		updateCd = updateRate
		
		var _index = healthCurrent / healthPerIcon
		pips[_index].sprite_index = pips[_index].sprHeal
		
		healthCurrent += healthPerIcon
	}
} else {
	updateCd--
}


pipsTotal = playerHealthMax / healthPerIcon
pipsFull = healthCurrent / healthPerIcon
