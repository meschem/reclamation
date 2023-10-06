///@description					Description
///@param {real} type			Type of baddie. Uses enum "baddieSpecialTypes"
///@param {id.Instance} inst	Instance to change
function enhance_baddie(type, inst = id) {
	switch (type) {
		case baddieSpecialTypes.elite:
			inst.isElite = true
			inst.hpMax *= 10
			inst.hp = inst.hpMax
			inst.xp *= 10
			inst.damageOnHit *= 2
			inst.outlineColor = get_color(colors.yellow)
			
			add_loot(obj_rune_pickup, 1, inst)
		break
		
		case baddieSpecialTypes.boss:
			inst.isElite = true
			inst.hpMax *= 25
			inst.hp = inst.hpMax
			inst.xp *= 20
			inst.weight *= 2
			inst.damageOnHit *= 2
			inst.outlineColor = get_color(colors.red)
			inst.image_xscale = inst.bossScale
			inst.image_yscale = inst.bossScale
			
			add_loot(obj_ore, 1, inst)
		break
	}
}

enum baddieSpecialTypes {
	elite,
	boss
}