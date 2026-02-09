/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

hpMax = 75
hp = 75

mapIcon = spr_poi_health

damageParticles = [
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med
]

deathParticles = [
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_small,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med,
	obj_ptb_dest_rock_purp_med
]

onDeath = function() {
	var _vol = random_range(0.4, 0.6)
	if (random(1) < 0.5) {
		audio_play_sound(snd_stone_crunch_01, 1, false, _vol)
	} else {
		audio_play_sound(snd_stone_crunch_02, 1, false, _vol)
	}

	create_pickup_with_lob(obj_health_globe_sm, x, y, global.colorDarkRed)
    create_pickup_with_lob(obj_health_globe_sm, x, y, global.colorDarkRed)
    
    remove_map_poi()
}
