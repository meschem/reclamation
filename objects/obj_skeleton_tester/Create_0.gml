/// @description Init

event_inherited();

moveBehavior = entityMoveBehaviors.none

hpMax = 1000
hp = hpMax

shadowSprite = spr_shadow_med
shadowOffset = -1

for (var i = 0; i < 4; i++) {
	var _inst = instance_create_depth(x, y, depths.enemyProjectile, obj_enemy_laser_naga)
	
	_inst.image_angle = 90 * i
}

//beginStep = function() {
//	if (age % 60 = 0) {
//		var _inst = instance_create_depth(-99, -99, depths.enemyProjectile, obj_enemy_orbital_ice_shot)
		
//		_inst.parent = id
//	}
//}