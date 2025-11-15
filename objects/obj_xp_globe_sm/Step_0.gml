event_inherited()

var _inst = instance_place(x, y, obj_player)

if (_inst != noone) {
	//audio_play_sound(snd_soft_click, 1, false)
	//add_player_health(pickupValue)
	
	//var txt = create_moving_text(pickupValue, x, y, movingTextTypes.floating)
	
	//txt.fontColor = get_color(colors.red)
	
	var _value = pickupValue * get_player_stat(enumPlayerStats.pickupRewardScalar, _inst)
	
	obj_player.xp += _value	
	create_pickup_text(x, y, _value, pickupTextStyles.xp)
	
	instance_destroy()
	check_for_level_up()
}

set_float_range()
