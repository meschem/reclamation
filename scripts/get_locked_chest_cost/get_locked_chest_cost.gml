// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_locked_chest_cost(_size = lockedChestSizes.small) {
	enum lockedChestSizes {
		small,
		medium,
		large
	}
	
	var _count = obj_run_controller.lockedChestsOpened
	
	switch (_size) {
		case lockedChestSizes.small:
			return 25 + (_count * 25)
		
		case lockedChestSizes.medium:
			return 50 + (_count * 50)
		
		case lockedChestSizes.large:
			return 75 + (_count * 75)
	}
	
	return 0
}