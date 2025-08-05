///@description		Setup

// Inherit the parent event
event_inherited()

name = "Assassinate"
description = "Deals heavy damage to a nearby unit. 25% chance to crit with base crit multiplier."

statBonuses = {
	str: "Increases Damage",
	dex: "Increases Crit Chance"
}

//onHitAbility = true
active = true
//selectionIcon = spr_abil_select_icon_bear_trap
treeLevel = 2

validationCdMax = 8
validationCdCur = 0

targets = ds_list_create()

curCd = 0
maxCd = seconds_to_frames(5)

autoCast = true
canAutoCast = true

radius = 100
critChance = 0.25

damage = [100, 150, 150, 250, 300]
cooldown = [
	seconds_to_frames(3),
	seconds_to_frames(3),
	seconds_to_frames(2),
	seconds_to_frames(2),
	seconds_to_frames(1.5),
]

stats = [
	new abilityStat(
		"Damage", "damage", damage
	),
	new abilityStat(
		"Cooldown", "cooldown", cooldown, true, statUnits.seconds
	)
]

addRune("Frenzy", "Critical hits from Assassinate reset cooldown")

onLevel = function() {
	maxCd = cooldown[level - 1]
}

validateUse = function() {
	if (validationCdCur > 0) {
		validationCdCur--

		return false
	}
	
	ds_list_clear(targets)
	
	var count = collision_circle_list(owner.x, owner.y, radius, obj_baddie, false, true, targets, true)

	if (count > 0) {
		return true
	}
	
	validationCdCur = validationCdMax
	
	return false
}

use = function () {	
	var _crit = (random(1) < critChance)
	var _critMultipler = get_player_stat(enumPlayerStats.critDamageMultiplier)
	
	if (ds_list_size(targets) > 0 && instance_exists(targets[| 0])) {
		damage_baddie(targets[| 0], damage[level - 1], _crit, _critMultipler, 1.5)
		
		instance_create_depth(targets[| 0].x, targets[| 0].y, depths.fx, obj_assassinate_x_fx)
		
		audio_play_sound(snd_squishy_slice_assassinate, 1, false)
	}
	
	if (_crit && runes[enumRunes.magdela].enabled) {
		maxCd = stf(0.1)
	}
}
