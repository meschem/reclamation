
///@description					Creates a UI text block
///@param {string} _text
///@param {real} _x
///@param {real} _y
///@param {asset.GMFont} _font
///@param {constant.Color} _color
///@param {real} _duration
function create_text(_text, _x, _y, _font, _color = c_white, _duration = stf(6)) {
	var _inst = create_instance(obj_text)
	
	_inst.displayText = _text
	_inst.displayVec.x = _x
	_inst.displayVec.y = _y
	_inst.font = _font
	_inst.color = _color
	_inst.lifeSpan = _duration
}
