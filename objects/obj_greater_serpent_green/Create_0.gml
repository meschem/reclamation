
// Inherit the parent event
event_inherited()

name = "Greater Serpent"

moveSpeedMax = baddie_move_speed_medium
weight = baddie_weight_massive

walkAnimType = entityWalkAnimTypes.curves

bossScale = 1

shadowSprite = spr_greater_serpent_shadow
shadowOffset = -30

hpBarInfo.yOffset = -23
hpBarDisplay = entityHpBarTypes.small

hpMax = 220
hp = hpMax

deathParticles = [
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_chunk_grn,
	obj_ptb_serpent_skull
]

deathParticleSpawnRange.x = 20
deathParticleSpawnRange.y = 20

add_baddie_gold_brutal
