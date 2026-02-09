///@description							Shop menu

enum shopMenuStates {
	init,
	closed,
	closing,
	opening,
	open
}

state = shopMenuStates.init
stateAge = 0
stateAgeMax = 1

title = ""

zone = noone

width = 196
height = 40
heightFull = 348
heightCurve = animcurve_get_channel(ac_merger_menu_bg_height, "height")
spriteIndex = spr_shop_bg_banner
player = get_first_player()
padding = 14

image_xscale = 0
image_yscale = 0

x = 8
y = 0

depth = -500

merchant = noone

buttonWidth = 170
buttonHeight = 37
buttonSpacing = 44
buttonTopOffsetY = 72

shopSign = noone

buttons = []
chains = []
chainsBig = noone

selectedSlot = 0
selector = noone

itemInfoBox = noone

skipStep = false

set_game_pause_state(true)

///@description							Move to open
stateOpeningToOpen = function() {
	height = heightFull
	
	if (array_length(buttons) == 0) {
		create_toaster("Shop transition to OPEN without BUTTONS", errorLevels.warning)
		return 0
	}
	
	selector = instance_create_depth(buttons[selectedSlot].x, buttons[selectedSlot].y, depth - 200, obj_shop_menu_selector)
	
	itemInfoBox = create_instance(obj_backpack_item_infobox)
	
	itemInfoBox.x = x + width + 2
	itemInfoBox.y = buttons[0].y
	
	itemInfoBox.showButtonCombine = false
	itemInfoBox.showButtonSwap = false
	itemInfoBox.showButtonPurchase = true
	
	itemInfoBox.updateItem(buttons[selectedSlot].item)
	
	itemInfoBox.show()
	
	stateAge = 0
	state = shopMenuStates.open

}

///@description							Gets a list of items from the shop
///@return {array<Id.Instance>}
getItemList = function() {

}

///@description							Sets up buttons with available items
///@param {array} _items				Items to setup buttons with
setupButtons = function(_items) {
	var _button = noone
	var _depthOffset = 0
	
	if (array_length(_items) == 0) {
		create_toaster("Shop menu SETUP without ITEMS", errorLevels.warning)
	}
	
	for (var i = 0; i < array_length(_items); i++) {
		_button = create_instance(obj_merchant_button)
		_button.menu = id
		_button.depth = depth - 50 + _depthOffset
		_button.attachItem(_items[i])
		_button.width = buttonWidth
		_button.image_xscale = buttonWidth / sprite_get_width(spr_backpack_slot_inactive)
		_button.x = x + (width / 2) - (buttonWidth / 2)
		_button.restingOffset = buttonTopOffsetY + (i * 43) // magic number, sprite height of this and chains
		
		array_push(buttons, _button)
		
		if (i < array_length(_items) - 1) {
			var _chains = instance_create_depth(-99, -99, _button.depth + 1, obj_merchant_shop_chains)
			
			_chains.restingOffset = buttonTopOffsetY + (i * 43) + 33 // magic number, sprite height of this and chains
			_chains.x = x + (width / 2) - (sprite_get_width(spr_shop_chains_small) / 2)
			
			array_push(chains, _chains)
		}
		
		_depthOffset += 1
	}	
}

///@description							Tries to buy an item
tryPurchase = function() {
	var _item = buttons[selectedSlot].item
	
	if (_item == noone) {
		create_toaster("Sold out!")
		return 0
	}
	
	if (player.gold < _item.cost) {
		create_toaster("You've not enough gold")
		return 0
	}
	
	player.gold -= _item.cost
	
	buttons[selectedSlot].setToSoldOut()
	
	if (player_backpack_is_full()) {
		var _globe = instance_create_depth(player.x, player.y, depths.enemy, obj_equipment_globe_preset)
		_globe.isMergerItem = true
		_globe.attachEquipment(_item)
		
		return 0
	}
	
	audio_play_sound(snd_leathery_thud, 1, 0)
	
	zone.removeItem(_item)
	
	_item.owner = player
	player.backpack.addItem(_item)
}

///@description							Activates the menu for it to work
///@param {array} _items				Items to setup buttons with
activate = function(_items) {
	setupButtons(_items)
	
	shopSign = instance_create_depth(x + (width / 2) - (sprite_get_width(spr_shop_top_sign) / 2), -99, depth - 100, obj_merchant_shop_sign)
	shopSign.restingOffset = 15
	
	chainsBig = instance_create_depth(x + (width / 2) - (sprite_get_width(spr_shop_chains_big) / 2), -99, depth - 95, obj_merchant_shop_chains_big)
	chainsBig.restingOffset = 52
	
	state = shopMenuStates.opening
	stateAge = 0
	stateAgeMax = 30
		
	var _backpackItems = player.backpack.getItemList()
		
	var _combinedItems = array_concat(
		_backpackItems,
		_items
	)
	
	var _recipes = get_valid_recipes(_combinedItems)
	
	mark_valid_ingredients(_recipes, _items)
	
	image_xscale = width / sprite_get_width(spriteIndex)
	image_yscale = height / sprite_get_height(spriteIndex)

	audio_play_sound(snd_leather_heavy, 1, 0)
	
	set_ui_focus_type(uiFocusTypes.shop)
	set_ui_profile_type(uiProfileTypes.shop)
	
	player.backpack.activateSimpleDisplay(
		view_width() - player.backpack.width - 8,
		(view_height() / 2) - (player.backpack.height / 2)
	)
}

///@description							Close the menu
close = function() {
	array_foreach(buttons, function(button) {
		instance_destroy(button)
	})
	
	array_foreach(chains, function(chain) {
		instance_destroy(chain)
	})
		
	if (merchant != noone) {
		merchant.deactivate()
	}
	
	skipStep = true
	
	set_ui_focus_type(uiFocusTypes.none)
	set_ui_profile_type(uiProfileTypes.gameplay)
	
	player.backpack.deactivateSimpleDisplay()
	
	instance_destroy()
}
