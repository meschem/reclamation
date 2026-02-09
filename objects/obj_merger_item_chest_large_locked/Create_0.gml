/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

dropCount = 3
openRange = 30 //bbox for unlocking
locked = true

coinOffset = new vec2(-11, 22)
costTextOffset = new vec2(-3, 16)

chestSize = lockedChestSizes.large
cost = get_locked_chest_cost(chestSize)

dropMinRarities = [
    enumRarity.magic
]