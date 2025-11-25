///@description Init

depth = -500
persistent = true

enum backpackStates {
	active,
	confirming,
}

slots = []

state = backpackStates.active

randomItems = [
	//obj_mg_venomleaf,
	//obj_mg_black_ichor,
	//obj_mg_opaque_hourglass,
	//obj_mg_goldleaf,
	//obj_mg_golden_puzzlebox,
	//obj_mg_frost_walkers,
	//obj_mg_fire_salt,
	//obj_mg_cinder_stone,
	//obj_mg_crown_of_destruction
	obj_mg_war_bracer
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
simpleDisplay = false
focused = true
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

isFull = false

image_alpha = 0

///@description			Gets a slot given coordinates. Returns the index in the slots[] array
///@param {real} _x		X movement
///@param {real} _y		Y movement
///@return {real}
getSlot = function(_x, _y) {
	for (var i = 0; i < array_length(slots); i++) {
		if (slots[i].backpackCoordinate.x == _x && slots[i].backpackCoordinate.y == _y) {
			return i
		}
	}
	
	return -1
}

setFocusState = function(_focused) {
	focused = _focused
	
	if (focused) {
		selector.image_alpha = 1
	} else {
		selector.image_alpha = 0
	}
}

///@description			Determines if there needs to be a shift in focus in the UI
///@param {real} _x		X movement
///@param {real} _y		Y movement
///@return {real}		
selectChangeFocusShift = function(_x, _y) {
	//show_message([_x, _y, slots[selectedSlot].backpackCoordinate.x, slots[selectedSlot].backpackCoordinate.y])
	if (_x == -1 && slots[selectedSlot].backpackCoordinate.x == 0) {
		obj_ui_controller.getUiFocusFromDirection(-1, 0)
	} else if (_y == 1 && slots[selectedSlot].backpackCoordinate.y == rows - 1) {
		obj_ui_controller.getUiFocusFromDirection(0, 1)
	}
	
	setFocusState(obj_ui_controller.focusType == uiFocusTypes.inventory)
}

///@description			Equips or Unequips items based on activeSlot and current equipped bool
updateEquippedItems = function() {
	var _isFull = true
	
	for (var i = 0; i < array_length(slots); i++) {
		if (slots[i].item != noone) {
			if (slots[i].activeSlot && !slots[i].item.equipped) {
				slots[i].item.equip()
			} else if (!slots[i].activeSlot && slots[i].item.equipped) {
				slots[i].item.unequip()
				//slots[i].item.equipped = (slots[i].activeSlot)
			}
		} else {
			_isFull = false
		}
	}
	
	isFull = _isFull
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
	
	updateRecipeValidation()
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

///@description				Clears a merge selection
clearMerge = function() {
	mergerBox.clear()	
	mergingSlots = []
	
	with (obj_backpack_slot) {
		image_index = 0
	}
}

///@description				Swap input. Adds item to queue or swaps
activateSwap = function() {
	clearMerge()
	
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
		if (slots[selectedSlot].item == noone) {
			clearSwap()
		} else {
			createDestroyPrompt()
		}
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
	_newItem.owner = owner
	
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
	//process_player_stats()
	
	audio_play_sound(snd_merging_mix, 1, 0)
	audio_play_sound(snd_merge_powerup, 1, 0)
}

///@description			Creates the prompt to destroy an item
createDestroyPrompt = function() {
	var _menu = instance_create_depth(-999, -999, depths.ui, obj_destroy_merger_confirm_menu)
	
	_menu.destroySlotIndex = selectedSlot
	_menu.backpackOwner = owner
	_menu.focused = true
	
	state = backpackStates.confirming
	focused = false
}

///@description				Destroys an item
///@param {real} _index		Index to destroy. Must be selected, unlike most other functions here.
destroyItem = function(_index) {
	//slots[_index].item.onUnequip()
	instance_destroy(slots[_index].item)
	slots[_index].item = noone
	
	clearSwap()
	
	create_toaster("Item destroyed. Reward not setup yet", errorLevels.warning)
	
	updateRecipeValidation()
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
			break
		}
	}
	
	updateEquippedItems()
	process_player_stats()
}

///@description			Opens the backpack, displaying it on screen
open = function() {
	owner.statsMenu.open()
	selectedSlot = 0
	focused = true
		
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
	state = backpackStates.active
	
	set_ui_focus_type(uiFocusTypes.inventory)
	
	updateRecipeValidation()
}

///@description			Updates items and recipes
updateRecipeValidation = function() {
	var _items = getItemList()
	var _recipes = obj_recipe_controller.getValidRecipes(_items)
	obj_recipe_controller.markValidIngredients(_recipes, _items)
}

///@description			Gets an array of all items in the backpack
///@return {array<Id.Instance>}
getItemList = function() {
	var _items = []
	
	for (var i = 0; i < array_length(slots); i++) {
		if (slots[i].item != noone) {
			array_push(_items, slots[i].item)
		}
	}
	
	return _items
}

///@description			Closes the backpack
close = function() {
	owner.statsMenu.close()
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
	
	set_game_pause_state(false)
	audio_play_sound(snd_leather_heavy, 1, 0)
		
	isOpen = false
	set_ui_focus_type(uiFocusTypes.none)
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

setupMergeInfoBoxPositioning = function() {
	itemInfoBox.x = x + width + 2
	itemInfoBox.y = y

	mergerBox.width = 210
	mergerBox.height = 52

	mergerBox.image_xscale = mergerBox.width / sprite_get_width(spr_backpack_window_main)
	mergerBox.image_yscale = mergerBox.height / sprite_get_height(spr_backpack_window_main)
	
	mergerBox.x = (view_width() / 2) - (mergerBox.width / 2)
	mergerBox.y = y - mergerBox.height - 3
}

///@description						Displays backpack, but does not enable interaction
///@param {real} _x					X position to display
///@param {real} _y					Y position to display
activateSimpleDisplay = function(_x, _y) {
	simpleDisplay = true
	
	image_alpha = 1
	
	x = _x
	y = _y
}

///@description						Resumes basic display
deactivateSimpleDisplay = function() {
	simpleDisplay = false
	
	image_alpha = 0
	
	x = (view_width() / 2) - (width / 2)
	y = (view_height() / 2) - (height / 2)
}