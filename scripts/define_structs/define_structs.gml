///@description   Defines structs for project

function define_structs() { }

#macro XBOX_INPUT_A gp_face1
#macro XBOX_INPUT_B gp_face2
#macro XBOX_INPUT_X gp_face3
#macro XBOX_INPUT_Y gp_face4

enum enumLootType {
	gold,
	equipment,
	general,
}

enum enumStatUnits {
	none,
	meters,
	percent,
	length,
}

enum enumTrailStyle {
	line
}

///@description						Provides bonus functionality for abilities when stat reqs are met
///@param {real} _stat				Stat to check. Uses enumCharStats
///@param {real} _requiredAmount	Amount of stat required to activate
///@param {string} _name			Name display to player
///@param {string} _description		Description of what this bonus does
function abilityStatBonus(_stat, _requiredAmount, _name, _description) constructor {
	stat = _stat
	active = false
	amount = _requiredAmount
	name = _name
	description = _description
}

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

///description						Merger item
///@param {string} _name			Name of item
///@param {string} _description		Description of item
///@param {asset.GMObject} _object	Object to use
///@param {asset.GMSprite} _icon	Icon of item
///@param {real} _rarity			Rarity of item, enumRarity
function mergerItemTemplate(_name, _description, _object, _icon, _rarity = enumRarity.normal) constructor {
	name = _name
	description = _description
	object = _object
	icon = _icon
	rarity = _rarity
	
	///@description						Creates the item for the player
	///@param {id.Instance} _player		Player to create the object for
	///@return {id.Instance}
	create = function(_player = noone) {
		var _inst = create_instance(object)
		
		_inst.name = name
		_inst.description = description
		_inst.sprite_index = icon
		_inst.rarity = rarity
		
		_inst.owner = _player
		
		if (_player != noone) {
			_player.backpack.addItem(_inst)
		}
		
		return _inst
	}
	
	///@description						Gets text for stat info
	///@return [array<string>]
	getStatText = function() {
		var _stats = [
			"+1 Fake Stat",
			"+10 Other Fake Stat"
		]
		
		return _stats
	}
}

///@description							Trail segment drawn behind objects
///@param {struct.vec2} _startPos
///@param {struct.vec2} _endPos
///@param {real} _startWidth
///@param {real} _endWidth
///@param {constant.Color} _color
///@param {real} _style
function trailSegment(_startPos, _endPos, _startWidth = 0, _endWidth = 0, _color = c_yellow, _style = enumTrailStyle.line) constructor {
	startPos = _startPos
	endPos = _endPos
	startWidth = _startWidth
	endWidth = _endWidth
	color = _color
	style = _style
	
	// Currently basic with lines
	draw = function() {
		//show_message([
		//	point_distance(
		//		startPos.x,
		//		startPos.y,
		//		endPos.x,
		//		endPos.y,
		//	),
		//	startPos,
		//	endPos,
		//	startWidth
		//])
		draw_line_width_color(
			startPos.x,
			startPos.y,
			endPos.x,
			endPos.y,
			startWidth,
			color,
			color
		)
	}
}

///@description						Defines an item stat type. These are defined in define_item_stats
///@param {string} _name			Display name for the variable
///@param {string} _bonusVar		Variable which references the bonus provides (on player and item)
///@param {string} _playerVar		Variable which references the players current value
///@param {string} _unit			Uses enumStatUnits. Unit used to display data.
///@param {real} _previousAmount	If this is an upgrade, previous amount
function itemStatType(_name, _bonusVar, _playerVar, _unit = statUnits.none) constructor {
	displayName = _name
	bonusVar = _bonusVar
	playerVar = _playerVar
	unit = get_stat_unit_from_enum(_unit)
}

///@description						Adds an item stat
///@param {real} _stat				uses enumItemStats
///@param {array} _values			List of values per level
///@param {bool} _display			Determines whether this stat is visible
///@param {struct} _customType		Must include displayName (string), unitEnum (statUnits)
function itemStat(_stat, _values, _display = true, _customType = {}) constructor {
	stat = _stat
	
	values = (is_array(_values)) ? _values : [_values]
	display = _display
		
	if (_stat != enumItemStats.custom) {
		type = get_item_stat_type(stat)
		unit = get_stat_unit_from_enum(type.unitEnum)
	} else {
		// FIXME: GENERAL - does not support bonusVar and playerVar members. Will crash if referenced
		type = _customType
		unit = get_stat_unit_from_enum(type.unitEnum)
		
		if (!variable_struct_exists(type, "prepend")) {
			type.prepend = false
		}
	}

	///@return {string}
	getDisplayName = function() {
		return type.displayName
	}
	
	///@param {real} _level
	///@return {string}
	getDisplayValue = function(_level = 0) {
		var _rawValue = values[_level]
		var _numeric = _rawValue * unit.multiplier
		var _prepend = ""
		
		if (type.prepend) {
			_prepend = (_numeric > 0) ? "+" : "" 
		} 
		//else {
		//	_prepend = ""
		//}
		
		return $"{_prepend}{_numeric}{unit.displayUnit}"
	}
}


///@description						Adds a weapon stat. These always represent the current state of the weapon. Always visible.
///@param {real} _stat				uses enum enumWeaponStats
///@param {id.Instance} _weapon		Value of stat
///@param {struct} _customType		Must include displayName (string), unitEnum (statUnits)
function weaponStat(_stat, _weapon, _customType = {}) constructor {
	weapon = _weapon
	stat = _stat
	
	if (_stat != enumWeaponStats.custom) {
		type = get_weapon_stat_type(_stat)
	} else {
		type = _customType
	}
	
	unit = get_stat_unit_from_enum(type.unitEnum)
	
	getDisplayName = function() {
		return type.displayName
	}
	
	///@return {string}
	getDisplayValue = function() {
		return $"{weapon.getWeaponStatValue(stat) * unit.multiplier}{unit.displayUnit}"
	}
}

///@description						Stat that can be applied to anything
///@param {string} _name			Human-readable name of the stat
///@param {string} _variable		Variable to adjust
///@param {array<real>} _values		Values to apply at different levels
///@param {bool} _display			Display value in tooltips and prompts
///@param {real} _unitEnum			Uses enum statUnits. Defaults to none.
///@param {real} _multiplier		Display multplier if statsUnits is none
function abilityStat(_name, _variable, _values = [], _display = true, _unitEnum = statUnits.auto, _multiplier = 1) constructor {
	name = _name
	variable = _variable
	values = _values
	display = _display
	
	if (_unitEnum == statUnits.auto) {
		unit = get_stat_unit_from_name(_name)
	} else {
		unit = get_stat_unit_from_enum(_unitEnum)
	}
	
	///@description			Gets the numeric value and unit as a single string
	///@param {real} _level	Level of the ability to get
	///@return {string}
	getDisplayValue = function(_level) {
		if (_level == 0) {
			var _rawValue = values[_level]
			var _numeric = _rawValue * unit.multiplier
		
			return $"{_numeric}{unit.displayUnit}"
		}
		
		var _rawValue = values[_level]
		var _rawValueOld = values[_level - 1]
		
		var _numeric = _rawValue * unit.multiplier
		var _numericOld = _rawValueOld * unit.multiplier
		
		return $"{_numericOld} > {_numeric}{unit.displayUnit}"
	}
	
	///@description			Determines if this should be displayed on a level up
	///@param {real} _level	Level of the ability to get
	///@return {bool}
	displayOnLevelUp = function(_level) {
		if (_level == 0) {
			return true
		}
		
		var _rawValue = values[_level] - values[_level - 1]
		
		if (_rawValue != 0) {
			return true
		}
		
		return false
	}
}

///@param {real} _multiplier		Multiplier to use for displaying the value
///@param {string} _displayUnit		Displayed after the number
///@param {bool} _prepend			Prepend stat with + or -
function statUnit(_multiplier, _displayUnit, _prepend = true) constructor {
	multiplier = _multiplier
	displayUnit = _displayUnit
	prepend = _prepend
}

///@description						Provides info for leveling an ability
///@param {string} _description		Description for leveling up
///@param {array<struct>} _stats	Array of abilityStat variables
function abilityLevelInfo(_description, _stats) constructor {
	description = _description
	stats = _stats
}

///@description						Loot component for a baddies
///@param {real} _lootType			Uses enumLootType to add a type of loot
///@param {id.Instance} _owner		Owner of said loot component
///@param {real} _chance			Odds of this dropping from 0 to 1.0
///@param {real} _amountMin			Minimum value or amount
///@param {real} _amountMax			Maximum value or amount
function lootComponent(_lootType, _owner, _chance = 1, _amountMin = 1, _amountMax = 1, _object = obj_none) constructor {
	lootType = _lootType
	chance = _chance
	amountMin = _amountMin
	amountMax = _amountMax
	object = _object
	owner = _owner
	
	///@description					Drops Loot
	///@return {id.Instance}		Dropped loot. Returns noone if drop fails
	drop = function() {
		if (random(1) > chance) {
			show_message("loot not dropped")
			return noone
		}
		
		var amount = irandom_range(amountMin, amountMax)
		
		if (lootType == enumLootType.gold) {
			drop_gold(amount, owner.x, owner.y)
		} else if (lootType == enumLootType.general) {
			drop_object(object, owner.x, owner.y)
		} else {
			show_debug_message("Loot type not implemented")
		}
	}
}

///@description						Stat for a player character that is referenced as needed
///@param {string} _name			Human readable name of the stat
///@param {real} _baseValue
function playerStat_OLD(_name, _baseValue) constructor {
	name = _name
	baseValue = _baseValue
	value = baseValue
	
	scalar = 1
	preScalarAdditive = 0
	postScalarAdditive = 0
	
	///@description					Updates value
	function update() {
		baseValue = ((preScalarAdditive + baseValue) * scalar) + postScalarAdditive
	}
	
	///@description					Sets scalar to a value
	///@param {real} value			Value to set scalar to
	function setScalar(value) {
		scalar = value
		update()
	}
	
	///@description					Sets pre-scalar to a value, effectively increasing base
	///@param {real} value			Value to set scalar to
	function setPreScalarAdditive(value) {
		preScalarAdditive = value
		update()
	}
	
	///@description					Sets post-scalar to a value
	///@param {real} value			Value to set scalar to
	function setPostScalarAdditive(value) {
		postScalarAdditive = value
		update()
	}
}

///@description						Pairing of instance and clearframe to manage hitList arrays
///@param {id.Instance} _instance	Instance to reference
///@param {real} _maxAge			How many frames before the instance is cleared
function hitListEntry(_instance, _maxAge) constructor {
	instance = _instance
	clearFrame = get_current_frame() + _maxAge
}

///@description						Used to store and retrieve info for ability trees
///@param {id.GMObject} treeObjId	Object ID of a tree
function abilityTreeStore(treeObjId) constructor {
	objId = treeObjId
	abilities = []
	
	///@description					Stores all ability tree levels
	store = function() {
		var abils = abilities

		with (objId) {
			for (var i = 0; i < array_length(abilities); i++) {
				array_push(abils, new vec2(abilities[i].object_index, abilities[i].level))
			}
		}
	}
	
	///@description					Applies tree levels to requested player
	retrieve = function() {
		for (var i = 0; i < array_length(abilities); i++) {
			var treeObjId = abilities[i].x
			var storeLevel = abilities[i].y

			with (treeObjId) {
				for (var j = 0; j < storeLevel; j++) {
					levelUp()
				}
			}
		}
	}
}

function keyMouseInput() constructor {
	moveUp = ord("W")
	moveRight = ord("D")
	moveDown = ord("S")
	moveLeft = ord("A")
	
	useWeaponPrimary = mb_left
	useWeaponSecondary = mb_right
	
	useAbility = [
		vk_shift, // always active
		ord("E"),
		ord("L"),
		ord("G"),
		//ord("T")  // always ault
	]
	
	useDefensive = vk_shift
	useUltimate = ord("T")
}

function gamepadInput() constructor {
	useAbility = [
		gp_shoulderr, // always active
		gp_shoulderl,
		gp_shoulderrb,
		gp_shoulderlb,
		gp_face2	   // always ult
	]
	
	useDefensive = XBOX_INPUT_B
	useUltimate = XBOX_INPUT_Y
}

///@param {real} _top
///@param {real} _right
///@param {real} _bottom
///@param {real} _left
function bounds(_top, _right, _bottom, _left) constructor {
	top = _top
	right = _right
	bottom = _bottom
	left = _left
}

///@param {real} _x
///@param {real} _y
function vec2(_x = 0, _y = 0) constructor {
	x = _x
	y = _y
}

///@param {string} _body  
///@param {asset.GMFont}  _font 
///@param {real}  _color
///@param {any} _location 
///@param {bool} _centered 
///@param {real} _maxWidth
function text(_body, _font, _color, _location, _centered = false, _maxWidth = -1) constructor {
	body = _body
	font = _font
	color = _color
	location = _location
	centered = _centered
	maxWidth = _maxWidth
	
	///@param {real} _xOffset
	///@param {real} _yOffset
	static draw = function(_xOffset = 0, _yOffset = 0) {
		draw_text_ext_color(
			location.x + _xOffset,
			location.y + _yOffset,
			body,
			14, 
			maxWidth,
			color, color, color, color,
			1
		)
	}
}

///@description						Equipment slots for the player
///@param {real} slot				Slot this takes up on a character
///@param {asset.GMObject} object	Object to reference
function equipmentSlot(slot, object = obj_none) constructor {
	
}