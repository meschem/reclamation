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

add_baddie_gold_tough

move_wander_setup()

//baddie_teleport_enable(seconds_to_frames(6))
impactMaterial = enumImpactMaterials.flesh

primaryProjectile = obj_enemy_storm_dagger
primaryCdMax = 320
primaryCdCur = primaryCdMax
primaryCount = 4
primaryObject = obj_enemy_red_shot
primaryAngleOffset = 0

explosiveOrbCountCur = 0
explosiveOrbCountMax = 1
explosiveOrbChargeCur = 0
explosiveOrbChargeMax = stf(2)
explosiveOrbObject = obj_enemy_lightning_bomb

orbOffset = new vec2(10, -10)
