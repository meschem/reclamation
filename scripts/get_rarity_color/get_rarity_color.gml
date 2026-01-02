///@description   Description
///@param {real} rarity		enumRarity to check for
///@param {bool} useLight   uses the lighter color variant
///@return {constant.Color}
function get_rarity_color(rarity, useLight = false) {
    var _color = c_white
    
	switch (rarity) {
		case enumRarity.normal:
            _color = useLight ? c_white : global.colorGray
        break
		
		case enumRarity.magic:
			_color = useLight ? global.colorGreen : global.colorDarkGreen
        break
		
		case enumRarity.rare:
			_color = useLight ? global.colorBlue : global.colorDarkBlue
        break
		
		case enumRarity.legendary:
			_color = useLight ? global.colorRed : global.colorDarkRed
        break
	}
    
    return _color
}
