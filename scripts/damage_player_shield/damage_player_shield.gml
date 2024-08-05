///@description   Description
function damage_player_shield(_amount, _player) {
	with (obj_buff) {
		if (owner == _player && shield && damageDelayCdCur <= 0) {
			activate_player_on_hit_abilities(_player)
			
			damageDelayCdCur = damageDelayCdMax
			hp -= _amount
			
			if (hp <= 0) {
				_player.lastHitOn = _player.age
			}
			
			onDamage()
		}
	}
}