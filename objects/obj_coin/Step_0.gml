event_inherited()

var _inst = instance_place(x, y, obj_player)

if (_inst != noone) {
	audio_play_sound(snd_soft_click, 1, false)
	add_gold(pickupValue * target.bonusPickupRewardScalar)
	
	var _txt = create_moving_text(pickupValue, x, y, movingTextTypes.floating)
	
	_txt.fontColor = c_yellow
	
	with (obj_equipment) {
		if (owner == other.target) {
			onPickup(other)
		}
	}
	
	var puzzleBox = get_player_trinket(obj_trinket_golden_puzzlebox, _inst)
	
	if (puzzleBox != noone) {
		puzzleBox.use(id)
	}
	
	instance_destroy()
}
