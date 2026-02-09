///@description					Adds gold loot to a baddie
///@param {real} amountMin		Min amount to add
///@param {real} amountMax		Max amount to add
///@param {real} chance			Odds of loot dropping
///@param {id.Instance}	inst	Instance to add loot to
function add_loot_gold(amountMin = 3, amountMax = 5, chance = 1, inst = id) {
	if (random(1) < chance) {
		var loot = new lootComponent(enumLootType.gold, inst, 1, amountMin, amountMax)
	
		array_push(inst.loot, loot)
	}
}
