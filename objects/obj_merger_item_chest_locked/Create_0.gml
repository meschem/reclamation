///@description Init

event_inherited()

collectRange = 30
lifeSpan = 9999
homesOnPlayer = false
dropCount = 1
openRange = 30 //bbox for unlocking
locked = true
drawOpenPrompt = false
playerCanOpen = false
chestSize = lockedChestSizes.small
cost = get_locked_chest_cost()
openingPlayer = noone
keyboardInput = "G"
controllerInput = gp_face4
endString = " to open"
infoTextOffset = new vec2(25, -15)

cantOpenSprite = spr_cant_open_x
drawCantOpen = false

state = chestStates.spawning
contents = []
active = false
guiPos = get_ui_pos(id)

reflectOffsetY = 8

open = function() {
	active = false
	
	openingPlayer.gold -= cost
	
	obj_run_controller.lockedChestsOpened++
	
	with (obj_merger_item_chest_locked) {
		cost = get_locked_chest_cost()
	}
	
	for (var i = 0; i < dropCount; i++) {
		//var _orb = instance_create_depth(x, y, depths.enemy, obj_merger_globe)
		var _merger = create_random_merger_item_drop(x, y)
	}
	
	audio_play_sound(snd_unlock_door, 1, false)
	
	var _inst = instance_create_depth(x, y, depth, obj_chest_despawner)
	_inst.sprite_index = sprite_index
	
	instance_destroy()
}
