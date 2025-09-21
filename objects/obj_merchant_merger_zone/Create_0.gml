
event_inherited()

itemList = []
maxItems = 6
merchant = noone					// window dressing for the moment
shopType = shopTypes.mergers
shopActive = false					// used for initialization
shopOpen = false
itemCountMax = 6

mapIcon = spr_poi_generic

///@description					Sets up gear for the shop
///@param {real} _count			Amount of items to add
///@param {real} _rarity		Rarity of items to add
addItems = function(_count, _rarity) {
	for (var i = 0; i < _count; i++) {
		var _merger = obj_merger_item_controller.createItem()
		
		array_push(itemList, _merger)
	}
}

///@description					Removes an item by ID from the list
///@param {id.Instance} _item	Item to remove
removeItem = function(_item) {
	for (var i = 0; i < array_length(itemList); i++) {
		if (itemList[i] == _item) {
			itemList[i] = noone
		}
	}
}

///@description					Opens the shop
open = function() {
	var _menu = create_instance(obj_shop_menu_mergers)
	
	unmark_ingredients(itemList)
	
	_menu.zone = id
	_menu.activate(itemList)
	
	shopOpen = true
}

///@description					Initial activation for the shop
activate = function() {
	if (shopActive) {
		return 0
	}
	
	if (array_length(itemList) == 0) {
		addItems(2, enumRarity.normal)
		addItems(2, enumRarity.magic)
		addItems(1, enumRarity.rare)
		//addItems(1, enumRarity.legendary)
	}
	
	shopActive = true
}
