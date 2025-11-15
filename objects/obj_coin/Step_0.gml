event_inherited()

var _inst = instance_place(x, y, obj_player)

if (_inst != noone) {
	var _goldToAdd = pickupValue * get_player_stat(enumPlayerStats.pickupRewardScalar, _inst)
	
	audio_play_sound(snd_soft_click, 1, false)
	add_gold(_goldToAdd)
	
	create_pickup_text(x, y, _goldToAdd, pickupTextStyles.gold)
	
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
