///@description			Init
image_alpha = 0

//width = 210
//height = 52

//image_xscale = width / sprite_get_width(spr_backpack_window_main)
//image_yscale = height / sprite_get_height(spr_backpack_window_main)

mergingItems = []

combineSlotItemSprite = spr_none
combineSlotSprite = spr_backpack_slot_combine
combineSlotIndex = 0
combineSlotOffset = new vec2(164, 9)

padding = {
	top: 6,
	right: 6,
	bottom: 6,
	left: 6
}

combiningTextSpr = spr_backpack_text_combining
combiningTextOffset = new vec2(64, -6)

mergeIcon = spr_backpack_merger_mixer
mergeIconImageIndex = 0
mergeIconOffset = new vec2(127, 16)

mergeResultIconOffset = new vec2(164, 10)

mergeInputOffset = new vec2(120, 40)
mergeInputText = spr_backpack_text_merge
mergeInputIcon = spr_btn_xbox_a
mergeInputDraw = false

iconPlusses = [
	{
		draw: false,
		offset: new vec2(40, 19),
		spriteIndex: spr_backpack_merger_plus,
		imageIndex: 0		
	},
	{
		draw: false,
		offset: new vec2(80, 19),
		spriteIndex: spr_backpack_merger_plus,
		imageIndex: 0		
	}
]

itemPedestals = [
	{
		draw: true,
		offset: new vec2(13, 33),
		spriteIndex: spr_backpack_item_pedestal,
		imageIndex: 0		
	},
	{
		draw: false,
		offset: new vec2(53, 33),
		spriteIndex: spr_backpack_item_pedestal,
		imageIndex: 1		
	},
	{
		draw: false,
		offset: new vec2(93, 33),
		spriteIndex: spr_backpack_item_pedestal,
		imageIndex: 2		
	}
]


///@description					Adds an item to merge
///@param {id.Instance} _item	Item to add, must be child of obj_merger_item
addMergingItem = function(_item) {
	array_push(mergingItems, _item)

	updatePedestalStates()
	//checkMergingItems()
}

///@description					Removes an item to merge
///@param {id.Instance} _item	Item to add, must be child of obj_merger_item
removeMergingItem = function(_item) {
	for (var i = 0; i < array_length(mergingItems); i++) {
		if (mergingItems[i] == _item) {
			array_delete(mergingItems, i, 1)
			break
		}
	}
	
	updatePedestalStates()
	//checkMergingItems()
}

///@description					Updates the visauls for pedestals and plusses
updatePedestalStates = function() {
	iconPlusses[0].draw = array_length(mergingItems) >= 1
	iconPlusses[1].draw = array_length(mergingItems) >= 2
	iconPlusses[0].imageIndex = (array_length(mergingItems) >= 2) ? 1 : 0
	iconPlusses[1].imageIndex = (array_length(mergingItems) == 3) ? 1 : 0
	
	itemPedestals[0].draw = true
	itemPedestals[1].draw = array_length(mergingItems) >= 1
	itemPedestals[2].draw = array_length(mergingItems) >= 2
}

///@description					Checks merging items
checkMergingItems = function() {
	var _recipe = obj_recipe_controller.checkItems(mergingItems)
	
	if (_recipe == obj_recipe_controller.invalidRecipe) {
		combineSlotIndex = 0
		combineSlotItemSprite = spr_none
	} else {
		combineSlotIndex = 1
		combineSlotItemSprite = _recipe.icon
	}
}

///@description						Sets if the merge is valid or not
///@param {asset.GMSprite} _icon	Icon to set for the merge slot
setValidMerge = function(_icon) {
	combineSlotIndex = 1
	combineSlotItemSprite = _icon
	mergeInputDraw = true
	mergeIconImageIndex = 1
}

setInvalidMerge = function() {
	combineSlotIndex = 0
	combineSlotItemSprite = spr_none
	mergeInputDraw = false
	mergeIconImageIndex = 0
}

///@description						Clears all items from merge
clear = function() {
	mergingItems = []
	updatePedestalStates()
	setInvalidMerge()
}

show = function() {
	image_alpha = 1
}

hide = function() {
	image_alpha = 0
}