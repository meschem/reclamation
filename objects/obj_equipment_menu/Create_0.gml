///@description							Shop menu

title = ""

parentMenu = noone

width = 260
height = 330

image_xscale = width / sprite_width
image_yscale = height / sprite_height

x = (view_width() - width) / 2
y = (view_height() - height) / 2

buttonRowCount = 2
buttonColumnCount = 3
buttonSpacing = 60
display = false

buttonWidth = 60
buttonHeight = 80

curRow = 0
curColumn = 0

padding = 5

buttons = []
panels = []

selectedButton = 0

inventoryButtonWidth = 40
inventorySlotsPerRow = 6
inventoryPanelRowIndex = 0

var _equippedPanel = create_instance(obj_menu_panel)
_equippedPanel.height = 220
_equippedPanel.menu = id
array_push(panels, _equippedPanel)

var _inventoryPanel = create_instance(obj_menu_panel)
_inventoryPanel.height = 80
_inventoryPanel.menu = id
_inventoryPanel.offsetY = 228
array_push(panels, _inventoryPanel)

setupButtons = function(_player) {
	addSlotButton(12, 8, _player.equipment.weapon)
	addSlotButton(12, 80, _player.equipment.gloves)
	addSlotButton(12, 148, _player.equipment.boots)
	addSlotButton(110, 8, _player.equipment.head)
	addSlotButton(110, 80, _player.equipment.neck)
	addSlotButton(110, 148, _player.equipment.chest)
	addSlotButton(200, 148, _player.equipment.ringLeft)
	
	var _playerEquipment = []
	var _rowIndex = 0
	var _col = 0
	var _offsetX = 0
	var _offsetY = 0
	var _padding = 8
	
	//with (obj_equipment) {
	//	if (owner == _player) {
	//		array_push(_playerEquipment, id)
	//	}
	//}
	
	//for (var i = 0; i < array_length(_playerEquipment); i++) {
	//	_offsetX = (_padding * (i + 1)) + (inventoryButtonWidth * i)
		
	//	addSlotButton(panels[1].x + _offsetX, panels[1].y + padding, _playerEquipment[i])
	//}
}

close = function() {
	array_foreach(buttons, function(_button) {
		instance_destroy(_button)
	})
	
	array_foreach(panels, function(_panel) {
		instance_destroy(_panel)
	})
	
	buttons = []
	panels = []
	
	if (parentMenu != noone) {
		parentMenu.show()
	} else {
		set_game_pause_state(false)
	}
	
	instance_destroy()
}

addSlotButton = function(_x, _y, _equipment = noone) {
	var _btn = instance_create_depth(x + _x, y + _y, depth - 2, obj_equipment_slot_button)
	
	_btn.equipment = _equipment
	_btn.width = inventoryButtonWidth
	_btn.height = inventoryButtonWidth
	
	_btn.image_xscale = _btn.width / _btn.sprite_width
	_btn.image_yscale = _btn.height / _btn.sprite_height
	
	array_push(buttons, _btn)
}
