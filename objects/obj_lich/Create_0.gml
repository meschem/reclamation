/// @description Init

event_inherited();

name = "Frost Lich"
description = "Freezing Death"

xp = 250
hpMax = 1000
hp = hpMax
hpBarDisplay = entityHpBarTypes.small

moveAccel = 0.08
moveSpeedMax = 1
weight = 4
isBoss = true
//moveRotationRate = 4
bossScale = 1

shadowSprite = spr_shadow_lg

floatRange = 2

moveRotationRate = 1
flies = true

deathParticles = [
	obj_ptb_lich_crown,
	obj_ptb_lich_shield,
	obj_ptb_lich_scepter_a,
	obj_ptb_lich_scepter_b,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_bone_blue,
	obj_ptb_skel_skull_blue,
	obj_ptb_skel_ribs_blue
	
]

deathParticleSpawnRange.x = 15
deathParticleSpawnRange.y = 26

iceBlastSwarmCdMax = 240
iceBlastSwarmCd = iceBlastSwarmCdMax

iceBlastSwarmFiringCdMax = 60
iceBlastSwarmFiringCd = 0
iceBlastSwarmFireRate = 5

//create_boss_health_bar(id)