///@description		Init
event_inherited()

name = "Visceral Mark"
description = "Marks a random enemy for an explosive death."

cooldown = [5, 4, 3, 2, 2]
radius = [80, 80, 80, 80, 120]
damage = [20, 25, 30, 35, 40]
buffInst = noone

cdCur = 0
cdMax = cooldown[0]

stats = [
	new itemStat(enumItemStats.custom, cooldown, true, {
		displayName: "Cooldown",
		unitEnum: statUnits.frames,
		prepend: false
	}),
	new itemStat(enumItemStats.custom, radius, true, {
		displayName: "Radius",
		unitEnum: statUnits.meters,
		prepend: false
	}),
	new itemStat(enumItemStats.custom, damage, true, {
		displayName: "Damage",
		unitEnum: statUnits.none,
		prepend: false
	})
]

///@param {id.Instance} _baddie		Baddie that is exploding
onBaddieDeath = function(_baddie) {
	var _rad = radius[level - 1]
	var _dmg = damage[level - 1]
	
	damage_baddies_in_radius(new vec2(_baddie.x, _baddie.y), _rad, _dmg, owner)
	var _inst = create_fx_fading_circle(_baddie.x, _baddie.y, _rad, 60, c_red)
	_inst.alphaStart = 0.66
}
