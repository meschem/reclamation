/// @description Init

event_inherited();

name = "Zombie"

walkAnimType = entityWalkAnimTypes.curves

moveSpeedMax = baddie_move_speed_slow
xp = baddie_xp_fodder

hpMax = baddie_hp_high
hp = hpMax

impactMaterial = enumImpactMaterials.flesh

shadowSprite = spr_shadow_med
shadowOffset = -1

deathParticles = [
	obj_ptb_zombie_head_grn,
	obj_ptb_zombie_torso_grn,
	obj_ptb_zombie_limb_grn,
	obj_ptb_zombie_limb_grn,
	obj_ptb_zombie_limb_grn,
	obj_ptb_zombie_limb_grn,
]

onDestroy = function() {
    audio_play_sound(snd_hard_hit_splatter, 1, false, 0.5, 0, random_range(0.9, 1.1))
}

add_baddie_gold_fodder


