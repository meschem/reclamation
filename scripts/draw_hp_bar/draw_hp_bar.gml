///@description		Draws an HP bar
///@param {struct}	_hpBarInfo
///@param {real}	_percent
function draw_hp_bar(_hpBarInfo, _percent) {
	draw_set_color(c_black)
	
	draw_rectangle(
		_hpBarInfo.xPos - 1,
		_hpBarInfo.yPos - 1,
		_hpBarInfo.xPos + _hpBarInfo.width + 1,
		_hpBarInfo.yPos + 2,
		false
	)
	
	draw_healthbar(
		_hpBarInfo.xPos, _hpBarInfo.yPos,
		_hpBarInfo.xPos + _hpBarInfo.width, _hpBarInfo.yPos + 1,
		_percent * 100,
		_hpBarInfo.bgColor,
		_hpBarInfo.fillColor,
		_hpBarInfo.fillColor,
		0, true, false
	)
}
