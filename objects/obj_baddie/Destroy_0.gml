
switch (deathFx) {
	case deathFxTypes.bones:
		death_fx_bones()
		break;
}

if (soundOnDeath >= 0)
	audio_play_sound(soundOnDeath, 1, false)

obj_game_controller.playerXp += xp

check_for_level_up()

//var roomEnd = check_for_room_end()

//if (roomEnd) {
//	show_message("LEVEL ENDED")
//}
