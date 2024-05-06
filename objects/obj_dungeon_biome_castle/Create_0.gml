// Inherit the parent event
event_inherited()

///@description										Creates a floor with multiple room configs
///@param {array<struct.roomConfig>} _roomConfigs	Type of room uses enum roomTypes
addFloorConfig = function(_roomConfigs) {
	var _floor = new floorConfig(_roomConfigs)
	
	array_push(floorStructure, _floor)
}

///@description										Creates a floor with multiple room configs
///@param {array<struct.roomConfig>} _roomConfigs	Type of room uses enum roomTypes
function floorConfig(_roomConfigs) constructor {
	roomConfigs = _roomConfigs
}

///@description								Template used to create a room during dungeon creation
///@param {array<real>} _roomTypes			Type of room uses enum roomTypes
///@param {array<real>} _roomRewards		Type of room uses enum roomTypes
function roomConfig(_roomTypes, _roomRewards) constructor {
	types = _roomTypes
	rewards = _roomRewards
}

// FLOORS //
// 1
addFloorConfig([
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
		[roomRewards.trinket]
	),
	new roomConfig(
		[roomTypes.elite],
		[roomRewards.gold]
	)
])

// 6
addFloorConfig([
	new roomConfig(
		[roomTypes.horde],
		[roomRewards.abilityLevel, roomRewards.weaponUpgrade]
	),
	new roomConfig(
		[roomTypes.heavy],
		[roomRewards.abilityLevel, roomRewards.weaponUpgrade]
	)
])

// 7
addFloorConfig([
	new roomConfig(
		[roomTypes.normal],
		[roomRewards.trinket]
	),
	new roomConfig(
		[roomTypes.brutal],
		[roomRewards.trinketRare]
	)
])

// 8
addFloorConfig([
	new roomConfig(
		[roomTypes.boss],
		[roomRewards.gold]
	)
])

// ROOMS //
addRoom(rm_combat_testing_b, roomSizes.small)
addRoom(rm_combat_testing_c, roomSizes.large)
addRoom(rm_combat_testing_d, roomSizes.tiny)
addRoom(rm_combat_testing_e, roomSizes.medium)
addRoom(rm_combat_testing_f, roomSizes.medium)

// BADDIES //
addBaddie(obj_skully_fly, baddieTiers.pest, 10, spawnTypes.horde)

addBaddie(obj_skeleton, baddieTiers.small)

addBaddieStruct({
	baddie: obj_slime_green,
	spawnTier: baddieTiers.small,
	spawnCountMultiplier: 0.5,
	difficultyMin: 2
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

addBaddie(obj_greater_serpent_green, baddieTiers.boss)
addBaddie(obj_lich, baddieTiers.boss)
