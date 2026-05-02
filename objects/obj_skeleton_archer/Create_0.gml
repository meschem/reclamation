/// @description Init

event_inherited();

name = "Skeleton Archer"

shadowSprite = spr_shadow_lg
shadowOffset = -3

moveSpeedMax = baddie_move_speed_medium

walkAnimType = entityWalkAnimTypes.curves

xp = baddie_xp_tough
hpMax = baddie_hp_low
hp = hpMax
weight = baddie_weight_med
//hpBarDisplay = entityHpBarTypes.small

tellLineDraw = false
tellLineAngle = 0
tellLineOffsetX = 0
tellLineOffsetY = 0
tellLineFrame = 0
tellLineSprite = spr_dotted_line_tell

move_wander_setup()

attackCdCur = irandom(stf(3))
attackCdMax = stf(6) + irandom(stf(2.5))
attackChargeCur = 0
attackChargeMax = stf(0.75)

deathParticles = [
	obj_ptb_skel_bone_yel,
	obj_ptb_skel_bone_yel,
	obj_ptb_skel_bone_yel,
	obj_ptb_skel_ribs_yel,
    obj_ptb_skel_skull_yel
]

onDestroy = function() {
    audio_play_sound(snd_bone_rattle, 1, false, 0.5, 0, random_range(0.9, 1.1))
    audio_play_sound(snd_wood_smash, 1, false, 0.7, 0, random_range(0.9, 1.1))
}

add_baddie_gold_tough
