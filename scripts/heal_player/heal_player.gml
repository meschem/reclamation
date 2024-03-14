///@description						Heals the player
///@param {id.Instance} _player		Player 
///@param {real} _amount			Amount to heal player. 1 pip is 10 hp.
function heal_player(_player, _amount) {
	with (_player) {
		hp += _amount
		
		if (hp > maxHp) {
			hp = maxHp
		}
		
		for (var i = 0; i < array_length(onHealAbilities); i++) {
			onHealAbilities[i].activateOnHeal()
		}
		
		var _txt = create_moving_text($"+{_amount}", x, y - 15)
		_txt.fontColor = get_color(colors.red)
	}
}
