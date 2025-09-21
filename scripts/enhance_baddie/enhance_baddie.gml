///@description					Converts a single unit to an elite or boss
///@param {real} type			Type of baddie. Uses enum "baddieSpecialTypes"
///@param {id.Instance} inst	Instance to change
function enhance_baddie(type, inst = id) {
	switch (type) {
		case baddieSpecialTypes.elite:
			inst.isElite = true
			inst.hpMax = baddie_hp_elite * get_baddie_scaling(baddieScalars.hp)
			inst.hp = inst.hpMax
			inst.xp = 250
			inst.damageOnHit *= 2
			inst.outlineColor = get_color(colors.yellow)
			inst.moveSpeedMax *= 1.33
			
			//add_loot(obj_rune_pickup, 1, inst)
			
			add_loot(obj_merger_item_chest, 1, inst)
		break
		
		case baddieSpecialTypes.boss:
			if (!inst.isBoss) {
				// "Bossify" if obj isn't explicitly defined as one
				inst.isElite = true
				inst.hpMax = baddie_hp_boss * get_baddie_scaling(baddieScalars.hp)
				inst.hp = inst.hpMax
				inst.xp = 500
				inst.weight *= 2
				inst.damageOnHit *= 2
				inst.image_xscale = inst.bossScale
				inst.image_yscale = inst.bossScale
				inst.moveSpeedMax *= 1.33
			}

			inst.outlineColor = get_color(colors.red)
			
			add_loot(obj_ore, 1, inst)
		break
	}
}

enum baddieSpecialTypes {
	elite,
	boss
}