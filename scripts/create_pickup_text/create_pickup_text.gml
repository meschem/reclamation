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