/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

dropCount = 5
openRange = 30 //bbox for unlocking
locked = true

coinOffset = new vec2(-16, 24)
costTextOffset = new vec2(-8, 18)

chestSize = lockedChestSizes.mega
cost = get_locked_chest_cost(chestSize)

dropMinRarities = [
    enumRarity.legendary
]
