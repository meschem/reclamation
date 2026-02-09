///@description			Init

equipment = noone
gearString = ""
index = 0
descriptionLines = 2

drawEquipmentInfo = false
drawWeaponInfo = false

xOffset = 40
yOffset = 0
infoPanelWidth = 180
infoPanelHeight = 128
padding = 5
lineSpacing = 12

sprite = spr_none
iconSpriteIndex = 0

sprHeight = 21
sprWidth = 18

drawLine = 0
drawSpacing = 0

infoBoxYDraw = 0

setInfoPanelHeight = function() {
	var _lines = 5 // name, rarity, description, blank line
	
	if (equipment.slot == equipmentSlots.weapon) {
		_lines += 5
		
		for (var i = 0; i < array_length(equipment.upgradesMajor); i++) {
			if (equipment.upgradesMajor[i].active) _lines += 4
		}
	} else {
		if (equipment != noone) {
			switch (equipment.rarity) {
				case enumRarity.normal:
					_lines += 1
				break
			
				case enumRarity.magic:
					_lines += 2
				break
			
				case enumRarity.rare:
				case enumRarity.legendary:
					_lines += 3
				break
			}
		}
	}
	
	infoPanelHeight = (padding * 2) + (_lines * lineSpacing)
	
	var _maxY = camera_get_view_height(view_camera[0]) - infoPanelHeight - 8
	
	infoBoxYDraw = min(_maxY, y + yOffset)
}

///@description				Gets the Y offset to start from
getYOffset = function() {
	return (padding + (lineSpacing * drawLine) + drawSpacing) + yOffset
}

///@description				Draws a string on a line with an effective line return
///@param {string} _str		str to draw
drawTextLine = function(_str, _y = y) {
	var _yOffset = getYOffset()
	//var yOffset = padding + (lineSpacing * drawLine) + drawSpacing
	//draw_text(x + padding, y + yOffset, str)
	
	draw_text_ext(
		x + padding + xOffset,
		_y + _yOffset,
		_str,
		lineSpacing,
		infoPanelWidth - (padding * 2)
	)

	drawLine++
}
