///@description Init

depth = -500
persistent = true

slots = []

randomItems = [
	//obj_mg_venomleaf,
	//obj_mg_black_ichor
	//obj_mg_opaque_hourglass
	//obj_mg_goldleaf
	//obj_mg_golden_puzzlebox,
	//obj_mg_frost_walkers,
	//obj_mg_fire_salt,
	//obj_mg_cinder_stone,
	obj_mg_crown_of_destruction
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
