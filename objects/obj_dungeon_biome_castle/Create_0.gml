// Inherit the parent event
event_inherited()

// FLOORS //
// 1
addFloorConfig([
	//new roomConfig(
	//	[roomTypes.shop],
	//	[roomRewards.none]
	//)dw
	new roomConfig(
		[roomTypes.intro],
		[roomRewards.trinket]
	)
])

// 2
addFloorConfig([
	new roomConfig(
		[roomTypes.normal],
		[roomRewards.trinket]
	),
	new roomConfig(
		[roomTypes.normal],
		[roomRewards.gold]
	)
])

// 3
addFloorConfig([
	new roomConfig(
		[roomTypes.normal],
		[roomRewards.trinket]
	),
	new roomConfig(
		[roomTypes.normal, roomTypes.horde],
		[roomRewards.abilityLevel, roomRewards.weaponUpgrade]
	),
	new roomConfig(
		[roomTypes.brutal],
		[roomRewards.trinketRare]
	)
])

// 4
addFloorConfig([
	new roomConfig(
		[roomTypes.shop],
		[roomRewards.none]
	)
])

// 5
addFloorConfig([
	new roomConfig(
		[roomTypes.elite],
		[roomRewards.trinket],
		2
	),
	new roomConfig(
		[roomTypes.elite],
		[roomRewards.gold],
		2
	)
])

// 6
addFloorConfig([
	new roomConfig(
		[roomTypes.horde],
		[roomRewards.abilityLevel, roomRewards.weaponUpgrade],
		2
	),
	new roomConfig(
		[roomTypes.heavy],
		[roomRewards.abilityLevel, roomRewards.weaponUpgrade],
		2
	)
])

// 7
addFloorConfig([
	new roomConfig(
		[roomTypes.normal],
		[roomRewards.trinket],
		2
	),
	new roomConfig(
		[roomTypes.brutal],
		[roomRewards.trinketRare],
		2
	)
])

// 8
addFloorConfig([
	new roomConfig(
		[roomTypes.boss],
		[roomRewards.gold],
		2
	)
])

// ROOMS //
addRoom(rm_combat_testing_b, roomSizes.small)
addRoom(rm_combat_testing_c, roomSizes.large)
addRoom(rm_combat_testing_d, roomSizes.tiny)
addRoom(rm_combat_testing_e, roomSizes.medium)
addRoom(rm_combat_testing_f, roomSizes.medium)
addRoom(rm_shop_testing, roomSizes.shop)

// BADDIES //
//addBaddie(obj_skully_fly, baddieTiers.pest, 10, spawnerTypes.horde)
addBaddie(obj_skeleton, baddieTiers.small)

//addBaddieStruct({
//	baddie: obj_devil,
//	spawnTier: baddieTiers.small,
//	spawnType: spawnerTypes.flybyCharge,
//	difficultyMin: 2
//})

addBaddieStruct({
	baddie: obj_skully_fly,
	spawnTier: baddieTiers.pest,
	spawnCountMultiplier: 1,
	spawnType: spawnerTypes.horde
})

addBaddieStruct({
	baddie: obj_slime_green,
	spawnTier: baddieTiers.small,
	spawnCountMultiplier: 0.5,
	difficultyMin: 5
})

addBaddieStruct({
	baddie: obj_abaddon,
	spawnTier: baddieTiers.medium,
	spawnCountMultiplier: 3,
	spawnType: spawnerTypes.flybyChargeCluster,
	difficultyMin: 3
})

addBaddieStruct({
	baddie: obj_zombie,
	spawnTier: baddieTiers.small,
	spawnCountMultiplier: 0.75,
	difficultyMin: 3
})

addBaddieStruct({
	baddie: obj_skeleton_warrior,
	spawnTier: baddieTiers.medium,
	difficultyMin: 2
})

addBaddieStruct({
	baddie: obj_wraith,
	spawnTier: baddieTiers.medium,
	spawnCountMultiplier: 0.5,
	difficultyMin: 3
})

addBaddieStruct({
	baddie: obj_necromancer,
	spawnTier: baddieTiers.large,
	difficultyMin: 2
})

addBaddieStruct({
	baddie: obj_banshee,
	spawnTier: baddieTiers.veryLarge,
	difficultyMin: 2
})

addBaddieStruct({
	baddie: obj_greater_serpent_green,
	spawnTier: baddieTiers.veryLarge,
	difficultyMin: 5
})

//addBaddie(obj_greater_serpent_green, baddieTiers.boss)
addBaddie(obj_lich, baddieTiers.boss)

addElites([
	new eliteListMember(
		obj_skeleton_warrior,
		1, 10
	),
	new eliteListMember(
		obj_wraith,
		1, 10
	),
	new eliteListMember(
		obj_zombie,
		1, 10
	),
	new eliteListMember(
		obj_burning_skeleton,
		1, 10
	),
	//new eliteListMember(
	//	obj_fire_mage,
	//	1, 10
	//),
	new eliteListMember(
		obj_poison_skeleton,
		1, 10
	)
])
