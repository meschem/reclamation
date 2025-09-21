/// @description Insert description here
// You can write your code in this editor

recipes = get_recipe_list()

invalidRecipe = new recipe(
	obj_none,
	"No Recipe Found",
	spr_icon_invalid_recipe,
	[]
)

///@description									Checks if a combo is a recipe
///@param {array<asset.GMObject>} _items		Items (instances) to check
///@return {struct}								Returns standard invalid recipe if none are found
checkItems = function(_items) {
	var _recipe = obj_none
	array_sort(_items, true)
	
	for (var i = 0; i < array_length(recipes); i++) {
		if (array_equals(_items, recipes[i].ingredients)) {
			return recipes[i]
		}
	}
	
	return invalidRecipe
}

enum comboCheckTypes {
	none,
	partial,
	full
}

///@description									Checks if a combo is a recipe or part of a recipe
///@param {id.Instance} _itemA					First item
///@param {id.Instance} _itemB					Second item
checkItemsWithPartial = function(_itemA, _itemB) {
	var _partialMatch = false
	var _fullMatch = false
	
	for (var i = 0; i < array_length(recipes); i++) {
		for (var j = 0; j < array_length(ingredients); j++) {
			
		}
	}
}

///@description									Goes through all items to see if they have a valid merge recipe
///												May not be performant atm
///												This updates items directly rather than returning anything
///@param {array<asset.Id.Instance>} _items		Items (instances) to check
markItemsForMergeAvailable = function(_items) {
	//for (var i = 0; i < array_length(_items); i++) {
	//	var _mergeAvailable = false

	//	for (var j = 0; j < array_length(_items); i++) {
	//		if (_items[i] == _items[j]) {
	//			continue
	//		}
			
			
	//	}
	//}
	
	
}

///@description									Gets a list of all recipes that can be made with the available items
///@param {array<asset.Id.Instance>} _items		Items (instances) to check
///@return {array<struct>}
getValidRecipes = function(_items) {
	var _ingredientCounts = {}
	var _objectName = ""
	var _curVal = 0
	
	for (var i = 0; i < array_length(_items); i++) {
		_objectName = object_get_name(_items[i].object_index)
		
		if (variable_struct_exists(_ingredientCounts, _objectName)) {
			_curVal = variable_struct_get(_ingredientCounts, _objectName)
			variable_struct_set(_ingredientCounts, _objectName, _curVal + 1)
		} else {
			variable_struct_set(_ingredientCounts, _objectName, 1)
		}
	}
	
	var _availableRecipes = []
	var _requiredCount = 0
	var _availableCount = 0
	var _available = true
	var _ingredient = ""
	
	for (var i = 0; i < array_length(recipes); i++) {
		_available = true
		
		// does multiple checks if ingredients are duped...
		for (var j = 0; j < array_length(recipes[i].ingredients); j++) {
			_ingredient = object_get_name(recipes[i].ingredients[j])
			
			_requiredCount = getCountForItem(recipes[i].ingredients, recipes[i].ingredients[j])
			_availableCount = getItemCountFromStruct(_ingredient, _ingredientCounts)

			
			if (_availableCount < _requiredCount) {
				_available = false
				break
			}
		}
	
		if (_available) {
			array_push(_availableRecipes, recipes[i])
		}
	}
	
	return _availableRecipes
}

///@description									Goes through all the ingredients in a list, finds those items, and marks them as found in valid recipes
///@param {array<struct>} _recipes				Recipes to check
///@param {array<Id.Instance>} _items			Items to check for marking
markValidIngredients = function(_recipes, _items) {
	var _names = []
	
	for (var i = 0; i < array_length(_recipes); i++) {
		for (var j = 0; j < array_length(_recipes[i].ingredients); j++) {
			if (!array_contains(_names, object_get_name(_recipes[i].ingredients[j]))) {
				array_push(_names, object_get_name(_recipes[i].ingredients[j]))
			}
		}
	}

	for (var i = 0; i < array_length(_items); i++) {
		if (array_contains(_names, object_get_name(_items[i].object_index))) {
			_items[i].inValidRecipe = true
		}
	}
}

///@description									Gets count of a specified item type from a k/v struct
///@param {string} _itemName					Item name to check
///@param {struct} _struct						Struct to check that has k/v pairs for name/count
///@return {real}
getItemCountFromStruct = function(_itemName, _struct) {
	if (!variable_struct_exists(_struct, _itemName)) {
		return 0
	}
	
	return variable_struct_get(_struct, _itemName)
}


///@description									Checks how many of a particular item are needed in a recipe
///@param {asset.GMObject} _ingredientList		List of ingredients
///@param {asset.GMObject} _item				Item to check
///@return {bool}
getCountForItem = function(_ingredientList, _item) {
	var _count = 0
	
	for (var i = 0; i < array_length(_ingredientList); i++) {
		if (_ingredientList[i] == _item) {
			_count++
		}
	}
	
	return _count
}
