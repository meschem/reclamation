// Inherit the parent event
event_inherited()

addRoom(rm_combat_testing_b, roomSizes.small)
addRoom(rm_combat_testing_c, roomSizes.large)
addRoom(rm_combat_testing_d, roomSizes.tiny)
addRoom(rm_combat_testing_e, roomSizes.medium)
addRoom(rm_combat_testing_f, roomSizes.medium)

addBaddie(obj_skully_fly, baddieTiers.pest, 10, spawnTypes.horde)

addBaddie(obj_skeleton, baddieTiers.small)

addBaddieStruct({
	baddie: obj_slime_green,
	spawnTier: baddieTiers.small,
	props: {
		difficultyMin: 2
	}	
})

addBaddieStruct({
	baddie: obj_skeleton_warrior,
	spawnTier: baddieTiers.medium,
	props: {
		difficultyMin: 2
	}
})

addBaddieStruct({
	baddie: obj_wraith,
	spawnTier: baddieTiers.medium,
	props: {
		difficultyMin: 2
	}
})

addBaddieStruct({
	baddie: obj_necromancer,
	spawnTier: baddieTiers.large,
	props: {
		difficultyMin: 2
	}
})

addBaddieStruct({
	baddie: obj_banshee,
	spawnTier: baddieTiers.very_large,
	props: {
		difficultyMin: 2
	}
})

addBaddie(obj_greater_serpent_green, baddieTiers.boss)
addBaddie(obj_lich, baddieTiers.boss)
