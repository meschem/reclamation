///@description								Marks a list of items against a list of recipes
///@param {array<struct>} _recipes			Recipes to check
///@param {array<Id.Instance>} _items		Items to check for marking
function mark_valid_ingredients(_recipes, _items) {
	with (obj_recipe_controller) {
		markValidIngredients(_recipes, _items)
	}
}

///@description								Clears ingredients for marking
///@param {array<Id.Instance>} _items		Items to check for marking
function unmark_ingredients(_items) {
	for (var i = 0; i < array_length(_items); i++) {
		try {
			_items[i].inValidRecipe = false
		} catch(err) {
			create_toaster("valid check recipe failed", errorLevels.error)
		}
	}
}
