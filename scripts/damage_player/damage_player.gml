/// @description    Returns true if killed

/// @param {Id.Instance}		hitBy
/// @param {real}				damage

function damage_player(hitBy, damage = -1) {
	var i, inst, proj

	if (damage == -1) {
		obj_player.hp -= hitBy.damageOnHit
	} else {
		obj_player.hp -= damage
	}
	
	obj_player.lastHitOn = age
	
	activate_player_on_hit_abilities()
	
	inst = instance_create_depth(x, y - 4, depths.ui, obj_moving_text)
	
	inst.displayText = "-" + string(hitBy.damageOnHit)
	inst.fontColor = c_red
	
	if (obj_player.hp <= 0)
		return true
		
	return false
}