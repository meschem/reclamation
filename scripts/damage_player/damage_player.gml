/// @description				Returns true if killed
/// @param {Id.Instance}		hitBy
/// @param {real}				damage

function damage_player(hitBy, damage = -1, _player = noone) {
	if (_player == noone) {
		_player = instance_find(obj_player, 0)
	}
	
	if (player_is_invuln(_player)) {
		//activate_player_on_hit_abilities()
		return false
	}
	
	if (damage == -1) {
		damage = hitBy.damageOnHit
	}
	
	if (player_is_shielded(_player)) {
		damage_player_shield(damage, _player)
		return false
	}
	
	var i, inst
	
	obj_player.hp -= damage
	obj_player.lastHitOn = obj_player.age
	
	activate_player_on_hit_abilities(_player, hitBy)
	
	inst = instance_create_depth(x, y - 4, depths.ui, obj_moving_text)
	
	inst.displayText = "-" + string(hitBy.damageOnHit)
	inst.fontColor = c_red
	
	if (obj_player.hp <= 0)
		return true
		
	return false
}