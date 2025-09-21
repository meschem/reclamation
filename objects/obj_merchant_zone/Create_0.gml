event_inherited()

equipmentList = []
maxItems = 4
merchant = noone					// window dressing for the moment
shopType = shopTypes.equipment
shopActive = false

mapIcon = spr_poi_generic

//playerInArea = false
//controllerInput = gp_face1
//keyboardInput = "G"

//infoTextOffset = new vec2(25, -17)

deactivate = function() {
	shopActive = false
}

///@description					Sets up gear for the shop
///@param {real} _level			Difficulty level to use to create items. Used?
addEquipment = function(_level = 0) {
	var _equipment, _rarity
	
	for (var i = 0; i < maxItems; i++) {
		_rarity = get_random_rarity()
		_equipment = create_gear_roll(4)
		
		array_push(equipmentList, _equipment[0])
	}
}

activate = function() {
	if (shopActive) {
		return 0
	}
	
	if (array_length(equipmentList) == 0) {
		addEquipment()
	}
	
	shopActive = true

	switch (shopType) {
		case shopTypes.equipment:
			create_shop_menu(equipmentList, id)
		break
	}
}
