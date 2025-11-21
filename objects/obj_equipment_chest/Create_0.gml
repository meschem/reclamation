///@description Init

event_inherited()

lifeSpan = 9999
homesOnPlayer = false
dropCount = 3

state = chestStates.spawning
contents = []
active = false

reflectOffsetY = 8

///@param {id.Instance} _player
onPickup = function(_player) {
	active = false
	
	var _offset = new vec2()
	var _angle = random(360)
	
	for (var i = 0; i < dropCount; i++) {
		_offset = get_vec2_from_angle_mag(_angle + (i * 360 / dropCount) + random(30), 40)

		create_random_item_drop(x + _offset.x, y + _offset.y, 1 + _player.bonusMagicFind)
	}
	
	audio_play_sound(snd_unlock_door, 1, false)
	
	instance_create_depth(x, y, depth, obj_chest_despawner)
	instance_destroy()
	
	//sprite_index = spr_treasure_chest
	//image_index = 0
	//image_speed = 0
	
	//state = chestStates.despawning
}