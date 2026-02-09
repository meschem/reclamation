///@description						Adds gold loot to a baddie
///@param {asset.GMObject} type		Type of loot to add
///@param {real} chance				Odds of loot dropping
///@param {id.Instance}	inst		Instance to add loot to
function add_loot(type, chance = 1, inst = id) {
	var loot = new lootComponent(enumLootType.general, inst, chance)

	loot.object = type
	
	array_push(inst.loot, loot)
}
