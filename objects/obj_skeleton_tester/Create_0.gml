/// @description Init

event_inherited();

moveBehavior = entityMoveBehaviors.none

hpMax = 1000
hp = hpMax

shadowSprite = spr_shadow_med
shadowOffset = -1

//beginStep = function() {
//	if (age % 60 = 0) {
//		for (var i = 0; i < 4; i++) {
//			var _inst = instance_create_depth(x, y, depths.enemyProjectile, obj_enemy_blue_shot)
//			var _angle = i * 90
			
//			_inst.xVel = angle_xvel(_angle) * 0.5
//			_inst.yVel = angle_yvel(_angle) * 0.5
//			_inst.owner = id
//			_inst.parent = id
//		}
//	}
//}
