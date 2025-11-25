
event_inherited()

itemList = []
maxItems = 6
merchant = noone					// window dressing for the moment
shopType = shopTypes.mergers
shopActive = false					// used for initialization
shopOpen = false
itemCountMax = 6

mapIcon = spr_poi_shop

///@description					Sets up gear for the shop
///@param {real} _count			Amount of items to add
///@param {real} _rarity		Rarity of items to add
addItems = function(_count, _rarity) {
	for (var i = 0; i < _count; i++) {
		var _merger = obj_merger_item_controller.createItem(noone, _rarity)
		var _cost = 150
		var _player = get_first_player()
		
		switch (_rarity) {
			case enumRarity.magic:
				_cost = 250
			break
			
			case enumRarity.rare:
				_cost = 500
			break
			
			case enumRarity.legendary:
				_cost = 800
			break
		}
		
		var _luck = get_player_stat(enumPlayerStats.magicFind, _player)
		
		if (random(1) < (0.1 * (_luck + 1))) {
			_merger.cost = _cost * 0.5
			_merger.discount = true
		} else {
			_merger.cost = _cost
			_merger.discount = false
		}
		
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
	if (!shopActive) {
		activate()
	}
	
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
	
	
	if (instance_exists(obj_run_controller) && !obj_run_controller.firstShopHit) {
		obj_run_controller.firstShopHit = true
		var _boots = obj_merger_item_controller.createSpecificItem(noone, obj_mg_simple_boots)
		_boots.cost = 150
		array_push(itemList, _boots)
		addItems(1, enumRarity.normal)
		addItems(2, enumRarity.magic)
		addItems(1, enumRarity.rare)
	}
	
	if (array_length(itemList) == 0) {
		addItems(2, enumRarity.normal)
		addItems(2, enumRarity.magic)
		addItems(1, enumRarity.rare)
		//addItems(1, enumRarity.legendary)
	}
	
	shopActive = true
}
