event_inherited()

var inst = instance_place(x, y, obj_player)

if (inst != noone) {
	audio_play_sound(snd_soft_click, 1, false)
	add_gold(pickupValue)
	
	var txt = create_moving_text(pickupValue, x, y, movingTextTypes.floating)
	
	txt.fontColor = c_yellow
	
	instance_destroy()
}
