///@description Init

event_inherited()

enum chestStates {
	spawning,
	closed,
	open,
	locked,
	despawning
}

lifeSpan = 9999
homesOnPlayer = false
dropCount = 3

state = chestStates.spawning
contents = []
active = false

reflectOffsetY = 14

///@param {id.Instance} _player
onPickup = function(_player) {
	active = false
	
	display_level_merger_prompt(_player)
	
	audio_play_sound(snd_unlock_door, 1, false)
	
	instance_create_depth(x, y, depth, obj_chest_despawner)
	instance_destroy()
}
