/// @description Setup

persistent = true

item = noone
titleFont = font_alagard
rarityFont = font_aseprite
descriptionFont = font_aseprite
statFont = font_aseprite
buttonFont = font_aseprite

titleText = ""
rarityText = ""
descriptionText = ""

statTextLines = []

padding = {
	top: 9,
	left: 10,
	right: 10,
	bottom: 10
}

rarityColor = get_color(colors.light_green)
lineSpacing = -1
lineSpacingSm = -4
statLineSpacing = 30

width = 0
height = 0

showButtonSwap = true
showButtonCombine = true
showButtonPurchase = false

buttonSwap = create_instance(obj_backpack_infobox_button)
buttonSwap.infobox = id
buttonSwap.setInput(buttonSwap.iconSwap, "Swap")
buttonSwap.depth = depth - 10

buttonCombine = create_instance(obj_backpack_infobox_button)
buttonCombine.infobox = id
buttonCombine.setInput(buttonSwap.iconCombine, "Combine")
buttonCombine.depth = depth - 10

buttonPurchase = create_instance(obj_backpack_infobox_button)
buttonPurchase.infobox = id
buttonPurchase.setInput(buttonSwap.iconPurchase, "Purchase")
buttonPurchase.depth = depth - 10
buttonPurchase.image_alpha = 0

///@description					Shows the infobox and its buttons
show = function() {
	image_alpha = 1
	
	buttonSwap.image_alpha = showButtonSwap
	buttonCombine.image_alpha = showButtonCombine
	buttonPurchase.image_alpha = showButtonPurchase
}

///@description					Hides the infobox and its buttons
hide = function() {
	image_alpha = 0
	buttonSwap.image_alpha = 0
	buttonCombine.image_alpha = 0
	buttonPurchase.image_alpha = 0
}

///@description					Setup the infobox with an item
///@param {id.Instance} _item	Item to add to the slot
updateItem = function(_item) {
	item = _item
	
	if (item == noone) {
		statTextLines = []
		return 0
	}
	
	rarityColor = get_rarity_color(item.rarity)
	rarityText = get_rarity_string(item.rarity)
	titleText = item.name
	descriptionText = item.description
	
	switch (item.rarity) {
		case enumRarity.normal: image_index = 0; break;
		case enumRarity.magic: image_index = 1; break;
		case enumRarity.rare: image_index = 2; break;
		case enumRarity.legendary: image_index = 3; break;
	}
	
	var _stats = []
	
	for (var i = 0; i < array_length(_item.stats); i++) {
		array_push(_stats, _item.stats[i].getDisplayValue(_item.level) + " " + _item.stats[i].getDisplayName())
	}
	
	for (var i = 0; i < array_length(_item.statsSpecial); i++) {
		array_push(_stats, _item.statsSpecial[i])
	}
	
	statTextLines = _stats
	
	updateSize()
	updateButtons()
}

///@description					Sets window size based on selected item
updateSize = function() {
	width = 148
	height = padding.top + padding.bottom
	
	draw_set_font(titleFont)
	height += string_height(titleText) + lineSpacing
	
	draw_set_font(rarityFont)
	height += string_height(rarityText) + lineSpacing
	
	draw_set_font(descriptionFont)
	height += string_height_ext(descriptionText, lineSpacingSm, width - padding.left - padding.right)
	
	height += statLineSpacing
	
	for (var i = 0; i < array_length(statTextLines); i++) {
		height += string_height_ext(
			statTextLines[i],
			lineSpacingSm,
			width - padding.left - padding.right
		)
	}
	
	height += padding.bottom
	
	image_xscale = width / sprite_get_width(spr_backpack_window_popup)
	image_yscale = height / sprite_get_height(spr_backpack_window_popup)
}

updateButtons = function() {
	buttonCombine.x = x + (padding.left)
	buttonCombine.y = y + height - (buttonSwap.height / 2) - 2
	
	buttonPurchase.x = x + (padding.left)
	buttonPurchase.y = y + height - (buttonSwap.height / 2) - 2
	
	buttonSwap.x = x + width - (padding.right) - buttonSwap.width
	buttonSwap.y = y + height - (buttonSwap.height / 2) - 2
}
