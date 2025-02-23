/// @description Init

event_inherited();

name = "Skeleton King"

walkAnimType = entityWalkAnimTypes.curves

moveSpeedMax = baddie_move_speed_medium
xp = baddie_xp_boss

hpMax = 1500 // baddie_hp_boss
hp = hpMax

create_boss_health_bar(id)

shadowSprite = spr_shadow_xxl
shadowOffset = -9

outlineColor = get_color(colors.red)

image_index = floor(random(sprite_get_number(sprite_index)))

deathParticles = [
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_ribs_purp,
	obj_ptb_skel_skull_purp,
	obj_ptb_skull_crown
]

