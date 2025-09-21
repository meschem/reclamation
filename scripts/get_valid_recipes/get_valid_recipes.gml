///@description								Gets a list of valid recipes for the item list
///@param {array<Id.Instance>} _items		List of items to check
///@return {array<struct>}
function get_valid_recipes(_items) {
	return obj_recipe_controller.getValidRecipes(_items)
}
