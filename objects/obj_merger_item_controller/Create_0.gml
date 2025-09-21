
itemDb = [

	// common

	new mergerItemTemplate(
		"Unformed Mass",
		"Brimming with unrealized potential.",
		obj_mg_unformed_mass,
		spr_icon_black_ichor
	),
	new mergerItemTemplate(
		"Opaque Hourglass",
		"BSparks curiosity, but not so useful for telling time.",
		obj_mg_opaque_hourglass,
		spr_icon_opaque_hourglass
	),

	new mergerItemTemplate(
		"Venomleaf",
		"Dangerous to consume, but far more to harvest.",
		obj_mg_venomleaf,
		spr_icon_venomleaf
	),
	new mergerItemTemplate(
		"Great-hawk Claw",
		"Capable of rending iron armor with a powerful enough blow.",
		obj_mg_greathawk_claw,
		spr_icon_demon_claw
	),
	new mergerItemTemplate(
		"War Bracer",
		"Minor protection, but major confidence.",
		obj_mg_war_bracer,
		spr_icon_war_bracer
	),
	new mergerItemTemplate(
		"Simple Boots",
		"Humble boots for quick-footed warriors.",
		obj_mg_simple_boots,
		spr_icon_simple_boots
	),
	new mergerItemTemplate(
		"Imp Skull",
		"Remnants of demonic energy remain encased.",
		obj_mg_imp_skull,
		spr_icon_poison_stacks
	),
	new mergerItemTemplate(
		"Beast Blood",
		"A boiled-down mixture from carefully selected prey.",
		obj_mg_beast_blood,
		spr_icon_beast_blood
	),
	new mergerItemTemplate(
		"Ironsilk",
		"Pliable and strong.",
		obj_mg_ironsilk,
		spr_icon_ironsilk
	),
	new mergerItemTemplate(
		"Leather Doublet",
		"Protection against glancing blows, but little more.",
		obj_mg_leather_doublet,
		spr_icon_leather_armor
	),
	new mergerItemTemplate(
		"Ice Salt",
		"Frozen to the touch.",
		obj_mg_ice_salt,
		spr_icon_ice_salt
	),
	
	// uncommon
	
	new mergerItemTemplate(
		"Unstable Mass",
		"Violatile and ready to burst.",
		obj_mg_unstable_mass,
		spr_icon_unstable_mass,
		enumRarity.magic
	),
	new mergerItemTemplate(
		"Glass Feather",
		"Fused with magic that can be uniquely bound to glass.",
		obj_mg_glass_feather,
		spr_icon_glass_feather,
		enumRarity.magic
	),
	new mergerItemTemplate(
		"Infernal Gauntlets",
		"Exact out burning rage upon your enemies.",
		obj_mg_infernal_gauntlets,
		spr_icon_infernal_gauntlets,
		enumRarity.magic
	),
	new mergerItemTemplate(
		"Greathawk Talons",
		"Capable of rending iron armor with a powerful enough blow.",
		obj_mg_greathawk_claw,
		spr_icon_wicked_talon,
		enumRarity.magic
	),
	new mergerItemTemplate(
		"Black Ichor",
		"A thick, deeply dark substance.",
		obj_mg_black_ichor,
		spr_icon_black_ichor,
		enumRarity.magic
	),
	new mergerItemTemplate(
		"Timepiece",
		"A marvel of both engineering and magic.",
		obj_mg_timepiece,
		spr_icon_timepiece,
		enumRarity.magic
	),
	new mergerItemTemplate(
		"Aetherblight",
		"A boiled-down mixture from carefully selected prey.",
		obj_mg_aetherblight,
		spr_icon_acid_vial,
		enumRarity.magic
	),
	
	// rare
	
	new mergerItemTemplate(
		"Ebony Pendant",
		"Emanates with a powerful, life-giving energy",
		obj_mg_ebony_pendant,
		spr_icon_aegis_pendant,
		enumRarity.rare
	),
	new mergerItemTemplate(
		"Frost Walkers",
		"Emanates with a powerful, life-giving energy",
		obj_mg_frost_walkers,
		spr_icon_frost_walkers,
		enumRarity.rare
	),
	
	// legendary
	
	new mergerItemTemplate(
		"Pinion of War",
		"A feather brimming with power, touched by the burning heavens above.",
		obj_mg_pinion_of_war,
		spr_icon_pinion_of_war,
		enumRarity.legendary
	)
]

///@description							Creates an item of a specified rarity or rarities
///@param {id.Instance} _player			Player to create item for, if anyone
///@param {real|array<real>} _rarity	Specific rarity or list of valid rarities	
///@return {id.Instance}
createItem = function(_player = noone, _rarity = [enumRarity.normal]) {
	var _shuffled = array_shuffle(itemDb)
	
	if (!is_array(_rarity)) {
		_rarity = [_rarity]
	}
	
	for (var i = 0; i < array_length(_shuffled); i++) {
		if (array_contains(_rarity, _shuffled[i].rarity)) {
			return _shuffled[i].create(_player)			
		}
	}
	
	show_message("No item of rarity found")
	
	return noone
}
