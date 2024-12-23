
// Inherit the parent event
event_inherited()

name = "Greater Serpent"

moveSpeedMax = baddie_move_speed_medium
weight = baddie_weight_heavy

//walkAnimType = entityWalkAnimTypes.curves

bossScale = 1

shadowSprite = spr_shadow_naga
shadowOffset = -12

pushRadius = 30

//hpBarInfo.yOffset = -23
//hpBarDisplay = entityHpBarTypes.small

hpMax = baddie_hp_very_high
hp = hpMax

xp = baddie_xp_brutal

deathParticles = [
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
]

deathParticleSpawnRange.x = 12
deathParticleSpawnRange.y = 12

add_baddie_gold_tough
