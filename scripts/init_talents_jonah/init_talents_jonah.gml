// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init_talents_jonah() {	
	enum talentProps {
		enabled,
		hero,
		name,
		curLevel,
		maxLevel,
		levelRequirement,
		talentRequirement,
		rarity, // ranked rarity, 1-10, 10 is rarest
	}
	
	enum heroes {
		any,
		jonah
	}
	
	enum genTalents {
		moveSpeedUp,
		healthUp,
	}
	
	enum talentList {
		heavyHammers,
		shockwave,
		damageBoost,
		increasedRange,
		spikedArmor,
		stormAura,
		staticWeapon,
		stunningBolts,
		moveSpeedUp,
		healthUp,
		warStomp,
		charge,
		razors,
		length
	}
	
	for (var i = 0; i < talentList.length; i++) {
		obj_game_controller.talents[i][talentProps.enabled] = false
	}
	
	add_talent_to_pool(talentList.heavyHammers, "Heavy Hammer")
	add_talent_to_pool(talentList.shockwave, "Shockwave")
	add_talent_to_pool(talentList.damageBoost, "Damage Boost")
	add_talent_to_pool(talentList.increasedRange, "Increased Range")
	add_talent_to_pool(talentList.spikedArmor, "Spiked Armor")
	add_talent_to_pool(talentList.stormAura, "Storm Aura")
	add_talent_to_pool(talentList.moveSpeedUp, "Speed Boost")
	add_talent_to_pool(talentList.healthUp, "Health Boost")
	add_talent_to_pool(talentList.warStomp, "War Stomp")
	add_talent_to_pool(talentList.razors, "Razors")
}