///@description   Description
function define_room_types() {
	enum spawnTypes {
		pest,
		small,
		medium,
		large,
		veryLarge,
		elite,
		boss
	}
	
	roomTypeList = ds_list_create()
	
	
	var _roomTypeIntro = new roomType(
		[
			roomSizes.small
		],
		{
			base: _spawns.small
		}
	)
	
	var _roomTypeNormal = new roomType(
		[
			roomSizes.medium,
			roomSizes.large
		],
		{
			base: _spawns.small,
			tough: _spawns.medium,
		}
	)
	
	var _roomTypeHorde = new roomType(
		[
			roomSizes.large,
			roomSizes.veryLarge,
			roomSizes.massive
		],
		{
			base: _spawns.pest,
			tough: _spawns.medium,
		}
	)
	
	var _roomTypeHeavy = new roomType(
		[
			roomSizes.medium,
			roomSizes.large
		],
		{
			base: _spawns.medium,
			tough: _spawns.large
		}
	)
	
	var _roomTypeBrutal = new roomType(
		[
			roomSizes.medium,
			roomSizes.large,
			roomSizes.veryLarge,
		],
		{
			base: _spawns.small,
			tough: _spawns.medium,
			brutal: _spawns.veryLarge,
		}
	)
	
	var _roomTypeElite = new roomType(
		[
			roomSizes.medium,
			roomSizes.large,
			roomSizes.veryLarge,
		],
		{
			base: _spawns.small,
			tough: _spawns.medium,
			elite: _spawns.large,
		}
	)
	
	var _roomTypeBoss = new roomType(
		[
			roomSizes.large,
			roomSizes.veryLarge,
		],
		{
			base: _spawns.small,
			tough: _spawns.medium,
			boss: _spawns.boss,
		}
	)
	
	var _roomTypeShop = new roomType(
		[
			roomSizes.shop
		],
		{}
	)
}

function roomType(_sizes, _spawns) constructor {
	sizes = _sizes
	spawns = _spawns
}
