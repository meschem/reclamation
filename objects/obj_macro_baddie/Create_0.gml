/// @description Define baddie macros

// Weights
// Variable: weight
// Used to determine how heavy a character is. Customizable.
#macro baddie_weight_none 0
#macro baddie_weight_light 4
#macro baddie_weight_med 8
#macro baddie_weight_heavy 16
#macro baddie_weight_massive 25
#macro baddie_weight_immovable 999999

// HP
// Variable: hp / hpMax
#macro baddie_hp_very_low 5
#macro baddie_hp_low 20
#macro baddie_hp_medium 35
#macro baddie_hp_high 50
#macro baddie_hp_very_high 100
#macro baddie_hp_massive 200
#macro baddie_hp_ultra_massive 500
#macro baddie_hp_elite_minion 150
#macro baddie_hp_elite 500
#macro baddie_hp_boss 1000

// Move Accel
// Variable: moveAccel
// Speed per frame
#macro baddie_move_accel_very_slow 0.025
#macro baddie_move_accel_slow 0.05
#macro baddie_move_accel_med 0.1
#macro baddie_move_accel_fast 0.2

// Move Speed
// Variable: moveSpeedMax
// Max speed
#macro baddie_move_speed_very_slow 0.2
#macro baddie_move_speed_slow 0.4
#macro baddie_move_speed_medium 0.6
#macro baddie_move_speed_fast 0.9
#macro baddie_move_speed_very_fast 1.2
#macro baddie_move_speed_very_fast_plus 1.5
#macro baddie_move_speed_ultra_fast 1.8

// Experience
// Variable: xp
// Experience granted on killing the AI
#macro baddie_xp_pest 10
#macro baddie_xp_fodder 25
#macro baddie_xp_tough 120
#macro baddie_xp_brutal 250
#macro baddie_xp_brutal_plus 500
#macro baddie_xp_elite 1500
#macro baddie_xp_boss 5000

// Collision Arrays
// Variable: collidesWith
// Array checked for instance_place
#macro baddie_collision_walker [obj_pit, obj_doodad, obj_destructible]
#macro baddie_collision_flier [obj_solid, obj_doodad, obj_destructible]
#macro baddie_collision_phaser []

// Minion Sizes
// Variable: minionCount
// Amount of minions to spawn for an elite
#macro baddie_minion_count_pest 20
#macro baddie_minion_count_fodder 16
#macro baddie_minion_count_tough 8
#macro baddie_minion_count_brutal 4

// Ult Charge
// Variable: ultimateChargeAmount
// Charges player ultimate
#macro baddie_ultimate_charge_pest 1
#macro baddie_ultimate_charge_fodder 5
#macro baddie_ultimate_charge_tough  15
#macro baddie_ultimate_charge_brutal 40
#macro baddie_ultimate_charge_brutal_plus 60
#macro baddie_ultimate_charge_elite  100
#macro baddie_ultimate_charge_boss   200

// Loot (Gold)
// Variable: ?
// Runs function to add loot for a character
#macro add_baddie_gold_pest add_loot_gold(1, 2, 0.125)
#macro add_baddie_gold_fodder add_loot_gold(2, 4, 0.5)
#macro add_baddie_gold_tough add_loot_gold(8, 12, 1)
#macro add_baddie_gold_brutal add_loot_gold(30, 50, 1)
#macro add_baddie_gold_brutal_plus add_loot_gold(50, 100, 1)
#macro add_baddie_gold_brutal_elite add_loot_gold(200, 300, 1)
#macro add_baddie_gold_brutal_boss add_loot_gold(450, 550, 1)
