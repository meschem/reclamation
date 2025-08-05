/// @description Insert description here
// You can write your code in this editor

recipes = [
	new recipe(
		obj_mg_ebony_pendant,
		"Ebony Pendant",
		spr_icon_aegis_pendant,
		[
			obj_mg_unformed_mass,
			obj_mg_unformed_mass,
			obj_mg_opaque_hourglass
		]
	),

	new recipe(
		obj_mg_glass_feather,
		"Glass Feather",
		spr_icon_glass_feather,
		[
			obj_mg_unformed_mass,
			obj_mg_opaque_hourglass
		]
	),
	
	new recipe(
		obj_mg_pinion_of_war,
		"Pinion of War",
		spr_icon_pinion_of_war,
		[
			obj_mg_glass_feather,
			obj_mg_glass_feather,
			obj_mg_glass_feather
		]
	)
]

invalidRecipe = new recipe(
	obj_none,
	"No Recipe Found",
	spr_icon_invalid_recipe,
	[]
)

///@description									A recipe combined to make a new item
///@param {asset.GMObject} _result				Resultant Item
///@param {string} _name						Name of result
///@param {asset.GMSprite} _icon				Sprite to show for result
///@param {array<asset.GMObject>} _ingredients	Ingredients to the recipe
function recipe(_result, _name, _icon, _ingredients) constructor {
	result = _result
	name = _name
	icon = _icon
	
	ingredients = _ingredients
	array_sort(ingredients, true)
}

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