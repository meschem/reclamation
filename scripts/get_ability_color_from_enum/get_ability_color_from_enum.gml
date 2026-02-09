///@description						Gets a single color
///@param {real} _iconColor			uses enumAbilityColor
///@param {bool} _primary			Returns the primary color. False returns secondary
///@return {constant.Color}
function get_ability_color_from_enum(_iconColor, _primary = true) {
	var _color = c_white

	switch (_iconColor) {
		case enumAbilityColor.red:
			_color = _primary ? global.colorRed : global.colorDarkRed
		break
		
		case enumAbilityColor.orange:
			_color = _primary ? global.colorOrange : global.colorDarkRed
		break
		
		case enumAbilityColor.yellow:
			_color = _primary ? global.colorYellow : global.colorDarkYellow
		break
		
		case enumAbilityColor.green:
			_color = _primary ? global.colorGreen : global.colorDarkGreen
		break
		
		case enumAbilityColor.blue:
			_color = _primary ? global.colorAqua : global.colorDarkBlue
		break
		
		case enumAbilityColor.purple:
			_color = _primary ? global.colorPurple : global.colorDarkPurple
		break
		
		case enumAbilityColor.survival:
			_color = _primary ? global.colorBlue : global.colorOrange
		break
	}
	
	return _color
}