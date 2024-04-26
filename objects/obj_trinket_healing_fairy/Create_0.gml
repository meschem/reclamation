
event_inherited()

name = "Healing Fairy"
description = "Heals you on taking damage after a delay. Only 1 heal can be active at any time."
rarity = enumRarity.rare

healDelay = [20, 16, 12, 8, 5]

stats = [
	new itemStat(enumItemStats.custom, healDelay, true, {
		displayName: "Heal Delay",
		unitEnum: statUnits.seconds,
		prepend: false
	})
]

activateOnHit = function() {
	var _playerHasFairy = false
	
	with (obj_buff_healing_fairy) {
		_playerHasFairy = true
	}
	
	if (!_playerHasFairy) {
		var _inst = instance_create_depth(
			x - 300, y - 800, depths.player, obj_buff_healing_fairy
		)
		
		_inst.timer = seconds_to_frames(healDelay[level - 1])
	}
}

onLevelUp = function() {
	if (level == 1) {
		array_push(owner.onHitAbilities, id)
	}
}