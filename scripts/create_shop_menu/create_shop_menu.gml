///@description   Description
///@param {array} _equipmentList			List of equipment
///@param {id.Instance} _merchantZone		Zone to reference
///@param {asset.GMObject} _menuType		Type of shop menu to create
function create_shop_menu(_equipmentList = [], _merchantZone = noone, _menuType = obj_shop_menu) {
	var menu = create_instance(_menuType)
	
	if (array_length(_equipmentList) == 0) {
		_equipmentList = create_gear_roll(4)
	}
	
	for (var i = 0; i < array_length(_equipmentList); i++) {
		menu.addShopButton(_equipmentList[i])
	}
	
	menu.setButtonSpacing()
	menu.display = true	
	menu.merchant = _merchantZone
}
