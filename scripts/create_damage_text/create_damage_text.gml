///@description					Creates moving text using damage styles
///@param {real} _x
///@param {real} _y
///@param {real} _amount
///@param {real} _style			Uses enum damageTextStyles
function create_damage_text(_x, _y, _amount, _style) {
	var _inst = instance_create_depth(
		_x + irandom_range(-5, 5),
		_y + irandom_range(-5, 5),
		depths.ui,
		obj_dmg_numbers
	)
	
	_inst.xVel = random_range(-0.3, 0.3)
		
	var _displayAmount = round(_amount)
		
	switch (_style) {
		case damageTextStyles.crit:
			_inst.setValue(_displayAmount, true, get_color(colors.orange))
		break
			
		case damageTextStyles.poison:
			_inst.setValue(_displayAmount, false, get_color(colors.green), spr_dmg_icon_poison)
		break
			
		case damageTextStyles.lightning:
			_inst.setValue(_displayAmount, false, get_color(colors.yellow), spr_dmg_icon_lightning)
		break
			
		case damageTextStyles.cold:
			_inst.setValue(_displayAmount, false, get_color(colors.blue), spr_dmg_icon_cold)
		break
			
		case damageTextStyles.fire:
			_inst.setValue(_displayAmount, false, get_color(colors.red), spr_dmg_icon_fire)
		break
				
		default:
			_inst.setValue(_displayAmount)
		break
	}
		
		//if (_style == damageTextStyles.crit) {
		//	_inst.setValue(_displayAmount, true)
		//} else if (_style == damageTextStyles.poison) {
		//	_inst.setValue(_displayAmount)
		//	_inst.image_blend = get_color(colors.green)
		//} else {
		//	_inst.setValue(_displayAmount)
		//}
}

///@description					Gets the sprite of the icon to display next to txt damage
///@param {real} _damageType	Damage type. Uses num damageTextStyles
function get_damage_text_icon(_damageType) {
	switch (_damageType) {
		case damageTextStyles.none:
		case damageTextStyles.normal:
			return spr_none
			
		case damageTextStyles.poison:
			return spr_dmg_icon_poison
			
		case damageTextStyles.lightning:
			return spr_dmg_icon_lightning
		
		case damageTextStyles.cold:
			return spr_dmg_icon_cold
		
		case damageTextStyles.fire:
			return spr_dmg_icon_fire
		
		default:
			return spr_none
	}
}
