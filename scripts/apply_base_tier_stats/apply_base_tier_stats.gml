///@description					Applies base tier stats based ona tier
///@param {real} _baddieTier	Uses enum baddieTier
function apply_base_tier_stats(_baddieTier) {
	switch (_baddieTier) {
		case baddieTiers.pest:
			tier = baddieTiers.pest
			xp = baddie_xp_pest
			ultimateCharge = baddie_ultimate_charge_pest
			weight = baddie_weight_none
			minionCount = baddie_minion_count_pest			
			hpMax = baddie_hp_very_low
			hp = hpMax
		break
		
		case baddieTiers.small:
			tier = baddieTiers.small
			xp = baddie_xp_fodder
			ultimateCharge = baddie_ultimate_charge_fodder
			weight = baddie_weight_light
			minionCount = baddie_minion_count_fodder
			hpMax = baddie_hp_low
			hp = hpMax
		break
		
		case baddieTiers.medium:
			tier = baddieTiers.medium
			xp = baddie_xp_tough
			ultimateCharge = baddie_ultimate_charge_tough
			weight = baddie_weight_med
			minionCount = baddie_minion_count_tough
			hpMax = baddie_hp_medium
			hp = hpMax
		break
		
		case baddieTiers.large:
			tier = baddieTiers.large
			xp = baddie_xp_brutal
			ultimateCharge = baddie_ultimate_charge_brutal
			weight = baddie_weight_heavy
			minionCount = baddie_minion_count_brutal
			hpMax = baddie_hp_high
			hp = hpMax
		break
		
		case baddieTiers.veryLarge:
			tier = baddieTiers.veryLarge
			xp = baddie_xp_brutal_plus
			ultimateCharge = baddie_ultimate_charge_brutal_plus
			weight = baddie_weight_massive
			minionCount = baddie_minion_count_brutal
			hpMax = baddie_hp_very_high
			hp = hpMax
		break
		
		case baddieTiers.boss:
			tier = baddieTiers.boss
			xp = baddie_xp_boss
			ultimateCharge = baddie_ultimate_charge_boss
			weight = baddie_weight_massive
			minionCount = baddie_minion_count_brutal
			hpMax = baddie_hp_boss
			hp = hpMax
		break
		
		default:
			show_message("Bad baddieTier set")
		break
	}
}
