///@description						Sets up an elite baddie with a random buff
///@param {id.Instance} _baddie		Baddie to apply buff to
///@param {real} _count				Amount of buffs to apply, max 1 atm
function apply_random_elite_buff(_baddie, _count = 1) {
	var _buffs = [
		eliteBuffs.fast,
		eliteBuffs.tough,
		eliteBuffs.spawner,
		// eliteBuffs.shielding
	]
	
	_buffs = array_shuffle(_buffs)
	
	var _buff
	var _selectedBuffs = []
	
	for (var i = 0; i < _count; i++ ) {		
		switch (_buffs[i]) {
			case eliteBuffs.fast:
				_buff = create_instance(obj_elite_buff_fast)
			break
		
			case eliteBuffs.tough:
				_buff = create_instance(obj_elite_buff_tough)
			break
		
			case eliteBuffs.spawner:
				_buff = create_instance(obj_elite_buff_spawner)
			break
		
			case eliteBuffs.shielding:
				
			break
		}
	
		_buff.owner = _baddie
		_baddie.hpMax *= _buff.hpScalar
		_baddie.weight *= _buff.weightScalar
		_baddie.moveSpeedMax *= _buff.moveSpeedScalar
		_baddie.hp = _baddie.hpMax
	
		array_push(_selectedBuffs, _buff)
	}
	
	spawn_elite_minions(_baddie, _selectedBuffs)
	apply_elite_name(_baddie, _selectedBuffs)
}
