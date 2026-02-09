///@description		Init

menu = noone
state = buttonStates.normal
width = 0
height = 0

nameFont = font_dogica_s
costFont = font_aseprite

spriteHeight = sprite_get_height(spr_backpack_slot_inactive)

soldOut = false
soldOutSprite = spr_shop_text_sold_out
soldOutWidth = sprite_get_width(soldOutSprite)
soldOutHeight = sprite_get_height(soldOutSprite)

padding = {
	top: 6,
	left: 8,
	right: 8,
	bottom: 6
}

iconOffsetX = 137
iconOffsetY = 4

activated = false
item = noone

restingOffset = 0

mergeIconOffset = new vec2(161, 28)
mergeIconActive = false

///@description					Attaches an item to the button
///@param {id.Instance} _item	Item to attach
attachItem = function(_item) {
	if (_item == noone) {
		soldOut = true
		state = buttonStates.disabled
	}
	
	item = _item
	activated = true
}

///@description					Attaches an item to the button
///@param {id.Instance} _item	Item to attach
removeItem = function(_item) {
	item = noone
	state = buttonStates.disabled
}

///@description					Does all the necessary stuff to set to sold out
///
setToSoldOut = function() {
	soldOut = true
	item = noone
	state = buttonStates.disabled
}
