///@description									Checks if a combo is a recipe
///@param {array<id.Instance>} _items			Items (instances) to check
///@return {struct<recipe>}						Returns obj_none if invalid
function check_recipe(_items) {
	var _recipe
	
	with (obj_recipe_controller) {
		_recipe = checkItems(_items)
	}
	
	return _recipe
}
