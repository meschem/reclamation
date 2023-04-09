///@description   Description
function activate_razor() {
	var level = 1
	var target = obj_player
	var inst
	
	inst = instance_create_depth(target.x, target.y, depths.playerProjectile, obj_razor)
	
	inst.angleOffset = 0
	inst.level = level
	
	inst = instance_create_depth(target.x, target.y, depths.playerProjectile, obj_razor)
	
	inst.angleOffset = 180
	inst.level = level
}