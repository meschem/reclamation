
// Inherit the parent event
event_inherited()

name = "Greater Serpent"
description = "Massive, Venomous"

moveSpeedMax = baddie_move_speed_medium
weight = baddie_weight_massive

walkAnimType = entityWalkAnimTypes.curves

bossScale = 1
isBoss = true

shadowSprite = spr_greater_serpent_shadow
shadowOffset = -30

hpBarInfo.yOffset = -23
hpBarDisplay = entityHpBarTypes.small

hpMax = 1000
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

add_loot_gold(500, 600, 1)
