/// @description Init

event_inherited()

name = "Fire Mage"

apply_base_tier_stats(baddieTiers.large)

xp = 200
hpMax = 60
hp = hpMax

deathParticles = [
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_ribs_red,
	obj_ptb_skel_skull_red,
]

hpBarDisplay = entityHpBarTypes.small
walkAnimType = entityWalkAnimTypes.curves
shadowSprite = spr_shadow_xl
shadowOffset = -3

add_baddie_gold_brutal

move_wander_setup()

//baddie_teleport_enable(seconds_to_frames(6))
impactMaterial = enumImpactMaterials.flesh

fireCdMax = 320
fireCdCur = fireCdMax
fireCount = 4
fireObject = obj_enemy_fire_dagger
fireAngleOffset = irandom(1) * 45

fireWaveCountCur = 0
fireWaveCountMax = 4
fireWaveChargeCur = 0
fireWaveChargeMax = stf(2)
fireWaveChargeDrawOffset = new vec2(12, -11)
