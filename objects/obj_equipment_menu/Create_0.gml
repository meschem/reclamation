///@description							Shop menu

title = ""

parentMenu = noone
player = noone

width = 261
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

selectedButtonIndex = 0
selectedButton = noone

inventoryButtonWidth = 40
inventorySlotsPerRow = 6
inventoryPanelRowIndex = 0
inventoryFirstIndex = 6

weaponButtonWidth = 50

var _equippedPanel = create_instance(obj_menu_panel)
_equippedPanel.height = 220
_equippedPanel.menu = id
array_push(panels, _equippedPanel)

var _inventoryPanel = create_instance(obj_menu_panel)
_inventoryPanel.height = 80
_inventoryPanel.menu = id
_inventoryPanel.offsetY = 228
array_push(panels, _inventoryPanel)

///@description						
///@param {real} _index				Index of the button to activate
activateButton = function(_index) {
	var _button = buttons[_index]
	var _equipment = _button.equipment
	
	if (_equipment == noone || _button.slot == equipmentSlots.weapon) {
		return 0
	}
	
	var _structKey = get_equipment_struct_key_from_slot(_equipment.slot)


	if (_equipment.equipped) {
		// Moves equipment from equipped to inventory
		var _inventoryButtonIndex = findNextInventorySlot()
		
		if (_inventoryButtonIndex == -1) {
			return 0
		}
	
		player.removeEquipment(_structKey)

		buttons[_inventoryButtonIndex].equipment = _button.equipment
		buttons[_inventoryButtonIndex].sprite = _button.sprite
		buttons[_inventoryButtonIndex].iconSpriteIndex = _button.iconSpriteIndex
		
		_button.equipment = noone
		_button.iconSpriteIndex = 0
		_button.sprite = _button.baseSprite				
	} else {
		// Equips equipment, possibly removes equipped equipment
		player.equipItem(_equipment)
		
		var _swapSprite = spr_none
		var _swapIconIndex = 0
		var _swapEquipment = noone
		
		for (var i = 0; i < array_length(buttons); i++) {
			// Find correct equipment slot via _structKey string
			if (buttons[i].slot == _structKey) {
				if (buttons[i].equipment != noone) {
					// If slot is equipped, need to swap sprites, store temps
					_swapSprite = buttons[i].sprite
					_swapIconIndex = buttons[i].iconSpriteIndex
					_swapEquipment = buttons[i].equipment
				}
				
				// Replace
				buttons[i].sprite = _button.sprite
				buttons[i].iconSpriteIndex = _button.iconSpriteIndex
				buttons[i].equipment = _button.equipment
			}
		}
		
		_button.sprite = _swapSprite
		_button.iconSpriteIndex = _swapIconIndex
		_button.equipment = _swapEquipment
	}
}

///@description						Finds the next open inventory slot for an item to be placed in
findNextInventorySlot = function() {
	for (var i = inventoryFirstIndex; i < array_length(buttons); i++) {
		if (buttons[i].equipment == noone) {
			return i
		}
	}
	
	create_toaster("equipment full")
	
	return -1
}	

///@description						Sets up item buttons
///@param {id.Instance} _player		Player to setup items for
setupButtons = function(_player) {
	addSlotButton(12, 8, _player.equipment.weapon, spr_inv_icon_weapon, "weapon")
	addSlotButton(12, 80, _player.equipment.gloves, spr_inv_icon_hands, "gloves")
	addSlotButton(12, 148, _player.equipment.boots, spr_inv_icon_boots, "boots")
	addSlotButton(110, 8, _player.equipment.head, spr_inv_icon_head, "head")
	addSlotButton(110, 80, _player.equipment.neck, spr_inv_icon_neck, "neck")
	addSlotButton(110, 148, _player.equipment.chest, spr_inv_icon_chest, "chest")
	addSlotButton(200, 148, _player.equipment.ringLeft, spr_inv_icon_ring, "ringLeft")
	
	inventoryFirstIndex = 7		// ugly, but should equal how many inventory slots are player equipment slots
	
	var _inventoryEquipment = []
	
	with (obj_equipment) {
		if (owner == _player && !equipped) {
			array_push(_inventoryEquipment, id)
		}
	}
	
	var _rowIndex = 0
	var _colIndex = 0
	var _colsPerRow = 6	
	var _spacing = 3
	var _iconSize = 38
	var _padding = 8
	var _equipment = noone
	var _processingInventory = true
	var _inventoryPanel = panels[1]
	var _sprite = spr_none
	var i = 0
	
	while (_processingInventory) {
		if (i < array_length(_inventoryEquipment)) {
			_equipment = _inventoryEquipment[i]
			_sprite = spr_inv_icon_hands
		} else {
			_equipment = noone
			_sprite = spr_none
		}
		
		addSlotButton(
			_inventoryPanel.x + _inventoryPanel.offsetX + _padding + (_spacing * _colIndex) + (_iconSize * _colIndex),
			_inventoryPanel.y + _inventoryPanel.offsetY + _padding + (_spacing * _rowIndex) + (_iconSize * _rowIndex),
			_equipment,
			_sprite
		)
		
		_colIndex++
		i++
		
		if (_colIndex >= _colsPerRow) {
			if (_equipment == noone) {
				_processingInventory = false
			} else {
				_colIndex = 0
				_rowIndex++
			}
		}
		
		if (i > 1000) {
			show_error("i > 1000 when building inventory slots", true)
		}
	}
}

///@description			Closes the menu
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

///@description							Sets up item buttons
///@param {real} _x						X coordinate
///@param {real} _y						Y coordinate
///@param {id.Instance} _equipment		Equipment to reference
///@param {asset.GMSprite} _baseSprite	Sprite to reference
///@param {real} _slot					Slot occuppied if not an inventory slot
///@return {id.Instance}
addSlotButton = function(_x, _y, _equipment = noone, _baseSprite = spr_none, _slot = equipmentSlots.none) {
	var _btn = instance_create_depth(x + _x, y + _y, depth - 2, obj_equipment_slot_button)
	
	_btn.equipment = _equipment
	_btn.width = inventoryButtonWidth
	_btn.height = inventoryButtonWidth
	_btn.slot = _slot
	_btn.baseSprite = _baseSprite
	
	if (_equipment == noone) {
		_btn.iconSpriteIndex = 0
		_btn.sprite = _baseSprite
	} else {
		if (_equipment.slot == equipmentSlots.weapon) {
			_btn.descriptionLines = 3
		}
	
		_btn.sprite = _equipment.icon
		_btn.iconSpriteIndex = _equipment.iconSpriteIndex
	}
	
	_btn.image_xscale = _btn.width / _btn.sprite_width
	_btn.image_yscale = _btn.height / _btn.sprite_height
	
	array_push(buttons, _btn)
	
	return _btn
}
