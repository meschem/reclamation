///@description							Gets the full list of valid recipes for the game
///@return {array<struct>}
function get_recipe_list() {
	var _recipes = [
		new recipe(
			obj_mg_ebony_pendant,
			"Ebony Pendant",
			spr_icon_aegis_pendant,
			[
				obj_mg_imp_skull,
				obj_mg_beast_blood,
				obj_mg_war_bracer
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
				obj_mg_imp_skull,
				obj_mg_opaque_hourglass,
				obj_mg_glass_feather
			]
		),
		
		new recipe(
			obj_mg_goldleaf,
			"Goldleaf",
			spr_icon_goldleaf,
			[
				obj_mg_venomleaf,
				obj_mg_goldleaf
			]
		),
	
		new recipe(
			obj_mg_unstable_mass,
			"Unstable Mass",
			spr_icon_unstable_mass,
			[
				obj_mg_unformed_mass,
				obj_mg_beast_blood
			]
		),

		new recipe(
			obj_mg_infernal_gauntlets,
			"Infernal Gauntlets",
			spr_icon_infernal_gauntlets,
			[
				obj_mg_imp_skull,
				obj_mg_war_bracer
			]
		),

		new recipe(
			obj_mg_greathawk_talon,
			"Great-hawk Talon",
			spr_icon_wicked_talon,
			[
				obj_mg_greathawk_talon,
				obj_mg_greathawk_talon
			]
		),

		new recipe(
			obj_mg_black_ichor,
			"Black Ichor",
			spr_icon_black_ichor_mg,
			[
				obj_mg_unformed_mass,
				obj_mg_unformed_mass
			]
		),

		//new recipe(
		//	obj_mg_timepiece,
		//	"Timepiece",
		//	spr_icon_timepiece,
		//	[
		//		obj_mg_opaque_hourglass,
		//		obj_mg_opaque_hourglass
		//	]
		//),

		new recipe(
			obj_mg_iron_cuirass,
			"Iron Cuirass",
			spr_icon_iron_cuirass,
			[
				obj_mg_ironsilk,
				obj_mg_war_bracer,
				obj_mg_leather_doublet
			]
		),

		new recipe(
			obj_mg_aetherblight,
			"Aetherblight",
			spr_icon_acid_vial,
			[
				obj_mg_venomleaf,
				obj_mg_beast_blood
			]
		),

		new recipe(
			obj_mg_frost_walkers,
			"Frost Walkers",
			spr_icon_frost_walkers,
			[
				obj_mg_ice_salt,
				obj_mg_ice_salt,
				obj_mg_simple_boots
			]
		),
		
		new recipe(
			obj_mg_crown_of_destruction,
			"Meizer's Crown",
			spr_icon_crown_of_destruction,
			[
				obj_mg_evercandle,
				obj_mg_evercandle,
				obj_mg_ebony_pendant
			]
		)
	]
	
	return _recipes
}

