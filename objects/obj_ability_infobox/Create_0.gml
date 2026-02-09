/// @description Setup

enum infoboxSpriteColorIndices {
	combat,
	storm,
	nature,
	survival	
}

persistent = true

ability = noone

titleFont = font_alagard
levelColor = c_white
levelFont = font_aseprite
descriptionFont = font_aseprite
statFont = font_aseprite

titleText = ""
levelText = ""
descriptionText = ""

statBonuses = []

padding = {
	top: 9,
	left: 10,
	right: 10,
	bottom: 10
}

lineSpacing = -2
lineSpacingSm = -5
statLineSpacing = 14

width = 0
height = 0

///@description					Shows the infobox and its buttons
show = function() {
	image_alpha = 1
}

///@description					Hides the infobox and its buttons
hide = function() {
	image_alpha = 0
}

///@description					Setup the infobox with an item
///@param {id.Instance} _item	Item to add to the slot
updateAbility = function(_ability) {
	ability = _ability
	
	if (ability == noone) {
		return 0
	}
	
	switch (ability.iconColor) {
		case enumAbilityColor.blue:
			image_index = infoboxSpriteColorIndices.storm
			fontColor = global.colorBlue
		break
		
		case enumAbilityColor.orange:
			image_index = infoboxSpriteColorIndices.combat
			fontColor = global.colorOrange
		break
		
		case enumAbilityColor.green:
			image_index = infoboxSpriteColorIndices.nature
			fontColor = global.colorGreen
		break
		
		case enumAbilityColor.survival:
			image_index = infoboxSpriteColorIndices.survival
			fontColor = global.colorBlue
		break
	}
	
	titleText = ability.name
	levelText = "Level " + string(ability.level)
	descriptionText = ability.description
	
	statBonuses = []
	
	for (var i = 0; i < array_length(ability.charStatBonuses); i++) {
		var _bonusBlock = new abilityStatInfoTextBlock()
		var _statString = ""
		var _color = c_white
		
		_bonusBlock.name = ability.charStatBonuses[i].name
		_bonusBlock.description = ability.charStatBonuses[i].description
		
		var _iconSpriteIndex = ability.charStatBonuses[i].active ? spr_ui_ability_stat_checked : spr_ui_ability_stat_unchecked
		var _iconImageIndex = 0
		
		switch (ability.charStatBonuses[i].stat) {
			case enumCharStats.str: 
				_statString = "STR";
				_color = global.colorDarkRed
				_iconImageIndex = 0
			break;
			
			case enumCharStats.dex:
				_statString = "DEX"; 
				_color = global.colorDarkGreen
				_iconImageIndex = 1
			break;
			
			case enumCharStats.int:
				_statString = "INT";
				_color = global.colorDarkBlue
				_iconImageIndex = 2
			break;
		}
		
		_bonusBlock.statString = string(ability.charStatBonuses[i].amount) + " " + _statString
		_bonusBlock.nameColor = _color
		_bonusBlock.iconSpriteIndex = _iconSpriteIndex
		_bonusBlock.iconImageIndex = _iconImageIndex
		
		array_push(statBonuses, _bonusBlock)
	}
	
	updateSize()
	updatePosition()
}

///@description					Sets window size based on selected item
updateSize = function() {
	width = 175
	height = padding.top + padding.bottom
	
	draw_set_font(titleFont)
	height += string_height(titleText) + lineSpacing
	
	draw_set_font(levelFont)
	height += string_height(levelText) + lineSpacing
	
	draw_set_font(descriptionFont)
	height += string_height_ext(descriptionText, lineSpacingSm, width - padding.left - padding.right)
	
	height += statLineSpacing
	
	for (var i = 0; i < array_length(statBonuses); i++) {
		height += string_height(statBonuses[i].name)
		height += lineSpacingSm
		
		height += string_height_ext(
			statBonuses[i].description,
			lineSpacingSm,
			width - padding.left - padding.right
		)
		
		height += statLineSpacing
	}
	
	height += padding.bottom
	
	image_xscale = width / sprite_get_width(spr_backpack_window_popup)
	image_yscale = height / sprite_get_height(spr_backpack_window_popup)
}

///@description					Updates X and Y draw coordinates, must be set after updateSize() to work
updatePosition = function() {
	x = ability.iconX + (ability.sprite_width / 2) - (width / 2)
	y = ability.iconY - height - 20
}
