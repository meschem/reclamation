///@description					Creates moving text using damage styles
///@param {real} _x
///@param {real} _y
///@param {real} _amount
///@param {real} _style			Uses enum damageTextStyles
function create_pickup_text(_x, _y, _amount, _style) {
	var _inst = instance_create_depth(
		_x + irandom_range(-5, 5),
		_y + irandom_range(-5, 5),
		depths.ui,
		obj_pickup_numbers
	)
	
	_inst.xVel = random_range(-0.3, 0.3)

	var _displayAmount = round(_amount)
		
	switch (_style) {
		case pickupTextStyles.normal:
			_inst.setValue(_displayAmount, false)
		break
			
		case pickupTextStyles.gold:
			_inst.setValue(_displayAmount, false, get_color(colors.yellow), spr_pickup_icon_gold)
		break
			
		case pickupTextStyles.hp:
			_inst.setValue(_displayAmount / 10, false, get_color(colors.red), spr_pickup_icon_hp)
		break
			
		case pickupTextStyles.xp:
			_inst.setValue(_displayAmount, false, get_color(colors.blue), spr_pickup_icon_xp)
		break
				
		default:
			_inst.setValue(_displayAmount)
		break
	}
}

///@description						Creates moving text using damage styles. Doesn't randomize position.
///@param {real} _x					X Pos
///@param {real} _y					Y Pos
///@param {real} _amount			Number Value
///@param {constant.Color} _color	Color of the text
///@param {asset.GMSprite} _icon	Icon to use
///@param {string} _text			Text to display, currently NOT SUPPORTED
///@return {id.Instance}
function create_pickup_text_custom(_x, _y, _amount, _color = c_white, _icon = spr_none, _text = "") {
	var _inst = instance_create_depth(
		_x,
		_y,
		depths.ui,
		obj_pickup_numbers
	)
	
	_inst.xVel = random_range(-0.3, 0.3)

	var _displayAmount = round(_amount)
	
	_inst.setValue(_displayAmount, false, _color, _icon)
	_inst.text = _text
	
	return _inst
}

///@description					Gets the sprite of the icon to display next to txt damage
///@param {real} _pickupType	Pickup type
function get_pickup_text_icon(_pickupType) {
	switch (_pickupType) {
		case pickupTextStyles.none:
		case pickupTextStyles.normal:
			return spr_none
			
		case pickupTextStyles.gold:
			return spr_pickup_icon_gold
			
		case pickupTextStyles.hp:
			return spr_pickup_icon_hp
		
		case pickupTextStyles.xp:
			return spr_pickup_icon_xp
			
		case pickupTextStyles.str:
			return obj_player_stats_stat_item_str
		
		case pickupTextStyles.dex:
			return obj_player_stats_stat_item_dex
			
		case pickupTextStyles.int:
			return obj_player_stats_stat_item_int
			
		default:
			return spr_none
	}
}

enum pickupTextStyles {
	none,
	normal,
	gold,
	hp,
	xp,
	str,
	dex,
	int
}