/// @description Init

event_inherited();

name = "Grub"

shadowSprite = spr_shadow_xl_wide
shadowOffset = -1

moveSpeedMax = baddie_move_speed_very_slow

xp = baddie_xp_tough
hpMax = 200
hp = hpMax
weight = baddie_weight_heavy
//hpBarDisplay = entityHpBarTypes.small

add_baddie_gold_tough

beginStep = function() {
	if (instance_exists(target)) {
		image_xscale = sign(target.x - x)
	}
}
