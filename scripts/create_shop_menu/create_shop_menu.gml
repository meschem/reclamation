///@description   Description
function create_shop_menu() {
	var menu = create_instance(obj_shop_menu)
	var equipmentList = create_gear_roll(-1, -1, 4)
	
	for (var i = 0; i < array_length(equipmentList); i++) {
		menu.addShopButton(equipmentList[i])
	}
	
	menu.setButtonSpacing()
	menu.display = true	
}