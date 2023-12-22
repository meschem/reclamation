
event_inherited()

name = "War Hammer"

upgrades = [
	create_instance(obj_wupg_wh_mega_hammer),
	create_instance(obj_wupg_gen_rapid),
]

use = function() {
	show_message("proj")
	var velocity = get_vec2_from_angle_mag(owner.attackAngle, 4)
	var inst = launch(obj_war_hammer, velocity)
	
	audio_play_sound(snd_woosh, 1, false)
}
