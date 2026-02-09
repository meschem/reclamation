///@description Init

event_inherited()

collectRange = 30
lifeSpan = 9999
homesOnPlayer = false
dropCount = 1

coinOffset = new vec2(-9, 21)
costTextOffset = new vec2(-2, 15)

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
dropMinRarities = []

cantOpenSprite = spr_cant_open_x
drawCantOpen = false
drawUi = true

state = chestStates.spawning
contents = []
active = false
guiPos = get_ui_pos(id)

reflectOffsetY = 14

open = function() {
	active = false
	
	openingPlayer.gold -= cost
	
	obj_run_controller.lockedChestsOpened++
	
	with (obj_merger_item_chest_locked) {
		cost = get_locked_chest_cost()		// increase cost on OTHER chests
	}
	
	for (var i = 0; i < dropCount; i++) {
        var _minRarity = enumRarity.normal
        
        if (i <= array_length(dropMinRarities) - 1) {
            _minRarity = dropMinRarities[i]
        }
        
        var _magicFind = get_player_stat(enumPlayerStats.magicFind, openingPlayer) 
		var _orb = create_random_merger_item_drop(x, y + 4, _magicFind, _minRarity)
        var _color = get_rarity_color(_orb.equipment.rarity, true)
        
        create_pickup_with_lob(_orb, x, y, _color)
	}
	
	audio_play_sound(snd_unlock_door, 1, false)
	
	var _inst = instance_create_depth(x, y, depth, obj_chest_despawner)
	_inst.sprite_index = sprite_index
	
	instance_destroy()
}
