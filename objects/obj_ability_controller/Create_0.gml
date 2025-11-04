
// currently loaded via load_abilities_for_hero()
allAbilities = [
	obj_ability_shock,
	obj_ability_lightning_rune,
	obj_ability_lightning_ball,
	obj_ability_war_stomp,
	obj_ability_thorns,
	
	obj_ability_poison_wave,
	obj_ability_spirit_wolf,
	obj_ability_toxic_swarm,
	obj_ability_bear_trap,
	obj_ability_assassinate
]

availableAbilities = []
availableUltimateAbilities = []
//sprite_index = icon

focused = false

uiController = create_instance(obj_ability_ui_controller)