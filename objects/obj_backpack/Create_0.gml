///@description Init

depth = -500
persistent = true

slots = []

randomItems = [
	obj_mg_ebony_pendant,
	obj_mg_glass_feather,
	obj_mg_opaque_hourglass,
	obj_mg_unformed_mass
]

inputsKeyboard = {
	toggleMerge: vk_enter,
	merge: vk_shift,
	swap: vk_space,
	close: vk_escape
}

inputsController = {
	toggleMerge: XBOX_INPUT_X,
	merge: XBOX_INPUT_A,
	swap: XBOX_INPUT_Y,
	close: XBOX_INPUT_B
}

centered = true
drawMain = false
drawCombining = false
selectedSlot = noone
isOpen = false
owner = noone

selectChange = new vec2()

setup = false // Must be set to true after defining slots

padding = {
	top: 8,
	left: 18,
	right: 18,
	bottom: 12
}

width = 1
height = 1

activeSlots = 6
inactiveSlots = 12
activeColumns = 2
activePadding = 3
inactiveColumns = 4
slotTypeMargin = 20

rows = 1

selectedSlot = 0
selector = noone

bgSprite = spr_backpack_window_main

activeTitleHeight = sprite_get_height(spr_backpack_text_active)
activeBgSprite = spr_backpack_window_active_area

//itemInfoBox = create_instance(obj_backpack_item_infobox)
//mergerBox = create_instance(obj_backpack_merger)

itemInfoBox = noone
mergerBox = noone

mergingSlots = []
mergingSlotsMax = 3

swapping = -1
swapper = noone

image_alpha = 0

///@descriptoin			Gets a slot given coordinates. Returns the index in the slots[] array
///@param {real} _x		X
///@param {real} _y		Y
///@return {real}
getSlot = function(_x, _y) {
	for (var i = 0; i < array_length(slots); i++) {
		if (slots[i].backpackCoordinate.x == _x && slots[i].backpackCoordinate.y == _y) {
			return i
		}
	}
	
	return -1
}

updateEquippedItems = function() {
	for (var i = 0; i < array_length(slots); i++) {
		if (slots[i].item != noone) {
			slots[i].item.equipped = (slots[i].activeSlot)
		}
	}
}

///@description				Adds item to the merge pool
///@param {real} _slot		Uses the selected slot to add an item
toggleMergeForSelected = function() {
	var _item = slots[selectedSlot].item
	
	if (_item = noone) {
		return 0
	}
	
	clearSwap()
	
	if (array_contains(mergingSlots, selectedSlot)) {
		mergerBox.removeMergingItem(_item)
		
		for (var i = 0; i < array_length(mergingSlots); i++) {
			if (mergingSlots[i] == selectedSlot) {
				array_delete(mergingSlots, i, 1)
				break
			}
		}
		
		slots[selectedSlot].image_index = 0
	} else if (array_length(mergingSlots) < mergingSlotsMax) {
		mergerBox.addMergingItem(_item)
		
		array_push(mergingSlots, selectedSlot)
		
		slots[selectedSlot].image_index = 1
	}
	
	if (array_length(mergingSlots) > 0) {
		mergerBox.show()
	} else {
		mergerBox.hide()
	}
	
	audio_play_sound(snd_leathery_thud, 1, 0)
	
	checkMergingItems()
}

///@description				Checks items in merging selection
checkMergingItems = function() {
	var _mergingItems = []
	
	for (var i = 0; i < array_length(mergingSlots); i++) {
		array_push(_mergingItems, slots[mergingSlots[i]].item.object_index)
	}
	
	var _recipe = obj_recipe_controller.checkItems(_mergingItems)
	
	if (_recipe == obj_recipe_controller.invalidRecipe) {
		mergerBox.setInvalidMerge()
		
	} else {
		mergerBox.setValidMerge(_recipe.icon)
	}
}

///@description				Clears swap setup
clearSwap = function() {	
	with (obj_backpack_swapper) {
		instance_destroy()
	}
	
	swapping = -1
	swapper = noone
}

///@description				Swap input. Adds item to queue or swaps
activateSwap = function() {
	if (swapping == -1) {
		swapper = instance_create_depth(
			slots[selectedSlot].x,
			slots[selectedSlot].y,
			slots[selectedSlot].depth - 10,
			obj_backpack_swapper
		)
		
		//swapper.x += x
		//swapper.y += y
	
		swapping = selectedSlot
	} else if (swapping == selectedSlot) {
		clearSwap()
	} else {
		var _tempSwap = slots[swapping].item
		
		slots[swapping].item = slots[selectedSlot].item
		slots[selectedSlot].item = _tempSwap
		
		clearSwap()
		updateEquippedItems()
		
		audio_play_sound(snd_chunky_swap, 0, 0)
		
		process_player_stats()
	}
}

///@description				Merges selected items
activateMerge = function() {
	var _mergingItems = []
	
	for (var i = 0; i < array_length(mergingSlots); i++) {
		array_push(_mergingItems, slots[mergingSlots[i]].item.object_index)
	}
	
	var _recipe = obj_recipe_controller.checkItems(_mergingItems)
	
	if (_recipe == obj_recipe_controller.invalidRecipe) {
		return 0
	}
	
	var _newItem = create_instance(_recipe.result)
	
	mergerBox.clear()
	
	for (var i = 0; i < array_length(mergingSlots); i++) {
		instance_destroy(slots[mergingSlots[i]].item)
		slots[mergingSlots[i]].item = noone
	}
	
	with (obj_backpack_slot) {
		image_index = 0
	}
	
	mergingSlots = []
	
	addItem(_newItem)
	
	updateEquippedItems()
	process_player_stats()
	
	audio_play_sound(snd_merging_mix, 1, 0)
}

///@description			Clears selected slots
clearSelection = function() {
	mergerBox.clear()
	
	with (obj_backpack_slot) {
		image_index = 0
	}
	
	mergingSlots = []
}

///@description			Draws the info box for the selected item
drawItemInfo = function() {
	
}

///@description			Changes open/close state to the opposite
toggle = function() {
	if (isOpen) {
		close()
	} else {
		open()
	}
}

///@description					Adds an item to the backpack
///@param {id.Instance} _item	Item to add
addItem = function(_item) {
	for (var i = 0; i < array_length(slots); i++) {
		if (slots[i].item == noone) {
			slots[i].item = _item
			exit
		}
	}
	
	updateEquippedItems()
	process_player_stats()
}

///@description			Opens the backpack, displaying it on screen
open = function() {
	selectedSlot = 0
		
	image_alpha = 1
	
	for (var i = 0; i < array_length(slots); i++) {
		//slots[i].image_alpha = 1
	}
	
	slots[0].selected = true
	selector = instance_create_depth(
		-99, //x + slots[0].x,
		-99, //y + slots[0].y,
		slots[0].depth - 10,
		obj_backpack_selector
	)
	
	mergerBox = create_instance(obj_backpack_merger)
	itemInfoBox = create_instance(obj_backpack_item_infobox)
	
	setupMergeInfoBoxPositioning()
	
	itemInfoBox.show()
	//mergerBox.show()
	
	set_game_pause_state(true)
	audio_play_sound(snd_leather_heavy, 1, 0)
	
	isOpen = true
}

///@description			Closes the backpack
close = function() {
	image_alpha = 0
	
	for (var i = 0; i < array_length(slots); i++) {
		slots[i].image_alpha = 0
		slots[i].selected = false
		slots[i].combing = false
	}
	
	instance_destroy(selector)
	selector = noone

	clearSwap()
	clearSelection()
	
	instance_destroy(mergerBox)
	mergerBox = noone
	
	instance_destroy(itemInfoBox)
	itemInfoBox = noone
	
	//itemInfoBox.hide()
	//mergerBox.hide()
	
	set_game_pause_state(false)
	audio_play_sound(snd_leather_heavy, 1, 0)
		
	isOpen = false
}

///@description						Initializes the backpack after setting slots
setup = function() {
	if (activeSlots == 0) {
		throw ("Backpack initialized with 0 active slots")
	}
	
	var _slot = noone
	
	for (var i = 0; i < activeSlots; i++) {
		_slot = create_instance(obj_backpack_slot)
		_slot.backpack = id
		_slot.activeSlot = true
		array_push(slots, _slot)
	}
	
	for (var i = 0; i < inactiveSlots; i++) {
		_slot = create_instance(obj_backpack_slot)
		_slot.backpack = id
		array_push(slots, _slot)
	}
	
	setupButtonCoordinates()
	setupPositioning()
}

///@description						Setups up the coordinates of the buttons
setupButtonCoordinates = function() {
	var _col = 0
	var _row = 0
	var _maxRow = 0
	var _leftOffsetActive = padding.left + activePadding
	var _leftOffsetInactive = _leftOffsetActive + slotTypeMargin
	var _topOffset = padding.top + activeTitleHeight
	var _buttonWidth = sprite_get_width(spr_backpack_slot_active)
	var _buttonHeight = sprite_get_height(spr_backpack_slot_active)
		
	var i = 0
	
	// Active Slots
	for (i = 0; i < activeSlots; i++) {
		slots[i].backpackCoordinate.x = _col
		slots[i].backpackCoordinate.y = _row
		slots[i].xOffset = _leftOffsetActive + (_col * _buttonWidth)
		slots[i].yOffset = _topOffset + (_row * _buttonHeight)
		slots[i].image_alpha = 1
		
		//slots[i].xOffset = _col * _buttonWidth
		
		if (_row > _maxRow) {
			_maxRow = _row
		}
		
		_col++
		
		if (_col >= activeColumns) {
			_col = 0
			_row++
		}
	}
	
	// Inactive Slots
	_col = activeColumns
	_row = 0
		
	for (i = 0; i < inactiveSlots; i++) {
		slots[i + activeSlots].backpackCoordinate.x = _col
		slots[i + activeSlots].backpackCoordinate.y = _row
		slots[i + activeSlots].xOffset = _leftOffsetInactive + (_col * _buttonWidth)
		slots[i + activeSlots].yOffset = _topOffset + (_row * _buttonHeight)
		
		if (_row > _maxRow) {
			_maxRow = _row
		}

		_col++
		
		if (_col >= activeColumns + inactiveColumns) {
			_col = activeColumns
			_row++
		}
	}
	
	rows = _maxRow + 1
}

setupPositioning = function() {
	var _buttonWidth = sprite_get_width(spr_backpack_slot_active)
	var _buttonHeight = sprite_get_height(spr_backpack_slot_active)
	
	width = padding.left + padding.right + (_buttonWidth * (activeColumns + inactiveColumns)) + (activePadding * 2) + slotTypeMargin
	height = padding.top + padding.bottom + (_buttonHeight * rows) + activeTitleHeight + activePadding
	
	sprite_index = bgSprite
	image_xscale = width / sprite_get_width(bgSprite)
	image_yscale = height / sprite_get_height(bgSprite)
	
	x = (view_width() / 2) - (width / 2)
	y = (view_height() / 2) - (height / 2)
}

setupMergeInfoBoxPositioning = function () {
	itemInfoBox.x = x + width + 2
	itemInfoBox.y = y

	mergerBox.width = 210
	mergerBox.height = 52

	mergerBox.image_xscale = mergerBox.width / sprite_get_width(spr_backpack_window_main)
	mergerBox.image_yscale = mergerBox.height / sprite_get_height(spr_backpack_window_main)
	
	mergerBox.x = (view_width() / 2) - (mergerBox.width / 2)
	mergerBox.y = y - mergerBox.height - 3
}
