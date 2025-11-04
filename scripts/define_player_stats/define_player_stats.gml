// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function define_player_stats() {
	
	var _key = 0
	
	_key = enumPlayerStats.maxHp
	stats[$ _key] = new playerStat(
		_key,
		"Hit Points",
		function() {
			var statValue = get_player_stat(enumPlayerStats.maxHp)
			return (statValue / 10)
		},
		"Running out of HP is generally considered very poor for your health."
	)
	
	_key = enumPlayerStats.str
	stats[$ _key] = new playerStat(
		_key,
		"Strength",
		function() {
			var statValue = get_player_stat(enumPlayerStats.str)
			return string(statValue)
		},
		"Core stat. A precise representation of how many cinder blocks your can chop through in a single blow.\n\n * Increases |Physical Damage| by 1 per point.\n * Increases |Knockback| by 1 per point.\n * Increases |HP| by 1 per 10 points."
	)
	
	_key = enumPlayerStats.dex
	stats[$ _key] = new playerStat(
		_key,
		"Dexterity",
		function() {
			var statValue = get_player_stat(enumPlayerStats.dex)
			return string(statValue)
		},
		"Core stat. A marker for how quick you are on your feet and hands.\n\n * Increases |Attack Apeed|.\n * Improves |Active Ability Cooldown|.\n * Increases |Move Speed|."
	)
	
	_key = enumPlayerStats.int
	stats[$ _key] = new playerStat(
		_key,
		"Intelligence",
		function() {
			var statValue = get_player_stat(enumPlayerStats.int)
			return string(statValue)
		},
		"Core stat. Represents how smart you actually are, not just how smart you think you are.\n\n * Increase |Magic Damage| by 1 per point.\n * Improves |Ability Cooldown|.\n * Improves |Ultimate Charge Rate|."
	)
	
	_key = enumPlayerStats.damageScalar
	stats[$ _key] = new playerStat(
		_key,
		"Physical Damage",
		function() {
			var statValue = get_player_stat(enumPlayerStats.damageScalar)
			statValue = round(statValue * 100)
			return string(statValue) + "%"
		},
		"Scales up any damage marked as physical, including |Piercing| and |Crushing|."
	)
	
	_key = enumPlayerStats.abilityDamageScalar
	stats[$ _key] = new playerStat(
		_key,
		"Magic Damage",
		function() {
			var statValue = get_player_stat(enumPlayerStats.abilityDamageScalar)
			statValue = round(statValue * 100)
			return string(statValue) + "%"
		},
		"Scales up any damage marked as magical, including |Fire|, |Lightning|, and |Ice|.\n\nDoes NOT scale |Poison| damage."
	)
	
	_key = enumPlayerStats.critChance
	stats[$ _key] = new playerStat(
		_key,
		"Crit Chance",
		function() {
			var statValue = get_player_stat(enumPlayerStats.critChance)
			statValue = round(statValue * 100)
			return string(statValue) + "%"
		},
		"Chance to deal critical damage on hit. Affects all |Physical Damage|."
	)
	
	_key = enumPlayerStats.critDamageMultiplier
	stats[$ _key] = new playerStat(
		_key,
		"Crit Multiplier",
		function() {
			var statValue = get_player_stat(enumPlayerStats.critDamageMultiplier)
			statValue = round(statValue * 100)
			return string(statValue) + "%"
		},
		"Determines how much damage critical hits deal. Affects all |Physical Damage|."
	)
	
	_key = enumPlayerStats.abilityCooldownScalar
	stats[$ _key] = new playerStat(
		_key,
		"Ability Cooldown",
		function() {
			var statValue = get_player_stat(enumPlayerStats.abilityCooldownScalar)
			statValue = round(statValue * 100)
			return string(statValue) + "%"
		},
		"Increases how fast your abilities activate. Includes |Item Passives| unless otherwise noted.\n\nDoes NOT improve |Ultimate Charge Rate|."
	)
	
	_key = enumPlayerStats.areaOfEffectScalar
	stats[$ _key] = new playerStat(
		_key,
		"Area of Effect",
		function() {
			var statValue = get_player_stat(enumPlayerStats.areaOfEffectScalar)
			statValue = round(statValue * 100)
			return string(statValue) + "%"
		},
		"Increases the size of your abilities. Depending on the ability, this may affect size of projectiles and/or damage."
	)
	
	_key = enumPlayerStats.attackSpeedScalar
	stats[$ _key] = new playerStat(
		_key,
		"Attack Speed",
		function() {
			var statValue = get_player_stat(enumPlayerStats.attackSpeedScalar)
			statValue = round(statValue * 100)
			return string(statValue) + "%"
		},
		"Increases how fast you attack with your weapon."
	)
	
	_key = enumPlayerStats.moveSpeedMax
	stats[$ _key] = new playerStat(
		_key,
		"Move Speed",
		function() {
			var statValue = get_player_stat(enumPlayerStats.moveSpeedMax) * 10
			return string(statValue)
		},
		"Determines how fast those little legs can move you around."
	)
	
	_key = enumPlayerStats.knockbackScalar
	stats[$ _key] = new playerStat(
		_key,
		"Knockback",
		function() {
			var statValue = get_player_stat(enumPlayerStats.knockbackScalar)
			statValue = round(statValue * 100)
			return string(statValue) + "%"
		},
		"Increases the pushback distance when knockback is applied to enemies."
	)
	
	_key = enumPlayerStats.bonusProjectileCount
	stats[$ _key] = new playerStat(
		_key,
		"Projectile Count",
		function() {
			var statValue = get_player_stat(enumPlayerStats.bonusProjectileCount)
			return string(statValue)
		},
		"Increases the number of projectiles for abilities."
	)
	
	_key = enumPlayerStats.pickupRangeScalar
	stats[$ _key] = new playerStat(
		_key,
		"Pickup Range",
		function() {
			var statValue = get_player_stat(enumPlayerStats.pickupRangeScalar)
			statValue = round(statValue * 100)
			return string(statValue) + "%"
		},
		"Affects how far away you can pick up items."
	)
	
	_key = enumPlayerStats.pickupRewardScalar
	stats[$ _key] = new playerStat(
		_key,
		"Pickup Reward",
		function() {
			var statValue = get_player_stat(enumPlayerStats.pickupRewardScalar)
			statValue = round(statValue * 100)
			return string(statValue) + "%"
		},
		"Somehow improves the value of items you pickup.\n\nResults are always rounded down, included for health."
	)
	
	_key = enumPlayerStats.magicFind
	stats[$ _key] = new playerStat(
		_key,
		"Magic Find",
		function() {
			var statValue = get_player_stat(enumPlayerStats.magicFind)
			statValue = round(statValue * 100)
			return string(statValue)
		},
		"Improves the frequency and rarity of dropped items. This is not a direct percentage and provides diminishing returns."
	)
}
