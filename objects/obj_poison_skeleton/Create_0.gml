/// @description Init

event_inherited();

hpMax = 25
hp = hpMax

shadowSprite = spr_shadow_med
shadowOffset = -1

onDestroy = function() {
	instance_create_depth(x, y, depths.enemyFloorFx, obj_poison_pit)
}
