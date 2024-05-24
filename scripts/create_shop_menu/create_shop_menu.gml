///@description   Description
function create_shop_menu(_equipmentList = [], _merchant = noone) {
	var menu = create_instance(obj_shop_menu)
	
	if (array_length(_equipmentList) == 0) {
		_equipmentList = create_gear_roll(4)
	}
	
	for (var i = 0; i < array_length(_equipmentList); i++) {
		menu.addShopButton(_equipmentList[i])
	}
	
	menu.setButtonSpacing()
	menu.display = true	
	menu.merchant = _merchant
}
