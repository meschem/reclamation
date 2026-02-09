/// @description Init

event_inherited()

name = "Toxic Dead"

hpMax = 25
hp = hpMax

shadowSprite = spr_shadow_med
shadowOffset = -1

onDestroy = function() {
	instance_create_depth(x, y, depths.enemyFloorFx, obj_poison_pit)
}

add_baddie_gold_fodder
