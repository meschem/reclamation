///@description							Spawns minions for a baddie
///@param {id.Instance} _baddie			Baddie to spawn them at
///@param {array<id.Instance>} _buffs	Buffs to reference
function spawn_elite_minions(_baddie, _buffs) {
	var _angle, _dist, _inst
	var _spawn = new vec2(0, 0)
	var baseHpBuff = 1
	
	for (var i = 0; i < _baddie.minionCount; i++) {
		_angle = (360 / _baddie.minionCount) * i
		_dist = irandom_range(20, 40)
		
		_spawn = get_vec2_from_angle_mag(_angle, _dist)
		_inst = spawn_baddie_at_location(
			_baddie.minionType,
			_baddie.x + _spawn.x,
			_baddie.y + _spawn.y
		)
		
		_inst.hpMax = baddie_hp_elite_minion * baseHpBuff
		//_inst.hpMax *= baseHpBuff
		
		for (var j = 0; j < array_length(_buffs); j++) {
			_inst.hpMax *= _buffs[j].hpScalar
			_inst.moveSpeedMax *= _buffs[j].moveSpeedScalar
			_inst.weight *= _buffs[j].weightScalar
		}
		
		_inst.hp = _inst.hpMax
	}
}
