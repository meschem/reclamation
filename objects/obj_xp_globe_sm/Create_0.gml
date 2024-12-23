event_inherited()

pickupValue = 10

lifeSpan = -1

shadowSprite = spr_shadow_med
shadowOffset = 6

init_floating(2, 90)

onPickup = function(_player) {
	obj_player.xp += baddie_xp_elite
	obj_player.xp += baddie_xp_elite
	obj_player.xp += baddie_xp_elite
	obj_player.xp += baddie_xp_elite
	obj_player.xp += baddie_xp_elite
	obj_player.xp += baddie_xp_elite
	obj_player.xp += baddie_xp_elite
	obj_player.xp += baddie_xp_elite
	obj_player.xp += baddie_xp_elite
	obj_player.xp += baddie_xp_elite
	check_for_level_up()
}