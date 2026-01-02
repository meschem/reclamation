
itemDb = [

	// common

	new mergerItemTemplate(
		"Imp Skull",
		"Remnants of demonic energy remain encased.",
		obj_mg_imp_skull,
		spr_icon_imp_skull
	),
	new mergerItemTemplate(
		"Beast Blood",
		"A boiled-down mixture from carefully selected prey.",
		obj_mg_beast_blood,
		spr_icon_beast_blood
	),
	new mergerItemTemplate(
		"Unformed Mass",
		"Brimming with unrealized potential.",
		obj_mg_unformed_mass,
		spr_icon_black_ichor
	),
	new mergerItemTemplate(
		"Opaque Hourglass",
		"Sparks curiosity. Not so useful for telling time.",
		obj_mg_opaque_hourglass,
		spr_icon_opaque_hourglass
	),
	new mergerItemTemplate(
		"Venomleaf",
		"Dangerous to consume but far more to harvest.",
		obj_mg_venomleaf,
		spr_icon_venomleaf
	),
	new mergerItemTemplate(
		"Ironsilk",
		"Pliable and strong.",
		obj_mg_ironsilk,
		spr_icon_ironsilk
	),
	new mergerItemTemplate(
		"Great-hawk Claw",
		"Capable of rending iron armor with a powerful enough blow.",
		obj_mg_greathawk_claw,
		spr_icon_twisted_horn
	),
	new mergerItemTemplate(
		"War Bracer",
		"Minor protection with major confidence.",
		obj_mg_war_bracer,
		spr_icon_war_bracer
	),
	new mergerItemTemplate(
		"Ice Salt",
		"Frozen to the touch.",
		obj_mg_ice_salt,
		spr_icon_ice_salt
	),
	new mergerItemTemplate(
		"Goldbrew",
		"A strange mix from exotic, purely organic ingredients that can convert materials into gold.",
		obj_mg_goldbrew,
		spr_icon_goldbrew,
	),
	new mergerItemTemplate(
		"Evercandle",
		"Burns longer than you expect, unless you believe the name",
		obj_mg_evercandle,
		spr_icon_evercandle,
	),
	new mergerItemTemplate(
		"Fire Salt",
		"A flaky salt that exhudes an intense heat under the right conditions.",
		obj_mg_fire_salt,
		spr_icon_fire_salt,
	),

    new mergerItemTemplate(
		"Goldleaf",
		"An investment to say the leaf. Oof.",
		obj_mg_goldleaf,
		spr_icon_goldleaf,
		
	),
	
	// uncommon
	
	//new mergerItemTemplate(
		//"Leather Doublet",
		//"Protection against glancing blows.",
		//obj_mg_leather_doublet,
		//spr_icon_leather_armor,
		//enumRarity.magic
	//),
	//new mergerItemTemplate(
		//"Glass Feather",
		//"Fused with magic that can be uniquely bound to glass.",
		//obj_mg_glass_feather,
		//spr_icon_glass_feather,
		//enumRarity.magic
	//),
	//new mergerItemTemplate(
		//"Black Ichor",
		//"A thick, deeply dark substance.",
		//obj_mg_black_ichor,
		//spr_icon_black_ichor,
		//enumRarity.magic
	//),
	//new mergerItemTemplate(
		//"Timepiece",
		//"A marvel of both engineering and magic.",
		//obj_mg_timepiece,
		//spr_icon_timepiece,
		//enumRarity.magic
	//),
	//new mergerItemTemplate(
		//"Aetherblight",
		//"A boiled-down mixture from carefully selected prey.",
		//obj_mg_aetherblight,
		//spr_icon_acid_vial,
		//enumRarity.magic
	//),
	//new mergerItemTemplate(
		//"Ironclaw",
		//"Alchemical fusion of beast and iron.",
		//obj_mg_iron_claw,
		//spr_icon_iron_claw,
		//enumRarity.magic
	//),
	//new mergerItemTemplate(
		//"Power Amulet",
		//"Emanates powerful energies",
		//obj_mg_ebony_pendant,
		//spr_icon_aegis_pendant,
		//enumRarity.magic
	//),
    new mergerItemTemplate(
		"Simple Boots",
		"Humble boots for quick-footed warriors.",
		obj_mg_simple_boots,
		spr_icon_simple_boots,
        enumRarity.magic
	),
	new mergerItemTemplate(
		"Petrified Heart",
		"The preserved heart of a great beast, still clinging to life.",
		obj_mg_petrified_heart,
		spr_icon_petrified_heart,
		enumRarity.magic
	),

		new mergerItemTemplate(
		"Puzzlebox",
		"Highly reactive to valuables.",
		obj_mg_golden_puzzlebox,
		spr_icon_golden_puzzlebox,
		enumRarity.magic
	),
	
	// rare
	
	new mergerItemTemplate(
		"Unstable Mass",
		"Violatile and ready to burst.",
		obj_mg_unstable_mass,
		spr_icon_unstable_mass,
		enumRarity.rare
	),
	new mergerItemTemplate(
		"Infernal Gauntlets",
		"Exact out burning rage upon your enemies.",
		obj_mg_infernal_gauntlets,
		spr_icon_infernal_gauntlets,
		enumRarity.rare
	), 
    //new mergerItemTemplate(
		//"Frost Walkers",
		//"Slows down units that get close with a chilling aura.",
		//obj_mg_frost_walkers,
		//spr_icon_frost_walkers,
		//enumRarity.rare
	//),

	
	// legendary
	
	new mergerItemTemplate(
		"Pinion of War",
		"A feather brimming with power, touched by the burning heavens above.",
		obj_mg_pinion_of_war,
		spr_icon_pinion_of_war,
		enumRarity.legendary
	),
]

///@description							Creates a specific type of item from the itemDb
///@param {id.Instance} _player			Player to create item for, if anyone
///@param {asset.GMObject} _item		Item to create	
///@return {id.Instance}
createSpecificItem = function(_player, _item) {
	for (var i = 0; i < array_length(itemDb); i++) {
		if (itemDb[i].object == _item) {
			return itemDb[i].create(_player)
		}
	}
	
	show_message("specified item not found of ID: " + string(_item))
	
	return 0
}

///@description							Creates an item of a specified rarity or rarities
///@param {id.Instance} _player			Player to create item for, if anyone
///@param {real|array<real>} _rarity	Specific rarity or list of valid rarities	
///@return {id.Instance}
createItem = function(_player = noone, _rarity = [enumRarity.normal]) {
	var _shuffled = array_shuffle(itemDb)
	
	if (!is_array(_rarity)) {
        if (_rarity = enumRarity.any) {
            _rarity = enumRarity.normal
        }
        
		_rarity = [_rarity]
	}
    
	for (var i = 0; i < array_length(_shuffled); i++) {
		if (array_contains(_rarity, _shuffled[i].rarity)) {
			return _shuffled[i].create(_player)			
		}
	}
	
    show_message("No item of rarity found: ")
    show_message(_rarity)
    show_message(itemDb)
    show_message(_shuffled)
	
	return noone
}

///@description							Creates an item of a specified rarity or rarities
///@param {real} _count					Amount of items to get (3)
///@param {real} _minRarity				Minimum rarity of the item
///@return {array<id.Instance>}
createItems = function(_count = 3, _minRarity = 0) {
	var _shuffled = array_shuffle(itemDb)
	var _mergers = []
	var _itemsFound = []
	var _sanity = 100
	var _skip = []
	
	if (_count > array_length(_shuffled)) {
		create_toaster("Count larger than merger itemDb", errorLevels.warning)
		_count = array_length(_shuffled)
	}
	
	while (array_length(_itemsFound) < _count) {
		var _rarity = get_random_rarity(_minRarity)
		
		for (var i = 0; i < array_length(_shuffled); i++) {
			if (array_contains(_skip, i)) {
				continue
			}
			
			if (_shuffled[i].rarity == _rarity) {
				array_push(_itemsFound, _shuffled[i].create())
				array_push(_skip, i)
				break
			}
		}
		
		_sanity--
		
		if (_sanity <= 0) {
			create_toaster("Couldn't find enough items", errorLevels.error)
		}
	}
	
	return _itemsFound
}
