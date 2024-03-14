event_inherited()

var inst = instance_place(x, y, obj_player)

if (inst != noone) {
	audio_play_sound(snd_soft_click, 1, false)
	add_gold(pickupValue * target.bonusPickupRewardScalar)
	
	var txt = create_moving_text(pickupValue, x, y, movingTextTypes.floating)
	
	txt.fontColor = c_yellow
	
	var puzzleBox = get_player_trinket(obj_trinket_golden_puzzlebox, inst)
	
	if (puzzleBox != noone) {
		puzzleBox.use(id)
	}
	
	instance_destroy()
}
